Private ["_building","_cpt","_commander","_crew","_currentUnit","_description","_direction","_distance","_driver","_extracrew","_factory","_factoryPosition","_factoryType","_group","_gunner","_index","_init","_isArtillery","_isMan","_locked","_longest","_position","_queu","_queu2","_ret","_show","_soldier","_waitTime","_txt","_type","_upgrades","_unique","_unit","_vehi","_vehicle","_vehicles"];
_building = _this select 0;
_unit = _this select 1;
_vehi = _this select 2;
_factory = _this select 3;
_cpt = _this select 4;

_isMan = if (_unit isKindOf "Man") then {true} else {false};

unitQueu = unitQueu + _cpt;

_distance = 0;
_direction = 0;
_longest = 0;
_position = 0;
_waitTime = 0;
_factoryType = "";
_description = "";

_currentUnit = missionNamespace getVariable _unit;
_waitTime = _currentUnit select QUERYUNITTIME;
_description = _currentUnit select QUERYUNITLABEL;

_type = typeOf _building;
_index = (missionNamespace getVariable Format ["WFBE_%1STRUCTURENAMES",sideJoinedText]) find _type;
if (_index != -1) then {
	_distance = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDISTANCES",sideJoinedText]) select _index;
	_direction = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDIRECTIONS",sideJoinedText]) select _index;
	_factoryType = (missionNamespace getVariable Format ["WFBE_%1STRUCTURES",sideJoinedText]) select _index;
	_position = [getPos _building,_distance,getDir _building + _direction] Call GetPositionFrom;
	_longest = missionNamespace getVariable Format ["WFBE_LONGEST%1BUILDTIME",_factoryType];
} else {
	if (_type == WFBE_Logic_Depot) then {
		_distance = missionNamespace getVariable "WFBE_C_DEPOT_BUY_DISTANCE";
		_direction = missionNamespace getVariable "WFBE_C_DEPOT_BUY_DIR";
		_factoryType = "Depot";
	};
	if (_type == WFBE_Logic_Airfield) then {
		_distance = missionNamespace getVariable "WFBE_C_HANGAR_BUY_DISTANCE";
		_direction = missionNamespace getVariable "WFBE_C_HANGAR_BUY_DIR";
		_factoryType = "Airport";
	};
	_position = [getPos _building,_distance,getDir _building + _direction] Call GetPositionFrom;
	_longest = missionNamespace getVariable Format ["WFBE_LONGEST%1BUILDTIME",_factoryType];
};

_unique = varQueu;
varQueu = random(10)+random(100)+random(1000);
_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu = _queu + [_unique];
_building setVariable ["queu",_queu,true];

_ret = 0;
_queu2 = [0];

if (count _queu > 0) then {_queu2 = _building getVariable "queu"};

_show = false;
while {_unique != _queu select 0 && alive _building && !isNull _building} do {
	sleep 4;
	_show = true;
	_ret = _ret + 4;
	_queu = _building getVariable "queu";
	
	if (_queu select 0 == _queu2 select 0) then {
		if (_ret > _longest) then {
			if (count _queu > 0) then {
				_queu = _building getVariable "queu";
				_queu = _queu - [_queu select 0];
				_building setVariable ["queu",_queu,true];
			};	
		};
	};
	if (count _queu != count _queu2) then {
		_ret = 0;
		_queu2 = _building getVariable "queu";
	};
};

if (_show) then {hint(parseText(Format [localize "STR_WF_INFO_BuyEffective",_description]))};

sleep _waitTime;

_queu = _building getVariable "queu";
_queu = _queu - [_unique];
_building setVariable ["queu",_queu,true];

_group = group player;
if (!alive _building || isNull _building) exitWith {
	unitQueu = unitQueu - _cpt;
	missionNamespace setVariable [Format["WFBE_C_QUEUE_%1",_factory],(missionNamespace getVariable Format["WFBE_C_QUEUE_%1",_factory])-1];
};

