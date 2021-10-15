/*
	Define how an AI leader shall attack a town, this whole process can be customized or replaced by other tactics if needed.
	AI will currently use an ARC system.
	 Parameters:
		- Team.
		- Town Assigned.
*/

Private ["_distance_node","_select","_side","_team","_town_assigned","_wp_dest","_wp_origin","_wp_sel"];

_team = _this select 0;
_town_assigned = _this select 1;

_wp_origin = getPos (leader _team);
_wp_dest = getPos _town_assigned;
_select = _wp_origin;

//--- Clear the AI waypoints
(_team) Call WFBE_CO_FNC_WaypointsRemove;
_distance_node = 700;
_side = (_team getVariable "wfbe_side") Call WFBE_CO_FNC_GetSideID;

//--- If the leader is further than 550m we use a proper attack system.
if (_wp_origin distance _wp_dest > _distance_node) then {
	Private ["_a","_a_path_safe","_a_safe","_angle","_b_path_safe","_b_safe","_dir_to","_max_hops","_nodes","_nodes_a"];
	_dir_to = [_town_assigned, _wp_origin] Call WFBE_CO_FNC_GetDirTo;
	
	_nodes_a = [];
	_nodes = 8;
	_angle = 360/_nodes;
	for '_i' from 0 to _nodes-1 do {
		_a = (_dir_to + (_angle*_i)) mod 360;
		_nodes_a = _nodes_a + [[(_wp_dest select 0) + _distance_node * sin(_a),(_wp_dest select 1) + _distance_node * cos(_a)]];
	};
	_nodes_a = [_wp_origin, _nodes_a] Call WFBE_CO_FNC_SortByDistance;
	_max_hops = (missionNamespace getVariable "WFBE_C_AI_TOWN_ATTACK_HOPS_WP")-2;
	
	//--- First WP
	_wp_sel = [[([_nodes_a select 0, 20, 100] Call WFBE_CO_FNC_GetRandomPosition), 'MOVE', 40, 20, [], [], ["AWARE","","COLUMN","NORMAL"]]];
	
	if (random 100 < 30) exitWith {};
	
	//--- Determine the path to follow.
	_a_safe = [_nodes_a select 1, _side, _town_assigned] Call WFBE_SE_FNC_AI_SetTownAttackPath_PosIsSafe;
	_b_safe = [_nodes_a select 2, _side, _town_assigned] Call WFBE_SE_FNC_AI_SetTownAttackPath_PosIsSafe;
	_a_path_safe = [_nodes_a select 0, _nodes_a select 1, 10] Call WFBE_SE_FNC_AI_SetTownAttackPath_PathIsSafe;
	_b_path_safe = [_nodes_a select 0, _nodes_a select 2, 10] Call WFBE_SE_FNC_AI_SetTownAttackPath_PathIsSafe;
	
	if ((!_a_safe && !_b_safe) || (!_a_path_safe && !_b_path_safe)) exitWith {};
	if (_a_safe && _b_safe) then {
		if (random 1 > 0.5) then {_select = if (_a_path_safe) then {_nodes_a select 1} else {_nodes_a select 2}} else {_select = if (_b_path_safe) then {_nodes_a select 2} else {_nodes_a select 1}};
	} else {
		if (_a_safe) then {_select = if (_a_path_safe) then {_nodes_a select 1} else {_nodes_a select 2}} else {_select = if (_b_path_safe) then {_nodes_a select 2} else {_nodes_a select 1}};
	};
	
	for '_i' from 0 to 1 do {_nodes_a set [_i, false]};
	_nodes_a = _nodes_a - [false];
	[_wp_sel, [([_select, 20, 100] Call WFBE_CO_FNC_GetRandomPosition), 'MOVE', 40, 20, [], [], ["AWARE","","WEDGE","NORMAL"]]] Call WFBE_CO_FNC_ArrayPush;

	//--- Random Path
	for '_i' from 0 to _nodes-1 do {
		if (_i >= _max_hops || random 100 < 50) exitWith {};
		_nodes_a set [0, false];_nodes_a = _nodes_a - [false];
		_nodes_a = [_select, _nodes_a] Call WFBE_CO_FNC_SortByDistance;
		if !([_select, _nodes_a select 0, 10] Call WFBE_SE_FNC_AI_SetTownAttackPath_PathIsSafe) exitWith {};
		_select = _nodes_a select 0;
		_a_safe = [_select, _side, _town_assigned] Call WFBE_SE_FNC_AI_SetTownAttackPath_PosIsSafe;
		if !(_a_safe) exitWith {};
		if (_a_safe) then {[_wp_sel, [([_select, 20, 100] Call WFBE_CO_FNC_GetRandomPosition), 'MOVE', 60, 30, [], [], []]] Call WFBE_CO_FNC_ArrayPush};
	};
	[_team, false, _wp_sel] Call WFBE_CO_FNC_WaypointsAdd;
};

// TODO CHECK THE COMBAT MODE / SPEED. (LIMITED & COMBAT)
// TODO ADD RADIO ON SOME WP COMPLETION - B 1-1 A - HQ, we're attacking %1[town]
_wp_sel = [];

//--- Todo: May secure the camp.
if (random 100 > 50) then {
	Private ["_behaviour","_camps"];
	if ((missionNamespace getVariable "WFBE_C_CAMPS_CREATE") == 1) then {
		_camps = _town_assigned getVariable "camps";
		_camps = [_select, _camps] Call WFBE_CO_FNC_SortByDistance;
		_behaviour = ["AWARE","","VEE","NORMAL"];
		{
			[_wp_sel, [([_x, 10, 35] Call WFBE_CO_FNC_GetRandomPosition), 'SAD', 40, 20, [], [], _behaviour]] Call WFBE_CO_FNC_ArrayPush;
			if (random 100 < 65) exitWith {};
			_behaviour = [];
		} forEach _camps;
	};
};

//--- Depot SAD.
[_wp_sel, [([_wp_dest, 10, 150] Call WFBE_CO_FNC_GetRandomPosition), 'SAD', 35, 25, [], [], ["AWARE","","FILE","NORMAL"]]] Call WFBE_CO_FNC_ArrayPush;
[_wp_sel, [([_wp_dest, 5, 25] Call WFBE_CO_FNC_GetRandomPosition), 'MOVE', 35, 25, [], [], ["AWARE","","FILE","NORMAL"]]] Call WFBE_CO_FNC_ArrayPush;
// [_wp_sel, [([_wp_dest, 10, 35] Call WFBE_CO_FNC_GetRandomPosition), 'SAD', 35, 25, [], [30,45,60], ["COMBAT","","FILE","LIMITED"]]] Call WFBE_CO_FNC_ArrayPush;

[_team, false, _wp_sel] Call WFBE_CO_FNC_WaypointsAdd;