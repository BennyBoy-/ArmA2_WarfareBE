if (!isServer || time > 30) exitWith {diag_log Format["[WFBE (WARNING)][frameno:%1 | ticktime:%2] Init_Server: The server initialization cannot be called more than once.",diag_frameno,diag_tickTime]};

["INITIALIZATION", Format ["Init_Server.sqf: Server initialization begins at [%1]", time]] Call WFBE_CO_FNC_LogContent;

//--- Allow resistance group to be spawned without a placeholder.
createCenter resistance;
resistance setFriend [west,0];
resistance setFriend [east,0];

AIBuyUnit = Compile preprocessFile "Server\Functions\Server_BuyUnit.sqf";
if (WF_A2_Vanilla) then {AISquadRespawn = Compile preprocessFile "Server\AI\AI_SquadRespawn.sqf"};
if !(WF_A2_Vanilla) then {AIAdvancedRespawn = Compile preprocessFile "Server\AI\AI_AdvancedRespawn.sqf"};
AIMoveTo = Compile preprocessFile "Server\AI\Orders\AI_MoveTo.sqf";
AIPatrol = Compile preprocessFile "Server\AI\Orders\AI_Patrol.sqf";
AITownPatrol = Compile preprocessFile "Server\AI\Orders\AI_TownPatrol.sqf";
AITownResitance = Compile preprocessFile "Server\AI\AI_Resistance.sqf";
AIWPAdd = Compile preprocessFile "Server\AI\Orders\AI_WPAdd.sqf";
AIWPRemove = Compile preprocessFile "Server\AI\Orders\AI_WPRemove.sqf";
BuildingDamaged = Compile preprocessFile "Server\Functions\Server_BuildingDamaged.sqf";
BuildingHandleDamages = Compile preprocessFile "Server\Functions\Server_BuildingHandleDamages.sqf";
BuildingKilled = Compile preprocessFile "Server\Functions\Server_BuildingKilled.sqf";
CanUpdateTeam = Compile preprocessFile "Server\Functions\Server_CanUpdateTeam.sqf";
ChangeAICommanderFunds = Compile preprocessFile "Server\Functions\Server_ChangeAICommanderFunds.sqf";
ConstructDefense = Compile preprocessFile "Server\Construction\Construction_StationaryDefense.sqf";
CreateDefenseTemplate = Compile preprocessFile "Server\Functions\Server_CreateDefenseTemplate.sqf";
HandleBuildingRepair = Compile preprocessFile "Server\Functions\Server_HandleBuildingRepair.sqf";
GetAICommanderFunds = Compile preprocessFile "Server\Functions\Server_GetAICommanderFunds.sqf";
HandleBuildingDamage = Compile preprocessFile "Server\Functions\Server_HandleBuildingDamage.sqf";
HandleDefense = Compile preprocessFile "Server\Functions\Server_HandleDefense.sqf";
HandleEmptyVehicle = Compile preprocessFile "Server\Functions\Server_HandleEmptyVehicle.sqf";
HandleSpecial = Compile preprocessFile "Server\Functions\Server_HandleSpecial.sqf";
MHQRepair = Compile preprocessFile "Server\Functions\Server_MHQRepair.sqf";
SideMessage = Compile preprocessFile "Server\Functions\Server_SideMessage.sqf";
TrashObject = Compile preprocessFile "Server\Functions\Server_TrashObject.sqf";
UpdateTeam = Compile preprocessFile "Server\Functions\Server_UpdateTeam.sqf";
UpdateSupplyTruck = Compile preprocessFile "Server\AI\AI_UpdateSupplyTruck.sqf";

//--- Support Functions.
KAT_ParaAmmo = Compile preprocessFile "Server\Support\Support_ParaAmmo.sqf";
KAT_Paratroopers = Compile preprocessFile "Server\Support\Support_Paratroopers.sqf";
KAT_ParaVehicles = Compile preprocessFile "Server\Support\Support_ParaVehicles.sqf";
KAT_UAV = Compile preprocessFile "Server\Support\Support_UAV.sqf";

