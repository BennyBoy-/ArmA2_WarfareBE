/*
	Crashed UAV, east and west need to take back the module.
		This mission is triggered for all defined side.
*/
Private ['_attempts','_boundariesxy','_completeList','_completeListTr','_crashed','_craters','_defensePos','_east','_eastUAV','_ecomplete','_end','_espos','_eteam','_eteamname','_eteamrunning','_jipHandler','_list','_markerSize','_near','_nearUav','_pos','_ran','_randomPos','_resistance','_returned','_safeRadius','_size','_spawnUnits','_team','_uav','_uavModel','_uniqueIndex','_uniqueLabel','_unit','_units','_vehicles','_waitFor','_wcomplete','_west','_westUAV','_winner','_wspos','_wteam','_wteamname','_wteamrunning'];

_uniqueLabel = _this select 0;
_uniqueIndex = _this select 1;
_sides = _this select 2;

{missionNamespace setVariable [Format['_WFBE_M_RUNNINGMISSIONS_%1', _x],(missionNamespace getVariable Format['_WFBE_M_RUNNINGMISSIONS_%1', _x]) + 1]} forEach _sides;
["INITIALIZATION", "M_UAV_RetrieveModule.sqf: Started mission."] Call WFBE_CO_FNC_LogContent;

_randomPos = [];
//--- Marker size.
_markerSize = 750;

//--- Is boundaries enabled?
_boundariesxy = missionNamespace getVariable 'WFBE_BOUNDARIESXY';
if !(isNil '_boundariesxy') then {
	//--- Use the boundaries to get a position, limit it to a possible location (not outside of the map).
	_boundariesxy = _boundariesxy - (_markerSize*2);
	if (_boundariesxy <= 0) then {_boundariesxy = (missionNamespace getVariable 'WFBE_BOUNDARIESXY')};
	
	_safeRadius = 750;
	_attempts = 0;
	
	//--- Get a safe 'clear' position for a crash site.
	while {_attempts != -1} do {
		sleep 0.005;
		
		_attempts = _attempts + 1;
		
		_randomPos = [_markerSize + (random _boundariesxy),_markerSize + (random _boundariesxy),0];
		
		//--- Water-free & building free
		if (count (_randomPos isFlatEmpty [20/8,0,0.6,20,0,false,objNull]) > 0) then {
			//--- We don't want any 'living' units around.
			if (count(_randomPos nearEntities [['Man','Car','Motorcycle','Ship','Air','Tank','StaticWeapon'],_safeRadius/2]) == 0) exitWith {_attempts = -1};
			
			//--- Result may vary.
			if (_attempts > 250 && _safeRadius > 10) then {
				_attempts = 0;
				_safeRadius = _safeRadius - 100;
				if (_safeRadius < 10) then {_safeRadius = 10};
			};
		};
	};
} else {
	//--- Get a random location around a town.
	_pos = getPos (towns select round(random((count towns) -1)));
	
	_safeRadius = 500;
	_attempts = 0;
	
	//--- Get a safe 'clear' position for a crash site.
	while {_attempts != -1} do {
		sleep 0.01;
		
		_attempts = _attempts + 1;
		
		_randomPos = [(_pos select 0) + random(_safeRadius)-random(_safeRadius),(_pos select 1) + random(_safeRadius)-random(_safeRadius),0];
		
		//--- Water-free & building free
		if (count (_randomPos isFlatEmpty [20/8,0,0.6,20,0,false,objNull]) > 0) then {
			//--- We don't want any 'living' units around.
			if (count(_randomPos nearEntities [['Man','Car','Motorcycle','Ship','Air','Tank','StaticWeapon'],_safeRadius/2]) == 0) exitWith {_attempts = -1};
			
			//--- Result may vary.
			if (_attempts > 50) then {
				_attempts = 0;
				_safeRadius = _safeRadius + 200;
				if (_safeRadius > 1500) then {attempts = -1;_randomPos = []};
			};
		};
	};
};

//--- No suitable position found? exit.
if (count _randomPos == 0) exitWith {
	["INITIALIZATION", "M_UAV_RetrieveModule.sqf: Unable to determine a spawn location."] Call WFBE_CO_FNC_LogContent;
	{missionNamespace setVariable [Format['_WFBE_M_RUNNINGMISSIONS_%1', _x],(missionNamespace getVariable Format['_WFBE_M_RUNNINGMISSIONS_%1', _x]) - 1]} forEach _sides;
};

