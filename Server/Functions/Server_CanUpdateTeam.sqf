/* 
	Author: Benny
	Name: Server_CanUpdateTeam.sqf
	Parameters:
	  0 - Group
	Description:
	  This function detect whether a human commander is in command or not and if a team is in the 'main' teams.
*/

Private ['_canUpdate','_commander','_team'];
_team = _this;

_canUpdate = true;
if !(isNil {_team getVariable "wfbe_persistent"}) then {
	_commander = (side _team) Call WFBE_CO_FNC_GetCommanderTeam;
	if !(isNull _commander) then {_canUpdate = false};
};

_canUpdate