//--- New Fnc.
WFBE_SE_FNC_AI_SetTownAttackPath = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_SetTownAttackPath.sqf";
WFBE_SE_FNC_AI_SetTownAttackPath_PathIsSafe = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_SetTownAttackPath_PathIsSafe.sqf";
WFBE_SE_FNC_AI_SetTownAttackPath_PosIsSafe = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_SetTownAttackPath_PosIsSafe.sqf";
WFBE_SE_FNC_AI_Com_Upgrade = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_Com_Upgrade.sqf";
WFBE_SE_FNC_GetTownGroups = Compile preprocessFileLineNumbers "Server\Functions\Server_GetTownGroups.sqf";
WFBE_SE_FNC_GetTownGroupsDefender = Compile preprocessFileLineNumbers "Server\Functions\Server_GetTownGroupsDefender.sqf";
WFBE_SE_FNC_GetTownPatrol = Compile preprocessFileLineNumbers "Server\Functions\Server_GetTownPatrol.sqf";
WFBE_SE_FNC_HandlePVF = Compile preprocessFileLineNumbers "Server\Functions\Server_HandlePVF.sqf";
WFBE_SE_FNC_ManageTownDefenses = Compile preprocessFileLineNumbers "Server\Functions\Server_ManageTownDefenses.sqf";
WFBE_SE_FNC_OnHQKilled = Compile preprocessFileLineNumbers "Server\Functions\Server_OnHQKilled.sqf";
WFBE_SE_FNC_OperateTownDefensesUnits = Compile preprocessFileLineNumbers "Server\Functions\Server_OperateTownDefensesUnits.sqf";
WFBE_SE_FNC_ProcessUpgrade = Compile preprocessFileLineNumbers "Server\Functions\Server_ProcessUpgrade.sqf";
WFBE_SE_FNC_SetCampsToSide = Compile preprocessFileLineNumbers "Server\Functions\Server_SetCampsToSide.sqf";
WFBE_SE_FNC_SetLocalityOwner = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Server\Functions\Server_SetLocalityOwner.sqf"} else {{}};
WFBE_SE_FNC_SpawnTownDefense = Compile preprocessFileLineNumbers "Server\Functions\Server_SpawnTownDefense.sqf";
WFBE_SE_FNC_VoteForCommander = Compile preprocessFileLineNumbers "Server\Functions\Server_VoteForCommander.sqf";
WFBE_SE_FNC_SECOPS_HandleJIP = Compile preprocessFileLineNumbers "Server\Functions\Server_SECOPS_HandleJIP.sqf";

Call Compile preprocessFileLineNumbers 'Server\Functions\Server_FNC_Delegation.sqf'; //--- FUNCTIONS: Delegation.
Call Compile preprocessFileLineNumbers 'Server\Functions\Server_FNC_TownDefenses.sqf'; //--- FUNCTIONS: Town Defenses.

//--- Call in NEURO System (Taxi Advanced Script).
[] Call Compile preprocessFile "Server\Module\NEURO\NEURO.sqf";

//--- NEURO: Special Condition.
missionNamespace setVariable["NEURO_TAXI_CONDITION", "isNil {_x getVariable 'WFBE_Taxi_Prohib'} && local _x"];

//--- Server Init is now complete.
serverInitComplete = true;

["INITIALIZATION", "Init_Server.sqf: Functions are loaded."] Call WFBE_CO_FNC_LogContent;

//--- Getting all locations.
startingLocations = [0,0,0] nearEntities ["LocationLogicStart", 100000];

["INITIALIZATION", "Init_Server.sqf: Initializing starting locations."] Call WFBE_CO_FNC_LogContent;

//--- Waiting for the common part to be executed.
waitUntil {commonInitComplete && townInit};

//--- Side logics.
_present_west = missionNamespace getVariable "WFBE_WEST_PRESENT";
_present_east = missionNamespace getVariable "WFBE_EAST_PRESENT";
_present_res = missionNamespace getVariable "WFBE_GUER_PRESENT";

