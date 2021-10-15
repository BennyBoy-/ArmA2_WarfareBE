/*
	Helicopter hunters, a resistance helicopter is dispatched to attack different players
		This mission is only triggered for one side.
*/
Private ["_boundaries","_chopper","_group","_jipHandler","_list","_pilot","_players","_ran","_ranDir","_runFor","_ranPos","_target","_targets","_turrets","_uniqueIndex","_uniqueLabel","_vehicle"];

_uniqueLabel = _this select 0;
_uniqueIndex = _this select 1;
_runFor = (_this select 2) select 0;//--- This mission will only run for one side, sides are sent to this mission in array format like [west] or [east].

["INITIALIZATION", "M_PLAYERS_Attack_Air.sqf: Started mission."] Call WFBE_CO_FNC_LogContent;

//--- Retrieve the players on a side.
_players = [];
_list = missionNamespace getVariable Format ["WFBE_%1TEAMS",_runFor];
{
	if !(isNil '_x') then {
		if (side _x == _runFor) then {
			if (isPlayer(leader _x) && alive(leader _x)) then {_players = _players + [leader _x]};
		};
	};
} forEach _list;

//--- Ensure that the team already has a town.
if (count _players == 0) exitWith {
	missionNamespace setVariable [Format['_WFBE_M_RUNNINGMISSIONS_%1',_runFor],((missionNamespace getVariable Format['_WFBE_M_RUNNINGMISSIONS_%1',_runFor])) - 1];
};

//--- Radio the designated team that a new mission is available.
[_runFor,"NewMissionAvailable"] Spawn SideMessage;

//--- Define the chopper spawn position.
_boundaries = missionNamespace getVariable "WFBE_BOUNDARIESXY";

_ranPos = [];
_ranDir = [];

_bd = missionNamespace getVariable 'WFBE_BOUNDARIESXY';
if !(isNil '_bd') then {
	_ranPos = [
		[0+random(200),0+random(200),400+random(200)],
		[0+random(200),_bd-random(200),400+random(200)],
		[_bd-random(200),_bd-random(200),400+random(200)],
		[_bd-random(200),0+random(200),400+random(200)]
	];
	_ranDir = [45,145,225,315];
} else {
	_ranPos = [[0+random(200),0+random(200),400+random(200)],[10000+random(200),0+random(200),400+random(200)]];
	_ranDir = [45,315];
};

_ran = round(random((count _ranPos)-1));

//--- This script use PMC units.
_chopper = "Ka60_PMC";
_group = createGroup resistance;
_vehicle = [_chopper, (_ranPos select _ran), WFBE_C_GUER_ID, (_ranDir select _ran), false, true, false, "FLY"] Call WFBE_CO_FNC_CreateVehicle;
_vehicle addEventHandler ['Killed',{[_this select 0,_this select 1,WFBE_C_GUER_ID] Spawn WFBE_CO_FNC_OnUnitKilled}];

//--- Man the chopper.
_pilot = ["Soldier_Pilot_PMC",_group,[0,0,0],WFBE_C_GUER_ID, false] Call WFBE_CO_FNC_CreateUnit;
_pilot moveInDriver _vehicle;
_pilot = ["Soldier_Pilot_PMC",_group,[0,0,0],WFBE_C_GUER_ID, false] Call WFBE_CO_FNC_CreateUnit;
_pilot moveInGunner _vehicle;

//--- Man the extra turrets.
_config = configFile >> "CfgVehicles" >> _chopper >> "Turrets";
_turrets = [_config] call BIS_fnc_returnVehicleTurrets;
if (count _turrets > 0) then {[_turrets, [], _vehicle, "Soldier_Pilot_PMC", _group] call SpawnTurrets};

//--- Warn the client.
[_runFor, "SECOPS_ReceiveMission", ["M_PLAYERS_Attack_Air",_vehicle,_uniqueLabel,_uniqueIndex]] Call WFBE_CO_FNC_SendToClients;

//--- Handle clients JIP for this mission.
_jipHandler = [[_runFor], ["M_PLAYERS_Attack_Air",_vehicle,_uniqueLabel,_uniqueIndex]] Spawn WFBE_SE_FNC_SECOPS_HandleJIP;

//--- Move the chopper toward the target.
while {true} do {
	sleep 20;
	
	_players = [];
	{
		if !(isNil '_x') then {
			if (side _x == _runFor) then {
				if (isPlayer(leader _x) && alive(leader _x)) then {_players = _players + [leader _x]};
			};
		};
	} forEach _list;
	
	if (count _players == 0 || !alive _vehicle || !alive(driver _vehicle) || !canMove _vehicle) exitWith {};
	
	_target = [_vehicle, _players] Call WFBE_CO_FNC_GetClosestEntity;
	{
		if (vehicle _x == _x && !((vehicle _x) isKindOf "Air")) exitWith {_target = _x};
	} forEach _targets;
	
	if !(someAmmo _vehicle) then {[_vehicle,resistance] Call RearmVehicle};
	
	_vehicle doMove (getPos _target);
	{_group reveal _x} forEach (vehicle _target nearEntities 200);
};

if (alive _vehicle || count _players == 0) then {_vehicle setDammage 1};
{if (alive _x || count _players == 0) then {_x setDammage 1}} forEach (units _group);

//--- Kill the spawned thread if it still runs.
if !(scriptDone _jipHandler) then {terminate _jipHandler};

//--- Wait for the client to end up his sync.
sleep 35;

missionNamespace setVariable [Format['_WFBE_M_RUNNINGMISSIONS_%1',_runFor],((missionNamespace getVariable Format['_WFBE_M_RUNNINGMISSIONS_%1',_runFor])) - 1];