//--- Define the context.
_eastUAV = missionNamespace getVariable 'WFBE_EASTUAV';
_westUAV = missionNamespace getVariable 'WFBE_WESTUAV';

//--- No suitable UAV models? exit.
if (isNil '_eastUAV' && isNil '_westUAV') exitWith {
	["INITIALIZATION", "M_UAV_RetrieveModule.sqf: Unable to get a suitable UAV Model."] Call WFBE_CO_FNC_LogContent;
	{missionNamespace setVariable [Format['_WFBE_M_RUNNINGMISSIONS_%1', _x],(missionNamespace getVariable Format['_WFBE_M_RUNNINGMISSIONS_%1', _x]) - 1]} forEach _sides;
};

//--- Radio both side for a new mission available
{[_x,"NewMissionAvailable"] Spawn SideMessage} forEach [west,east];

//--- Determine which one to use.
_crashed = civilian;
if (isNil '_eastUAV' || isNil '_westUAV') then {
	_crashed = if (isNil '_eastUAV') then {west} else {east};
} else {
	_crashed = if (random 100 > 25) then {west} else {east};
};

//--- Place and destroy the uav.
_uavModel = if (_crashed == west) then {_westUAV} else {_eastUAV};
_uav = _uavModel createVehicle (_randomPos);
_uav setDammage 1;

//--- Garbage protection.
if !(WF_A2_Vanilla) then {_uav setVariable ["wfbe_trashable", false]};
_uav setVariable ['keepAlive',true,true]; //--- Salvager protection.

//--- Determine if the uav is held by resistance forces or not.
_spawnUnits = 0 Spawn {};
_team = objNull;
_units = [];
_vehicles = [];
if (random 100 > 35) then {
	//--- Pick a resistance patrol template (Only the light & medium one).
	_teamType = missionNamespace getVariable Format ["WFBE_GUER_PATROL_%1",["LIGHT","MEDIUM"] select floor (random 2)];
	_teamType = _teamType select floor(random count _teamType);
	
	//--- Get the team spawn position.
	_defensePos = [[(_randomPos select 0)+random(150)-random(150),(_randomPos select 1)+random(150)-random(150)], 250] Call GetSafePlace;
	
	//--- Create the team.
	_returned = [_list, _defensePos, resistance, if ((missionNamespace getVariable "WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER") > 0) then {true} else {false}, objNull, false] Call WFBE_CO_FNC_CreateTeam;
	_units = _returned select 0;
	_vehicles = _returned select 1;
	_team = _returned select 2;
	
	//--- Start the hunt/guard script.
	_spawnUnits = [_units,_vehicles,_randomPos,_markerSize] Spawn {
		Private ['_area','_guard','_objects','_target','_targets','_units','_vehicles'];
		_units = _this select 0;
		_vehicles = _this select 1;
		_guard = _this select 2;
		_area = _this select 3;
		
		while {({alive _x} count _units) > 0} do {
			sleep 20;
		
			_targets = _guard nearEntities [['Man','Car','Motorcycle','Ship','Air','Tank','StaticWeapon'],_area];
			_objects = _targets;
			{
				if !(_x isKindOf 'Man') then {if (count (crew _x) == 0) then {_objects = _objects - [_x]}};
				if (side _x == resistance || side _x == civilian) then {_objects = _objects - [_x]};
			} forEach _targets;
			
			_target = [_guard,_objects] Call WFBE_CO_FNC_GetClosestEntity;
			
			if (!isNull _target) then {
				(_units) commandMove [(getPos _target select 0)-random(60)+random(60), (getPos _target select 1)-random(60)+random(60), 0];
			};			
		};
	};
};

//--- Send to client, task, size, etc.
{[_x, "SECOPS_ReceiveMission", ["M_UAV_RetrieveModule",_markerSize,_uniqueLabel,_uniqueIndex,_uav]] Call WFBE_CO_FNC_SendToClients} forEach _sides;

//--- Handle clients JIP for this mission.
_jipHandler = [_sides, ["M_UAV_RetrieveModule",_markerSize,_uniqueLabel,_uniqueIndex,_uav]] Spawn WFBE_SE_FNC_SECOPS_HandleJIP;