//--- New Variables.
if ((missionNamespace getVariable "WFBE_C_TOWNS_PATROLS") > 0) then {
	missionNamespace setVariable ["WFBE_C_PATROLS_DELAY_SPAWN", 10];//--- Patrols will be able to respawn after x seconds.
	missionNamespace setVariable ["WFBE_C_PATROLS_TOWNS_REUSABLITY", 0.25];//--- Patrols may patrol a town again after being in 25% of the other towns.
	missionNamespace setVariable ["WFBE_C_PATROLS_TOWNS_LOCK", floor(totalTowns * (missionNamespace getVariable "WFBE_C_PATROLS_TOWNS_REUSABLITY"))];
};
	
[] Call Compile preprocessFile 'Server\Init\Init_Defenses.sqf';

//--- Fast Time.
if ((missionNamespace getVariable "WFBE_C_ENVIRONMENT_FAST_TIME") > 0) then {
	[] ExecFSM "Server\FSM\env_fast_time.fsm";
	["INITIALIZATION", "Init_Server.sqf: Fast time module is loaded."] Call WFBE_CO_FNC_LogContent;
};

//--- Weather.
_weat = missionNamespace getVariable "WFBE_C_ENVIRONMENT_WEATHER";
if (_weat == 3) then {
	[] ExecFSM "Server\FSM\env_weather.fsm";
} else {
	if (isDedicated) then {
		_oc = 0.05;
		switch (_weat) do {
			case 0: {_oc = 0};
			case 1: {_oc = 0.5};
			case 2: {_oc = 1};
		};
		60 setOvercast _oc;
	};
};

["INITIALIZATION", "Init_Server.sqf: Weather module is loaded."] Call WFBE_CO_FNC_LogContent;

//--- Static defenses groups in main towns.
{
	missionNamespace setVariable [Format ["WFBE_%1_DefenseTeam", _x], createGroup _x];
	(missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _x]) setVariable ["wfbe_persistent", true];
} forEach [west,east,resistance];

//--- Select whether the spawn restriction is enabled or not.
_locationLogics = [];
if ((missionNamespace getVariable "WFBE_C_BASE_START_TOWN") > 0) then {
	{
		_nearLogics = _x nearEntities[["LocationLogicStart"],2000];
		if (count _nearLogics > 0) then {{if !(_x in _locationLogics) then {_locationLogics = _locationLogics + [_x]}} forEach _nearLogics};
	} forEach towns;
	if (count _locationLogics < 3) then {_locationLogics = startingLocations},
	["INITIALIZATION", Format ["Init_Server.sqf: Spawn locations were refined [%1].",count _locationLogics]] Call WFBE_CO_FNC_LogContent;
} else {
	_locationLogics = startingLocations;
};

WF_Logic setVariable ["wfbe_spawnpos", _locationLogics];
//--- Retrieve the starting locations.
//--- Make sure that we have enough starting locations.
// if (count _startingLocations < 3) exitWith {["ERROR", "Init_Server.sqf : There is not enough starting location to play."] Call WFBE_CO_FNC_LogContent;endMission "END1"};

Private ["_i", "_maxAttempts", "_minDist", "_rPosE", "_rPosG", "_rPosW", "_setEast", "_setGuer", "_setWest", "_startE", "_startG", "_startW"];
_i = 0;
_maxAttempts = 2000;
_minDist = missionNamespace getVariable 'WFBE_C_BASE_STARTING_DISTANCE';
_startW = [0,0,0];
_startE = [0,0,0];
_startG = [0,0,0];
_rPosW = [0,0,0];
_rPosE = [0,0,0];
_rPosG = [0,0,0];
_setWest = if (_present_west) then {true} else {false};
_setEast = if (_present_east) then {true} else {false};
_setGuer = if (_present_res) then {true} else {false};
_total = count _locationLogics;

_use_random = false;

_spawn_north = objNull;
_spawn_south = objNull;
_skip_w = false;
_skip_e = false;
{
	if (!isNil {_x getVariable "wfbe_spawn"}) then {
		switch (_x getVariable "wfbe_spawn") do {
			case "north": {_spawn_north = _x};
			case "south": {_spawn_south = _x};
		};
	};
} forEach startingLocations;

