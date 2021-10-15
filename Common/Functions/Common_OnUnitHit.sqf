/*
	Triggered whenever a unit take a consequent hit.
	 Parameters:
		- Killed
		- Killer
		- Side ID
*/

Private ["_causedby","_damage","_unit"];

_unit = _this select 0;
_causedby = _this select 1;
_damage = _this select 2;

if (_damage >= 0.05) then {_unit setVariable ["wfbe_lasthitby", _causedby]; _unit setVariable ["wfbe_lasthittime", time]};