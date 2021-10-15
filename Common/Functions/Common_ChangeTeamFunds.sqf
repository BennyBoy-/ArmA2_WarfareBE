Private['_amount','_team'];

_team = _this select 0;
_amount = _this select 1;

if (isNull _team) exitWith {};

_team setVariable ["wfbe_funds", (_team getVariable "wfbe_funds") + _amount, true];