//todo, improve starting locations system.
switch (missionNamespace getVariable "WFBE_C_BASE_STARTING_MODE") do {
	case 0: {
		//--- West north, east south.
		if (isNull _spawn_north || isNull _spawn_south) then {
			_use_random = true;
		} else {
			_startE = _spawn_south;
			_startW = _spawn_north;
			if (WFBE_ISTHREEWAY) then {_skip_w = true; _skip_e = true; _setWest = false; _setEast = false; _use_random = true};
		};
	};
	case 1: {
		//--- West south, east north.
		if (isNull _spawn_north || isNull _spawn_south) then {
			_use_random = true;
		} else {
			_startE = _spawn_north;
			_startW = _spawn_south;
			if (WFBE_ISTHREEWAY) then {_skip_w = true; _skip_e = true; _setWest = false; _setEast = false; _use_random = true};
		};
	};
	case 2: {
		_use_random = true;
	};
};

if (_use_random) then {
	while {true} do {
		if (!_setWest && !_setEast && !_setGuer) exitWith {["INITIALIZATION", "Init_Server.sqf : All sides were placed [Random]."] Call WFBE_CO_FNC_LogContent};

		//--- Determine west starting location if necessary.
		if (_setWest) then {
			_rPosW = _locationLogics select floor(random _total);
			if (_rPosW distance _startE > _minDist && _rPosW distance _startG > _minDist) then {_startW = _rPosW; _setWest = false};
		};
		
		// --- Determine west starting location if necessary.
		if (_setEast) then {
			_rPosE = _locationLogics select floor(random _total);
			if (_rPosE distance _startW > _minDist && _rPosE distance _startG > _minDist) then {_startE = _rPosE; _setEast = false};
		};
		
		// --- Determine guer starting location if necessary.
		if (_setGuer) then {
			_rPosG = _locationLogics select floor(random _total);
			if (_rPosG distance _startW > _minDist && _rPosG distance _startE > _minDist) then {_startG = _rPosG; _setGuer = false};
		};
		
		_i = _i + 1;
		
		if (_i >= _maxAttempts) exitWith {
			//--- Get the default locations.
			Private ["_eastDefault", "_guerDefault", "_westDefault"];
			_eastDefault = objNull;
			_westDefault = objNull;
			_guerDefault = objNull;


			{
				if (!isNil {_x getVariable "wfbe_default"}) then {
					switch (_x getVariable "wfbe_default") do {
						case west: {_westDefault = _x};
						case east: {_eastDefault = _x};
						case resistance: {_guerDefault = _x};
					};
				};
			} forEach startingLocations;

			// --- Ensure that everything is set, otherwise we randomly set the spawn.
			if (isNull _guerDefault || isNull _eastDefault || isNull _westDefault) then {
				Private ["_tempWork"];
				_tempWork = +(startingLocations) - [_westDefault, _eastDefault, _guerDefault];
				if (isNull _guerDefault && _present_res) then {_guerDefault = _tempWork select floor(random _total); _tempWork = _tempWork - [_guerDefault]};
				if (isNull _eastDefault && _present_east) then {_eastDefault = _tempWork select floor(random _total); _tempWork = _tempWork - [_eastDefault]};
				if (isNull _westDefault && _present_west) then {_westDefault = _tempWork select floor(random _total); _tempWork = _tempWork - [_westDefault]};
			};
			
			if (_present_res) then {_startG = _guerDefault};
			if (_present_east && !_skip_e) then {_startE = _eastDefault};
			if (_present_west && !_skip_w) then {_startW = _westDefault};
			
			["INITIALIZATION", "Init_Server.sqf : All sides were placed by force after that the attempts limit was reached."] Call WFBE_CO_FNC_LogContent;
		};
	};
};

["INITIALIZATION", Format ["Init_Server.sqf: Starting location mode is on [%1].",missionNamespace getVariable "WFBE_C_BASE_STARTING_MODE"]] Call WFBE_CO_FNC_LogContent;

emptyQueu = [];

