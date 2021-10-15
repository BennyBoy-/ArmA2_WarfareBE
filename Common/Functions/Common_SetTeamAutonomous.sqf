Private['_status','_team'];

_team = _this select 0;
_status = _this select 1;

if (isNull _team) exitWith {};

_team setVariable ["wfbe_autonomous", _status, true];