//--- Choose the module extraction team.
_wteam = [];
_eteam = [];
//--- Vanilla.
if (WF_A2_Vanilla) then {
	_wteam = ['FR_Miles','FR_OHara','FR_Rodriguez','FR_Sykes'];
	_eteam = ['RUS_Soldier_TL','RUS_Soldier_GL','RUS_Soldier2','RUS_Soldier2'];
} else {
	//--- Combined Ops.
	if (WF_A2_CombinedOps) then {
		if (WF_Camo) then {
			if (random 100 > 50) then {
				_wteam = ['FR_Miles','FR_OHara','FR_Rodriguez','FR_Sykes'];
			} else {
				if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
					_wteam = ['BAF_Soldier_SL_W','BAF_Soldier_W','BAF_Soldier_W','BAF_Soldier_Medic_W'];
				} else {
					_wteam = ['CZ_Special_Forces_TL_DES_EP1','CZ_Special_Forces_DES_EP1','CZ_Special_Forces_DES_EP1','CZ_Special_Forces_GL_DES_EP1'];
				};
			};
			_eteam = ['RUS_Soldier_TL','RUS_Soldier_GL','RUS_Soldier2','RUS_Soldier2'];
		} else {
			if (random 100 > 50) then {
				if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0 && random 100 > 50) then {
					_wteam = ['BAF_Soldier_SL_DDPM','BAF_Soldier_DDPM','BAF_Soldier_DDPM','BAF_Soldier_Medic_DDPM'];
				} else {
					_wteam = ['CZ_Special_Forces_TL_DES_EP1','CZ_Special_Forces_DES_EP1','CZ_Special_Forces_DES_EP1','CZ_Special_Forces_GL_DES_EP1'];
				};
				_eteam = ['RUS_Soldier_TL','RUS_Soldier_GL','RUS_Soldier2','RUS_Soldier2'];
			} else {
				if (random 100 > 50) then {
					_wteam = ['GER_Soldier_TL_EP1','GER_Soldier_EP1','GER_Soldier_EP1','GER_Soldier_Medic_EP1'];
				} else {
					_wteam = ['US_Delta_Force_TL_EP1','US_Delta_Force_EP1','US_Delta_Force_EP1','US_Delta_Force_Medic_EP1'];
				};
				_eteam = ['TK_Special_Forces_TL_EP1','TK_Special_Forces_EP1','TK_Special_Forces_EP1','TK_Special_Forces_MG_EP1'];
			};
		};
	} else {
		//--- Arowwhead.
		if (random 100 > 50) then {
			if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0 && random 100 > 50) then {
				_wteam = ['BAF_Soldier_SL_DDPM','BAF_Soldier_DDPM','BAF_Soldier_DDPM','BAF_Soldier_Medic_DDPM'];
			} else {
				_wteam = ['GER_Soldier_TL_EP1','GER_Soldier_EP1','GER_Soldier_EP1','GER_Soldier_Medic_EP1'];
			};
			_eteam = ['RUS_Soldier_TL','RUS_Soldier_GL','RUS_Soldier2','RUS_Soldier2'];
		} else {
			if (random 100 > 50) then {
				_wteam = ['CZ_Special_Forces_TL_DES_EP1','CZ_Special_Forces_DES_EP1','CZ_Special_Forces_DES_EP1','CZ_Special_Forces_GL_DES_EP1'];
			} else {
				_wteam = ['US_Delta_Force_TL_EP1','US_Delta_Force_EP1','US_Delta_Force_EP1','US_Delta_Force_Medic_EP1'];
			};
			_eteam = ['TK_Special_Forces_TL_EP1','TK_Special_Forces_EP1','TK_Special_Forces_EP1','TK_Special_Forces_MG_EP1'];
		};
	};
};