//--- Global sides initialization.
{
	Private["_side"];
	_side = _x select 1;
	
	//--- Only use those variable if the side logic is present in the editor.
	if (_x select 0) then {
		_pos = _x select 2;
		_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
		_sideID = (_side) Call WFBE_CO_FNC_GetSideID;
		
		//--- HQ init.
		_hq = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _side], _pos, _sideID, getDir _pos, true, false, true] Call WFBE_CO_FNC_CreateVehicle;
		_hq setVariable ["WFBE_Taxi_Prohib", true];
		_hq setVariable ["wfbe_side", _side];
		_hq setVariable ["wfbe_trashable", false];
		_hq setVariable ["wfbe_structure_type", "Headquarters"];
		_hq addEventHandler ['killed', {_this Spawn WFBE_SE_FNC_OnHQKilled}];
		
		//--- HQ Friendly Fire handler.
		if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE") > 0) then {_hq addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}]};
		
		//--- Get upgrade clearance for side.
		_clearance = missionNamespace getVariable "WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE";
		_upgrades = false;
		if (_clearance != 0) then {
			_upgrades = switch (true) do {
				case (_clearance in [1,4,5,7] && _side == west): {true};
				case (_clearance in [2,4,6,7] && _side == east): {true};
				case (_clearance in [3,5,6,7] && _side == resistance): {true};
				default {false};
			};
		};
		
		if !(_upgrades) then {
			_upgrades = [];
			for '_i' from 0 to count(missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_LEVELS", _side])-1 do {[_upgrades, 0] Call WFBE_CO_FNC_ArrayPush};
		} else {
			_upgrades = missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_LEVELS", _side];
		};
		
		//--- Logic init.
		_logik setVariable ["wfbe_commander", objNull, true];
		_logik setVariable ["wfbe_hq", _hq, true];
		_logik setVariable ["wfbe_hq_deployed", false, true];
		_logik setVariable ["wfbe_hq_repair_count", 1, true];
		_logik setVariable ["wfbe_hq_repairing", false, true];
		_logik setVariable ["wfbe_startpos", _pos, true];
		_logik setVariable ["wfbe_structure_lasthit", 0];
		_logik setVariable ["wfbe_structures", [], true];
		_logik setVariable ["wfbe_aicom_running", false];
		_logik setVariable ["wfbe_aicom_funds", round((missionNamespace getVariable Format ['WFBE_C_ECONOMY_FUNDS_START_%1', _side])*1.5)];
		_logik setVariable ["wfbe_upgrades", _upgrades, true];
		_logik setVariable ["wfbe_upgrading", false, true];
		_logik setVariable ["wfbe_votetime", missionNamespace getVariable "WFBE_C_GAMEPLAY_VOTE_TIME", true];
		_logik setVariable ["wfbe_hqinuse",false];
		
		//todo improve.
		WF_Logic setVariable [Format["%1UnitsCreated",_side],0,true];
		WF_Logic setVariable [Format["%1Casualties",_side],0,true];
		WF_Logic setVariable [Format["%1VehiclesCreated",_side],0,true];
		WF_Logic setVariable [Format["%1VehiclesLost",_side],0,true];
		
		//--- Parameters specific.
		if ((missionNamespace getVariable "WFBE_C_BASE_AREA") > 0) then {_logik setVariable ["wfbe_basearea", [], true]};
		if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0 && (missionNamespace getVariable "WFBE_C_AI_COMMANDER_ENABLED") > 0) then {
			_logik setVariable ["wfbe_ai_supplytrucks", []];
			[_side] Spawn UpdateSupplyTruck;
		};
		if ((missionNamespace getVariable "WFBE_C_RESPAWN_MASH") > 0) then {_logik setVariable ["wfbe_mash", objNull, true]};
		if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {_logik setVariable ["wfbe_supply", missionNamespace getVariable Format ["WFBE_C_ECONOMY_SUPPLY_START_%1", _side], true]};
		if ((missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM") in [3,4]) then {
			_logik setVariable ["wfbe_commander_percent", if ((missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_PERCENT_MAX") < 70) then {missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_PERCENT_MAX"} else {70}, true];
		};
		if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 1) then {
			_logik setVariable ["wfbe_workers", [], true];
			_logik setVariable ["wfbe_structures_logic", []];
		};
		
		//--- Structures limit (live).
		_str = [];
		for '_i' from 0 to count(missionNamespace getVariable Format["WFBE_%1STRUCTURES",_side])-2 do {_str set [_i, 0]};
		_logik setVariable ["wfbe_structures_live", _str, true];
		
		//--- Radio: Initialize the announcers entities.
		_radio_hq1 = (createGroup sideLogic) createUnit ["Logic",[0,0,0],[],0,"NONE"];
		_radio_hq2 = (createGroup sideLogic) createUnit ["Logic",[0,0,0],[],0,"NONE"];
		[_radio_hq1] joinSilent (createGroup _side);
		[_radio_hq2] joinSilent (createGroup _side);
		_logik setVariable ["wfbe_radio_hq", _radio_hq1, true];
		_logik setVariable ["wfbe_radio_hq_rec", _radio_hq2];
		
		//--- Radio: Pick a random announcer.
		_announcers = missionNamespace getVariable Format ["WFBE_%1_RadioAnnouncers", _side];
		_radio_hq_id = (_announcers) select floor(random (count _announcers));
		
		//--- Radio: Apply an identity.
		_radio_hq1 setIdentity _radio_hq_id;
		_radio_hq1 setRank 'COLONEL';
		_radio_hq1 setGroupId ["HQ"];
		_radio_hq1 kbAddTopic [_radio_hq_id, "Client\kb\hq.bikb","Client\kb\hq.fsm", {call compile preprocessFileLineNumbers "Client\kb\hq.sqf"}];
		_logik setVariable ["wfbe_radio_hq_id", _radio_hq_id, true];
		
		//--- Starting vehicles.
		{
			_vehicle = [_x, getPos _hq, _sideID, 0, false] Call WFBE_CO_FNC_CreateVehicle;
			[_vehicle, getPos _hq, 45, 60, true, false, true] Call PlaceNear;
			_vehicle setVariable ["WFBE_Taxi_Prohib", true];
			(_vehicle) call WFBE_CO_FNC_ClearVehicleCargo;
			emptyQueu = emptyQueu + [_vehicle];
			_vehicle spawn HandleEmptyVehicle;
		} forEach (missionNamespace getVariable Format ['WFBE_%1STARTINGVEHICLES', _side]);
		
		//--- Groups init.
		_teams = [];
		{
			if !(isNil '_x') then {
				if (_x isKindOf "Man") then {
					Private ["_group"];
					_group = group _x;
					[_teams, _group] Call WFBE_CO_FNC_ArrayPush;
					
					if (isNil {_group getVariable "wfbe_funds"}) then {_group setVariable ["wfbe_funds", missionNamespace getVariable Format ["WFBE_C_ECONOMY_FUNDS_START_%1", _side], true]};
					_group setVariable ["wfbe_side", _side];
					_group setVariable ["wfbe_persistent", true];
					_group setVariable ["wfbe_queue", []];
					_group setVariable ["wfbe_vote", -1, true];
					[_group, false]	Call SetTeamAutonomous;
					[_group, ""] Call SetTeamRespawn;
					[_group, -1] Call SetTeamType;
					[_group, "towns"] Call SetTeamMoveMode;
					[_group, [0,0,0]] Call SetTeamMovePos;
					
					if ((missionNamespace getVariable "WFBE_C_AI_TEAMS_ENABLED") > 0) then {
						if (!isPlayer _x && alive _x) then {
							_x setPos ([getPos _pos, 20, 30] Call GetRandomPosition);
							_loadout = missionNamespace getVariable Format["WFBE_%1_AI_Loadout_0", _side];
							if !(isNil '_loadout') then {
								_loadout = _loadout select floor (random count _loadout);
								if (count _loadout <= 3) then {
									[_x, _loadout select 0, _loadout select 1, _loadout select 2] Call WFBE_CO_FNC_EquipUnit;
								} else {
									[_x, _loadout select 0, _loadout select 1, _loadout select 2, _loadout select 3, _loadout select 4] Call WFBE_CO_FNC_EquipUnit;
								};
							};
						};
					
						if !(WF_A2_Vanilla) then {(_group) Call Compile preprocessFile 'Server\AI\AI_AddMultiplayerRespawnEH.sqf'};
						[_group] ExecFSM "Server\FSM\aiteam.fsm";
					};
					["INITIALIZATION", Format["Init_Server.sqf: [%1] Team [%2] was initialized.", _side, _group]] Call WFBE_CO_FNC_LogContent;
				};
				
			};
		} forEach (synchronizedObjects _logik);
		
		_logik setVariable ["wfbe_teams", _teams, true];
		_logik setVariable ["wfbe_teams_count", count _teams];
	};
} forEach [[_present_east, east, _startE],[_present_res, resistance, _startG],[_present_west, west, _startW]];

