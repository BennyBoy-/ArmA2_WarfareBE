/*
	Give a simple order to a team.
	 Parameters:
		- Team.
		- Destination.
		- WP Kind.
		- {Radius}.
*/

Private ["_destination","_formations","_mission","_radius","_team"];

_team = _this select 0;
_destination = _this select 1;
_mission = _this select 2;
_radius = if (count _this > 3) then {_this select 3} else {30};

[_team,true,[[_destination, _mission, _radius, 20, [], [], []]]] Call WFBE_CO_FNC_WaypointsAdd;