//--- Handle the 'Middle part'.
_end = false;
_wteamrunning = objNull;
_eteamrunning = objNull;
_wteamname = "";
_eteamname = "";
_waitFor = 0;
_wspos = [];
_espos = [];
_wcomplete = false;
_ecomplete = false;
_completeList = ['WellDoneOut','GoodJobOut'];
_completeListTr = ['Well done, out.','Good job, out.'];
while {!_end} do {
	sleep 5;
	
	if (isNull _uav) exitWith {};
	
	//--- Todo, player radio HQ for extraction team.
	_nearUav = _uav nearEntities 50;
	
	_west = west countSide _nearUav;
	_east = east countSide _nearUav;
	_resistance = resistance countSide _nearUav;
	
	//--- Team checkups (west).
	if !(isNull _wteamrunning) then {
		if (count ((units _wteamrunning) Call GetLiveUnits) == 0) then {
			if (_waitFor <= 0) then {
				[West,"ExtractionTeamCancel",[_wteamname,_wteamname]] Spawn SideMessage;
				_wteamrunning = objNull;
				_waitFor = 60;
			};
		} else {
			if (_waitFor < -200) then {
				_waitFor = -1;
				(units _wteamrunning) commandMove (getPos _uav);
			};
			if (((leader _wteamrunning) distance _uav) < 50 && !_ecomplete && !_wcomplete) then {
				_waitFor = 70;
				_wcomplete = true;
				
				_uav setVariable ['side', West, true];
				
				_wteamrunning setCombatMode "RED";
				_wteamrunning setBehaviour "COMBAT";
			};
		};
	};
	
	//--- Team checkups (east).
	if !(isNull _eteamrunning) then {
		if (count ((units _eteamrunning) Call GetLiveUnits) == 0) then {
			if (_waitFor <= 0) then {
				[East,"ExtractionTeamCancel",[_eteamname,_eteamname]] Spawn SideMessage;
				_eteamrunning = objNull;
				_waitFor = 60;
			};
		} else {
			if (_waitFor < -200) then {
				_waitFor = -1;
				(units _eteamrunning) commandMove (getPos _uav);
			};
			if (((leader _eteamrunning) distance _uav) < 50 && !_wcomplete && !_ecomplete) then {
				_waitFor = 70;
				_ecomplete = true;
				
				_uav setVariable ['side', East, true];
				
				_eteamrunning setCombatMode "RED";
				_eteamrunning setBehaviour "COMBAT";
			};
		};

	};
	
	if (_resistance == 0 && _waitFor <= 0) then {
		if (_west > 0 && isNull(_wteamrunning)) then {
			//--- Warn the side that the extraction team is coming.
			_wteamname = ['Reaper','Fatman','Anvil'] select (round(random 2));
			[West,"ExtractionTeam",[_wteamname,_wteamname]] Spawn SideMessage;
			
			//--- Get a spawn position for the team.
			_pos = [];
			_attempts = 0;
			_size = _markerSize;
			while {true} do {
				sleep 0.05;
				_pos = [_randomPos, _size] Call GetSafePlace;
				
				_near = _pos nearEntities [['Man','Car','Motorcycle','Ship','Air','Tank','StaticWeapon'],_markerSize/5];
				
				if (east countSide _near == 0 && resistance countSide _near == 0) exitWith {};
				_attempts = _attempts + 1;
				
				if (_attempts > 20) then {
					_attempts = 0;
					_size = _size + (_markerSize/5);
				};
			};
			_wspos = _pos;
			_wteamrunning = createGroup west;
			
			{
				_unit = [_x,_wteamrunning,_pos,WFBE_C_WEST_ID] Call WFBE_CO_FNC_CreateUnit;
			} forEach _wteam;
			
			(units _wteamrunning) commandMove (getPos _uav);
		};
		if (_east > 0 && isNull(_eteamrunning)) then {
			//--- Warn the side that the extraction team is coming.
			_eteamname = ['Frostbite','Sabre','Hammer'] select (round(random 2));
			[East,"ExtractionTeam",[_eteamname,_eteamname]] Spawn SideMessage;
			
			//--- Get a spawn position for the team.
			_pos = [];
			_size = _markerSize;
			while {true} do {
				sleep 0.05;
				_pos = [_randomPos, _size] Call GetSafePlace;
				
				_near = _pos nearEntities [['Man','Car','Motorcycle','Ship','Air','Tank','StaticWeapon'],_markerSize/5];
				
				if (west countSide _near == 0 && resistance countSide _near == 0) exitWith {};
				_attempts = _attempts + 1;
				
				if (_attempts > 20) then {
					_attempts = 0;
					_size = _size + (_markerSize/5);
				};
			};
			_espos = _pos;
			_eteamrunning = createGroup east;
			
			{
				_unit = [_x,_eteamrunning,_pos,WFBE_C_EAST_ID] Call WFBE_CO_FNC_CreateUnit;
			} forEach _eteam;
			
			(units _eteamrunning) commandMove (getPos _uav);
		};
	};
	
	//--- Mission ends (west).
	if (_wcomplete && _waitFor <= 0) then {
		//--- if the team is dead, then we're not done yet.
		if (count ((units _wteamrunning) Call GetLiveUnits) > 0) then {
			_end = true;
			_ran = round(random (count(_completeList)-1));
			[West,"MMissionComplete", [_completeListTr select _ran, _completeList select _ran]] Spawn SideMessage;
			[East,"MMissionFailed"] Spawn SideMessage;
			
			_wteamrunning setCombatMode "YELLOW";
			_wteamrunning setBehaviour "AWARE";
			(units _wteamrunning) commandMove _wspos;
		} else {
			_wcomplete = false;
		};
	};
	//--- Missions ends (east)
	if (_ecomplete && _waitFor <= 0) then {
		//--- if the team is dead, then we're not done yet.
		if (count ((units _eteamrunning) Call GetLiveUnits) > 0) then {
			_end = true;
			_ran = round(random (count(_completeList)-1));
			[East,"MMissionComplete", [_completeListTr select _ran, _completeList select _ran]] Spawn SideMessage;
			[West,"MMissionFailed"] Spawn SideMessage;
			
			_eteamrunning setCombatMode "YELLOW";
			_eteamrunning setBehaviour "AWARE";
			(units _eteamrunning) commandMove _espos;
		} else {
			_ecomplete = false;
		};
	};
	
	_waitFor = _waitFor - 5;
};

