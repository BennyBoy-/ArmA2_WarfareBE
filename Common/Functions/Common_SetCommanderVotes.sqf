Private["_logik","_side","_value"];

_side = _this select 0;
_value = _this select 1;

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

{
	if ((_x getVariable "wfbe_vote") != _value) then {_x setVariable ["wfbe_vote", _value, true]};
} forEach (_logik getVariable "wfbe_teams");