Private["_canJoin","_get","_name","_player","_side","_sideOrigin","_uid"];

_player = _this select 0;
_side = _this select 1;
_name = name _player;

_uid = getPlayerUID(_player);
_canJoin = true;

_get = missionNamespace getVariable Format["WFBE_JIP_USER%1",_uid];

if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.
	_sideOrigin = _get select 2; //--- Get the original side.
	
	if (_sideOrigin != _side) then { //--- The joined side differs from the original one.
		_canJoin = false;
		if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_UID_SHOW") == 0) then {_uid = "xxxxxxx"};
		[nil, "LocalizeMessage", ['Teamswap',_name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.
		
		["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_LogContent;
	};
} else {
	["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;
};

["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, _canJoin]] Call WFBE_CO_FNC_LogContent;

if (WF_A2_Vanilla) then {
	[_uid, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClients;
} else {
	[_player, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClient;
};