serverInitFull = true;

//--- Town starting mode.
if ((missionNamespace getVariable "WFBE_C_TOWNS_STARTING_MODE") != 0 || (missionNamespace getVariable "WFBE_C_TOWNS_PATROLS") > 0) then {[] Call Compile preprocessFile "Server\Init\Init_Towns.sqf"} else {townInitServer = true};

//--- Pre-initialization of the Garbage Collector & Empty vehicle collector.
if (WF_A2_Vanilla) then {WF_Logic setVariable ["trash",[],true]};
WF_Logic setVariable ["emptyVehicles",[],true];

//--- Don't pause the server init script.
[] Spawn {
	waitUntil {townInit};
	if (WFBE_ISTHREEWAY) then {
		[] ExecFSM "Server\FSM\server_victory_threeway.fsm";
		["INITIALIZATION", "Init_Server.sqf: Victory Condition FSM is initialized [3-way]."] Call WFBE_CO_FNC_LogContent;
	} else {
		[] ExecFSM "Server\FSM\updateserver.fsm";
		["INITIALIZATION", "Init_Server.sqf: Victory Condition FSM is initialized."] Call WFBE_CO_FNC_LogContent;
	};
	[] ExecFSM "Server\FSM\updateresources.fsm";
	["INITIALIZATION", "Init_Server.sqf: Resources FSM is initialized."] Call WFBE_CO_FNC_LogContent;
	
	if ((missionNamespace getVariable "WFBE_C_TOWNS_CONQUEST_MODE") > 0) then {[] ExecFSM "Server\FSM\conquest.fsm"};
};

