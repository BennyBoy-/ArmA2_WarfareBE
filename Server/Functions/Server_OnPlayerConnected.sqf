/*
	Event Handler triggered everytime a player connect to the server, this file handle the first connection along with the JIP connections of a player.
	 Parameters:
		- User ID
		- User Name
*/

Private ['_funds','_get','_id','_max','_name','_sideJoined','_sideOrigin','_team','_uid','_units'];
_uid = _this select 0;
_name = _this select 1;
_id = _this select 2;

//--- Wait for a proper common & server initialization before going any further.
waitUntil {commonInitComplete && serverInitFull};

["INFORMATION", Format ["Server_PlayerConnected.sqf: Player [%1] [%2] has joined the game", _name, _uid]] Call WFBE_CO_FNC_LogContent;

//--- Skip this script if the server is trying to run this.
if (_name == '__SERVER__' || _uid == '' || local player) exitWith {};

//--- We try to get the player and it's group from the playableUnits.
_max = 10;
_team = grpNull;

while {_max > 0 && isNull _team} do {
	{
		if ((getPlayerUID _x) == _uid) exitWith {_team = group _x};
	} forEach playableUnits;
	
	if (isNull _team) then {sleep 0.5};
	_max = _max - 1;
};

//--- Make sure that we've found a team, otherwise we simply exit.
if (isNull _team) exitWith {["WARNING", Format ["Server_PlayerConnected.sqf: Player [%1] [%2] is not defined within the warfare teams.", _name, _uid]] Call WFBE_CO_FNC_LogContent};

//--- Make sure that our client is a warfare client, the side variable is only defined for warfare slots, otherwise we simply exit.
_sideJoined = _team getVariable "wfbe_side";
if (isNil '_sideJoined') exitWith {["WARNING", Format ["Server_PlayerConnected.sqf: Player [%1] [%2] side couldn't be determined from team [%3].", _name, _uid, _team]] Call WFBE_CO_FNC_LogContent};

//--- We attempt to get the player informations in case that he joined before.
_get = missionNamespace getVariable format["WFBE_JIP_USER%1",_uid];

//--- We force the unit out of it's vehicle.
if !(isNull(assignedVehicle (leader _team))) then {
	unassignVehicle (leader _team);
	[leader _team] orderGetIn false;
	[leader _team] allowGetIn false;
};

//--- If we choose not to keep the current units during this session, then we simply remove them.
if ((missionNamespace getVariable "WFBE_C_AI_TEAMS_JIP_PRESERVE") == 0) then {
	["INFORMATION", Format ["Server_PlayerConnected.sqf: Team [%1] units are now being removed for player [%1] [%2].", _team, _name, _uid]] Call WFBE_CO_FNC_LogContent;
	_units = units _team;
	_units = _units + ([_team,false] Call GetTeamVehicles);
	{if (!isPlayer _x && !(_x in playableUnits)) then {deleteVehicle _x}} forEach _units;
};

//--- We 'Sanitize' the player, we remove the waypoints and we heal him.
_team Call WFBE_CO_FNC_WaypointsRemove;
(leader _team) setDammage 0;

//--- We store the player UID over the group, this allows us to easily fetch the disconnecting client original group.
_team setVariable ["wfbe_uid", _uid];
_team setVariable ["wfbe_teamleader", leader _team];

//--- If AI delegation is enabled, we create a special variable for player based on his UID and ID.  FPS | Groups handled | Session ID.
if ((missionNamespace getVariable "WFBE_C_AI_DELEGATION") > 0) then {
	missionNamespace setVariable [format["WFBE_AI_DELEGATION_%1", _uid], [0,0,_id]];
};

//--- The player has joined for the first time.
if (isNil '_get') exitWith {
	/* 
		UID | Cash | Side | Current Side
		The JIP system store the main informations about a client, the UID is used to track the player all along the session.
	*/
	missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], [_uid, 0, _sideJoined, _sideJoined]];

	_team setVariable ["wfbe_funds", missionNamespace getVariable format ["WFBE_C_ECONOMY_FUNDS_START_%1", _sideJoined], true];
	["INFORMATION", Format ["Server_PlayerConnected.sqf: Team [%1] Leader [%2] JIP Information have been stored for the first time.", _team, _uid]] Call WFBE_CO_FNC_LogContent;
};

//--- The player has already joined the session previously, we just need to update the informations.
_get set [3, _sideJoined];

//--- Get the previous informations.
_funds = _get select 1;
_sideOrigin = _get select 2;

//--- Update the new informations.
missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], _get];

//--- Make sure that the player didn't teamswap.
if (_sideOrigin != _sideJoined) then {
	_funds = missionNamespace getVariable Format ["WFBE_C_ECONOMY_FUNDS_START_%1", _sideJoined];
};

//--- Set the current player funds.
_team setVariable ["wfbe_funds", _funds, true];