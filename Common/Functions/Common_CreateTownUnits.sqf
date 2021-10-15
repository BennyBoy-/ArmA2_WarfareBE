/*
	Create units in towns.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_groups", "_lock", "_position", "_positions", "_side", "_sideID", "_team", "_teams", "_town", "_town_teams", "_town_vehicles"];

_town = _this select 0;
_side = _this select 1;
_groups = _this select 2;
_positions = _this select 3;
_teams = _this select 4;
_sideID = (_side) call WFBE_CO_FNC_GetSideID;

_built = 0;
_builtveh = 0;
_town_teams = [];
_town_vehicles = [];

_lock = if ((missionNamespace getVariable "WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER") == 0 && _side == WFBE_DEFENDER) then {false} else {true};

for '_i' from 0 to count(_groups)-1 do {
	_position = _positions select _i;
	_team = _teams select _i;
	
	_retVal = [_groups select _i, _position, _side, _lock, _team, true, 90] call WFBE_CO_FNC_CreateTeam;
	_vehicles = _retVal select 1;
	_built = _built + count(_retVal select 0);
	_builtveh = _builtveh + (count _vehicles);

	[_town, _team, _sideID] execFSM "Server\FSM\server_town_patrol.fsm";
	[_team, 400, _position] spawn WFBE_CO_FNC_RevealArea;
	[_town_teams, _team] call WFBE_CO_FNC_ArrayPush;
	{
		[_town_vehicles, _x] call WFBE_CO_FNC_ArrayPush;
		if (isServer) then {
			_x spawn HandleEmptyVehicle;
			_x setVariable ["WFBE_Taxi_Prohib", true];
		};
	} forEach _vehicles;

	if ((missionNamespace getVariable "WFBE_C_MODULE_UPSMON") > 0) then {[leader _team,Format ['UPSMON_TOWN_%1',str _town],"move","nofollow","fortify","reinforcement"] spawn UPSMON};
};

if (_built > 0) then {[str _side,'UnitsCreated',_built] call UpdateStatistics};
if (_builtveh > 0) then {[str _side,'VehiclesCreated',_builtveh] call UpdateStatistics};

["INFORMATION", Format["Common_CreateTownUnits.sqf: [%1] [%2] Created units [%3].", _town, _side, _built + _builtveh]] Call WFBE_CO_FNC_LogContent;

[_town_teams, _town_vehicles]