if (WF_A2_Vanilla) then {[] ExecFSM "Server\FSM\server_collector_garbage_va.fsm"} else {[] ExecFSM "Server\FSM\server_collector_garbage.fsm"};
["INITIALIZATION", "Init_Server.sqf: Garbage Collector is defined."] Call WFBE_CO_FNC_LogContent;
[] ExecFSM "Server\FSM\emptyvehiclescollector.fsm";
["INITIALIZATION", "Init_Server.sqf: Empty Vehicle Collector is defined."] Call WFBE_CO_FNC_LogContent;

//--- Base Area (grouped base)
if ((missionNamespace getVariable "WFBE_C_BASE_AREA") > 0) then {[] ExecFSM "Server\FSM\basearea.fsm"};

//--- Allies base.
_allies = missionNamespace getVariable "WFBE_C_BASE_ALLIES";
if (_allies > 0 && (WF_A2_Vanilla || WF_A2_CombinedOps)) then {
	AlliesBuyUnit = Compile preprocessFile "Server\Functions\Server_AlliesBuyUnit.sqf";
	[] Call Compile preprocessFile "Server\Config\Config_Allies.sqf";
	if (_allies in [1,3]) then {[west] ExecFSM "Server\FSM\allies.fsm"};
	if (_allies in [2,3]) then {[east] ExecFSM "Server\FSM\allies.fsm"};

	["INITIALIZATION", "Init_Server.sqf: allies are initialized."] Call WFBE_CO_FNC_LogContent;
};

//--- Mission Module
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_MISSIONS") > 0) then {
	//--- Initialize the missions.
	Call Compile preprocessFileLineNumbers "Server\Module\Missions\Init_Missions.sqf";
	
	ExecFSM 'Server\FSM\module_missions.fsm';

	["INITIALIZATION", "Init_Server.sqf: Secondary Missions module is running."] Call WFBE_CO_FNC_LogContent;
};

["INITIALIZATION", Format ["Init_Server.sqf: Server initialization ended at [%1]", time]] Call WFBE_CO_FNC_LogContent;

//--- Waiting until that the game is launched.
waitUntil {time > 0};

{_x Spawn WFBE_SE_FNC_VoteForCommander} forEach WFBE_PRESENTSIDES;