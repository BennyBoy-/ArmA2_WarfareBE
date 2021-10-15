Private ['_add','_buildings','_built','_checks','_closest','_cw','_d','_dir','_driver','_group','_gunner','_lastWP','_lastWPpos','_logic','_logicMARTA','_pos','_radius','_sorted','_spawn','_step','_uav','_waypoints','_wp','_wpcount'];
_logic = WF_Logic;

if (!isNull playerUAV) then {if (!alive playerUAV) then {playerUAV = objNull}};
if (!isNull playerUAV) exitWith {
	//--- Disable targetting.
	{(driver playerUAV) disableAI _x} forEach ["TARGET","AUTOTARGET"];
	if (WF_A2_Vanilla) then {
		ExecVM "Client\Module\UAV\uav_interface.sqf";
	} else {
		ExecVM "Client\Module\UAV\uav_interface_oa.sqf";
	};
};

//--- Execute MARTA
if (isnil "bis_marta_mainscope") then {
	_logicMARTA = (group _logic) createunit ["MartaManager",position player,[],0,"none"];
};

if (isNil {missionNamespace getVariable Format ["WFBE_%1UAV",sideJoinedText]}) exitWith {};
if ((missionNamespace getVariable Format ["WFBE_%1UAV",sideJoinedText]) == "") exitWith {};

_buildings = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;
_checks = [sideJoined,missionNamespace getVariable Format ["WFBE_%1COMMANDCENTERTYPE",sideJoinedText],_buildings] Call GetFactories;
_closest = objNull;
if (count _checks > 0) then {
	_closest = [player,_checks] Call WFBE_CO_FNC_GetClosestEntity;
};

if (isNull _closest) exitWith {};

_uav = createVehicle [missionNamespace getVariable Format ["WFBE_%1UAV",sideJoinedText],getPos _closest, [], 0, "FLY"];
playerUAV = _uav;
Call Compile Format ["_uav addEventHandler ['Killed',{[_this select 0,_this select 1,%1] Spawn WFBE_CO_FNC_OnUnitKilled}]",sideID];
_uav setVehicleInit Format["[this,%1] ExecVM 'Common\Init\Init_Unit.sqf';",sideID];
processInitCommands;

//--- Remove weapons if air restriction is enabled.
if ((missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR") == 2) then {removeAllWeapons _uav};

_group = createGroup sideJoined;
_driver = [missionNamespace getVariable Format ["WFBE_%1SOLDIER",sideJoinedText],_group,getPos _uav,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
_driver moveInDriver _uav;

//--- Disable targetting.
{(driver playerUAV) disableAI _x} forEach ["TARGET","AUTOTARGET"];

_built = 1;
//--- OPFOR Uav has no gunner slot.
if (sideJoined == west) then {
	_gunner = [missionNamespace getVariable Format ["WFBE_%1SOLDIER",sideJoinedText],_group,getPos _uav,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
	_gunner MoveInGunner _uav;
	_built = _built + 1;
};
[sideJoinedText,'UnitsCreated',_built] Call UpdateStatistics;
[sideJoinedText,'VehiclesCreated',1] Call UpdateStatistics;

-12500 Call ChangePlayerFunds;

["RequestSpecial", ["uav",sideJoined,_uav,clientTeam]] Call WFBE_CO_FNC_SendToServer;

sleep 0.02;

if ((count units _uav) > 1) then {[driver _uav] join grpnull};

_radius = 1000;
_wpcount = 4;
_step = 360 / _wpcount;
_add = 0;
_cw = true;
_dir = 0;
if !(isNil "_lastWP") then {deleteWaypoint _lastWP};

//--- No need to preprocess those.
if (WF_A2_Vanilla) then {
	ExecVM "Client\Module\UAV\uav_interface.sqf";
} else {
	ExecVM "Client\Module\UAV\uav_interface_oa.sqf";
};
[_uav] ExecVM 'Client\Module\UAV\uav_spotter.sqf';

_spawn = [] spawn {}; //--- Empty spawn
while {alive _uav} do {
	waituntil {waypointDescription [group _uav,currentWaypoint group _uav] != ' ' || !alive _uav};
	terminate _spawn; //--- Terminate spawn from previous loop
	if !(alive _uav) exitWith {};

	_waypoints = waypoints _uav;
	_lastWP = _waypoints select (count _waypoints - 1);
	_lastWPpos = waypointPosition _lastWP;
	deleteWaypoint _lastWP;
	for "_d" from 0 to (360-_step) step _step do
	{
		_add = _d;
		if !(_cw) then {_add = -_d};
		_pos = [_lastWPpos, _radius, _dir+_add] call bis_fnc_relPos;
		_wp = (group _uav) addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointDescription ' ';
		_wp setWaypointCompletionRadius (1000/_wpcount);
	};

	_spawn = [_uav,_add,_step,_lastWPpos,_radius,_dir] spawn {
		Private ['_add','_currentWP','_dir','_lastWPpos','_pos','_radius','_step','_uav','_wp'];
		scriptname "UAV Route planning";
		_uav = _this select 0;
		_add = _this select 1;
		_step = _this select 2;
		_lastWPpos = _this select 3;
		_radius = _this select 4;
		_dir = _this select 5;
		_currentWP = currentWaypoint group _uav;
		while {alive _uav} do {
			waitUntil {_currentWP != currentWaypoint group _uav};
			sleep .01;
			_add = _add + _step;
			if !(_cw) then {_add = -_add};
			_pos = [_lastWPpos, _radius, _dir+_add] call bis_fnc_relPos;
			_wp = (group _uav) addWaypoint [_pos,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointDescription ' ';
			_wp setWaypointCompletionRadius (1000/_wpcount);
			_currentWP = currentWaypoint group _uav;
		};
	};

	_wpcount = count waypoints _uav;
	waitUntil {waypointDescription [group _uav,currentWaypoint group _uav] == ' ' || _wpcount != count waypoints _uav || !alive _uav};
	if (!(alive _uav)||isNull _uav) exitWith {};
};
