/*
	Event Handler triggered everytime a player disconnect from the server, this file handle all the players disconnection.
	 Parameters:
		- User ID
		- User Name
*/

Private ['_buildings','_commander','_funds','_get','_hq','_id','_name','_old_unit','_old_unit_group','_respawnLoc','_side','_team','_units','_uid'];
_uid = _this select 0;
_name = _this select 1;
_id = _this select 2;

sleep 0.5;

//--- Wait for a proper common & server initialization before going any further.
waitUntil {commonInitComplete && serverInitFull};

if (_name == '__SERVER__' || _uid == '' || local player) exitWith {};

["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] has left the game", _name, _uid]] Call WFBE_CO_FNC_LogContent;

//--- We attempt to get the player information in case that he joined before.
_get = missionNamespace getVariable format["WFBE_JIP_USER%1",_uid];
if (isNil '_get') exitWith {["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] don't have any information stored", _name, _uid]] Call WFBE_CO_FNC_LogContent};

//--- Determine the root team.
_side = _get select 3;

_team = grpNull;
{
	{
		if !(isNil {_x getVariable "wfbe_uid"}) then {if ((_x getVariable "wfbe_uid") == _uid) then {_team = _x}};
		if !(isNull _team) exitWith {};
	} forEach ((_x Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_teams");
	if !(isNull _team) exitWith {};
} forEach WFBE_PRESENTSIDES;

if (isNull _team) exitWith {["WARNING", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] team is null", _name, _uid]] Call WFBE_CO_FNC_LogContent};

//--- We attempt to fetch the client old unit, we need to check if it's group is the right one (on the fly group swapping).
_old_unit = _team getVariable "wfbe_teamleader";
if (isNil '_old_unit') then {
	_old_unit = objNull;
} else {
	if !(alive _old_unit) then {_old_unit = objNull};
};

if (isNull _old_unit) then {
	_old_unit = leader _team;
	["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] current team leader is dead or nil, using original team leader [%3].", _name, _uid, _team]] Call WFBE_CO_FNC_LogContent;
};
_old_unit_group = group _old_unit;

//--- Make sure that our disconnected player group was the same as the original, we simply set him back to his group otherwise).
if (_old_unit_group != _team) then {
	//todo, check if we have at least 1 unit in the old squad.
	Private ["_entitie"];
	_entitie = objNull;
	if ((count (units _old_unit_group)) < 2) then {
		_entitie = [missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side], _old_unit_group, [0,0,0], _side] Call WFBE_CO_FNC_CreateUnit;
	};
	
	[_old_unit] joinSilent _team;
	
	if !(isNull _entitie) then {deleteVehicle _entitie};
	
	["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] was in team [%3] and has been transfered to it's source team [%4].", _name, _uid, _old_unit_group, _team]] Call WFBE_CO_FNC_LogContent;
	
	//--- Make sure that the disconnected unit is the leader of it's group now.
	if (leader _team != _old_unit) then {
		_team selectLeader _old_unit;
		["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] has been set as the leader of it's source team [%3].", _name, _uid, _team]] Call WFBE_CO_FNC_LogContent;
	};
};

//--- We force the unit out of it's vehicle.
if !(isNull(assignedVehicle _old_unit)) then {
	unassignVehicle _old_unit;
	[_old_unit] orderGetIn false;
	[_old_unit] allowGetIn false;
};

//--- Eject the unit if it's in the HQ.
_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
if (vehicle _old_unit == _hq) then {_old_unit action ["EJECT", _hq]};

//--- If we choose not to keep the current units during this session, then we simply remove them.
if ((missionNamespace getVariable "WFBE_C_AI_TEAMS_JIP_PRESERVE") == 0) then {
	["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] units are now being removed for AI Team [%3].", _name, _uid, _team]] Call WFBE_CO_FNC_LogContent;
	_units = units _team;
	_units = _units + ([_team,false] Call GetTeamVehicles) - [_hq];
	{if (!isPlayer _x && !(_x in playableUnits)) then {deleteVehicle _x}} forEach _units;
};

//--- We save the disconnect client funds.
_funds = _team Call GetTeamFunds;
_get set [1,_funds];

//--- We place the unit at the base now.
_buildings = (_side) Call WFBE_CO_FNC_GetSideStructures;
_respawnLoc = _hq;
if (count _buildings > 0) then {
	_respawnLoc = [_old_unit,_buildings] Call WFBE_CO_FNC_GetClosestEntity;
};
_old_unit setPos ([getPos _respawnLoc,20,30] Call GetRandomPosition);

//--- Update the new informations.
missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], _get];

//--- Release the UID.
_team setVariable ["wfbe_uid", nil];
_team setVariable ["wfbe_teamleader", nil];

//--- If AI delegation is enabled, we remove the player's variable.
if ((missionNamespace getVariable "WFBE_C_AI_DELEGATION") > 0) then {
	missionNamespace setVariable [format["WFBE_AI_DELEGATION_%1", _uid], nil];
};

//--- If the player was the commander, we warn the team and sanitize the commander informations.
_commander = (_side) Call WFBE_CO_FNC_GetCommanderTeam;
if !(isNull (_commander)) then {
	if (_team == _commander) then {
		Private ["_logik"];
		_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
		_logik setVariable ["wfbe_commander", objNull, true];
		
		[_side, "LocalizeMessage", ['CommanderDisconnected']] Call WFBE_CO_FNC_SendToClients;
		
		//--- High Command (Remove).
		if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_HC") > 0 && count (hcAllGroups _old_unit) > 0) then {HCRemoveAllGroups _old_unit};
		
		//--- AI Can move freely now & respawn at the default location.
		{[_x,false] Call SetTeamAutonomous;[_x, ""] Call SetTeamRespawn} forEach (_logik getVariable "wfbe_teams");
	};
};