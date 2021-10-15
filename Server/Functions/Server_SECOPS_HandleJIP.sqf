/*
	Handle players JIP for secondary missions (if enabled).
	 Parameters:
		- Side (nil is everyone).
		- Information.
*/

Private ['_oldPlayerList','_parameters','_players','_runFor','_sides'];
_sides = _this select 0;
_parameters = _this select 1;

while {true} do {
	_oldPlayerList = playableUnits;
	sleep 15;
	
	{
		_side = _x;
		_players = [];
		{
			if (!(_x in _oldPlayerList) && isPlayer _x && side _x == _side) then {[_players, _x] Call WFBE_CO_FNC_ArrayPush};
		} forEach playableUnits;
		
		if (count _players > 0) then {
			if (WF_A2_Vanilla) then {
				[_side, "SECOPS_ReceiveMission", _parameters] Call WFBE_CO_FNC_SendToClients;
			} else {
				{[_x, "SECOPS_ReceiveMission", _parameters] Call WFBE_CO_FNC_SendToClient} forEach _players;
			};
		};
	} forEach _sides;
};