//--- Extraction teams removal (West).
if ({alive _x} count (units _wteamrunning) > 0) then {
	//--- West.
	[_wteamrunning,_wspos] Spawn {
		Private ['_startPos','_team'];
		_team = _this select 0;
		_startPos = _this select 1;
		
		//--- Relative Infantry wait time.
		sleep (((((leader _team) distance _startPos)/(14*1000))*3600));
		
		//--- Remove vehicles.
		{if (isNil {_x getVariable "wfbe_trashed"}) then {deleteVehicle _x}} forEach (units _team);
		
		//--- Group hasn't been removed yet.
		if !(isNull _team) then {deleteGroup _team};
	};
};

//--- Extraction teams removal (East).
if ({alive _x} count (units _eteamrunning) > 0) then {
	//--- East.
	[_eteamrunning,_espos] Spawn {
		Private ['_startPos','_team'];
		_team = _this select 0;
		_startPos = _this select 1;
		
		//--- Relative Infantry wait time.
		sleep (((((leader _team) distance _startPos)/(14*1000))*3600));
		
		//--- Remove vehicles.
		{if (isNil {_x getVariable "wfbe_trashed"}) then {deleteVehicle _x}} forEach (units _team);
		
		//--- Group hasn't been removed yet.
		if !(isNull _team) then {deleteGroup _team};
	};
};

//--- Kill the spawned thread if it still runs.
if !(scriptDone _jipHandler) then {terminate _jipHandler};
if !(scriptDone _spawnUnits) then {terminate _spawnUnits};

//--- Tell the patrolling units (if there's any, to go away and dissapear).
if (({alive _x} count _units) > 0) then {
	//--- Clean up.
	[_units, _vehicles, _team, [[(_randomPos select 0)+random(_markerSize)-random(_markerSize),(_randomPos select 1)+random(_markerSize)-random(_markerSize)], 250] Call GetSafePlace] Spawn {
		Private ['_pos','_team','_units','_vehicles'];
		_units = _this select 0;
		_vehicles = _this select 1;
		_team = _this select 2;
		_pos = _this select 3;
		
		//--- Move.
		(_units) commandMove _pos;
		
		//--- Relative Infantry wait time.
		sleep (((((leader _team) distance _pos)/(14*1000))*3600));
		
		//--- Remove vehicles.
		{if (isNil {_x getVariable "wfbe_trashed"}) then {if (isPlayer (driver _x)) then {emptyQueu = emptyQueu + [_x]} else {deleteVehicle _x}}} forEach _vehicles;
		{if (isNil {_x getVariable "wfbe_trashed"}) then {deleteVehicle _x}} forEach _units;
		
		//--- Group hasn't been removed yet.
		if !(isNull _grp) then {deleteGroup _grp};
	};
};

//--- Lift the ignore rule on the uav (garbage protection).
if !(WF_A2_Vanilla) then {_uav setVariable ["wfbe_trashable", nil]};

//--- Remove crates if we've generated any.
_craters = nearestObjects [_randomPos, ['CraterLong'], 250];
{deleteVehicle _x} forEach _craters;
if !(isNull _uav) then {deleteVehicle _uav};

//--- Give the 'winning' side an award.
_winner = if (_ecomplete) then {east} else {west};
[_winner, "LocalizeMessage", ['SecondaryAward','$',1000]] Call WFBE_CO_FNC_SendToClients;

//--- Wait for the client to end up his sync.
sleep 35;

//--- Free the mission.
{missionNamespace setVariable [Format['_WFBE_M_RUNNINGMISSIONS_%1', _x],(missionNamespace getVariable Format['_WFBE_M_RUNNINGMISSIONS_%1', _x]) - 1]} forEach _sides;