if (_isMan) then {
	_soldier = [_unit,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
	[sideJoinedText,'UnitsCreated',1] Call UpdateStatistics;
} else {
	_driver = _vehi select 0;
	_gunner = _vehi select 1;
	_commander = _vehi select 2;
	_extracrew = _vehi select 3;
	_locked = _vehi select 4;
	
	_factoryPosition = getPos _building;
	_direction = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);//--- model to world that later on.
	
	_vehicle = [_unit, _position, sideID, _direction, _locked] Call WFBE_CO_FNC_CreateVehicle;
	clientTeam reveal _vehicle;
	
	_vehicles = (WF_Logic getVariable "emptyVehicles") + [_vehicle];
	WF_Logic setVariable ["emptyVehicles",_vehicles,true];
	
	if (isHostedServer) then {_vehicle setVariable ["WFBE_Taxi_Prohib", true]};
	
	//--- Clear the vehicle.
	(_vehicle) call WFBE_CO_FNC_ClearVehicleCargo;
	
	/* Section: Local Init (Client Only) */

	//--- Lock / Unlock.
	_vehicle addAction [localize "STR_WF_Unlock","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && locked _target'];
	_vehicle addAction [localize "STR_WF_Lock","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && !(locked _target)'];
	
	//--- Supply Truck.
	if (_unit in (missionNamespace getVariable Format['WFBE_%1SUPPLYTRUCKS',sideJoinedText])) then {[_vehicle,sideJoined] ExecFSM 'Client\FSM\updatesupply.fsm'};
	
	//--- Salvage Truck.
	if (_unit in (missionNamespace getVariable Format['WFBE_%1SALVAGETRUCK',sideJoinedText])) then {[_vehicle] ExecFSM 'Client\FSM\updatesalvage.fsm'};
	
	//--- Units Balancing.
	if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {(_vehicle) Spawn BalanceInit};

	if (_unit isKindOf "Air") then {
		if !(WF_A2_Vanilla) then {
			switch (missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") do { //--- Remove CM if needed.
				case 0: {(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures}; //--- Disabled.
				case 1: { //--- Enabled with upgrades.
					if (((sideJoined Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_FLARESCM) == 0) then {
						(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures;
					};
				};
			};
		};
	};
	
	//--- Are we dealing with an artillery unit.
	_isArtillery = [_unit,sideJoinedText] Call IsArtillery;
	if (_isArtillery != -1) then {[_vehicle,_isArtillery,sideJoinedText] Call EquipArtillery};
	
	/* Section: Creation */

	[sideJoinedText,'VehiclesCreated',1] Call UpdateStatistics;
	_built = 0;
	_group addVehicle _vehicle;
	
	//--- Empty Vehicle.
	if (!_driver && !_gunner && !_commander) exitWith {};
	
	//--- Crew Management.
	_crew = missionNamespace getVariable Format ["WFBE_%1SOLDIER",sideJoinedText];
	if (_unit isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["WFBE_%1CREW",sideJoinedText]};
	if (_unit isKindOf "Air") then {
		_crew = missionNamespace getVariable Format ["WFBE_%1PILOT",sideJoinedText];
	};
	
	//--- Driver.
	if (_driver) then {
		_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		_soldier moveInDriver _vehicle;
	};
	
	//--- Gunner.
	if (_gunner) then {
		_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		_soldier moveInGunner _vehicle;
	};
	
	//--- Commander.
	if (_commander) then {
		_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		_soldier moveInCommander _vehicle;
	};
	
	//--- Extra vehicle turrets.
	if (_extracrew) then {
		Private ["_turrets"];
		_turrets = _currentUnit select QUERYUNITTURRETS;
		
		{
			if (isNull (_vehicle turretUnit _x)) then {
				_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
				[_soldier] allowGetIn true;
				_soldier moveInTurret [_vehicle, _x];			
			};
		} forEach _turrets;
	};
	[sideJoinedText,'UnitsCreated',_cpt] Call UpdateStatistics;
};

unitQueu = unitQueu - _cpt;

missionNamespace setVariable [Format["WFBE_C_QUEUE_%1",_factory],(missionNamespace getVariable Format["WFBE_C_QUEUE_%1",_factory])-1];
hint parseText(Format [localize "STR_WF_INFO_Build_Complete",_description]);