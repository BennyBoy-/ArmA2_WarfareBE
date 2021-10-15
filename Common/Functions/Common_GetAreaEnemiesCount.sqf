/*
	Get enemies in area according to sides.
	 Parameters:
		- Units/Objects array.
		- Friendly Side.
		- {Ignored sides}
*/

Private ["_count","_sides","_sideFriendly","_sideIgnored","_units"];

_units = _this select 0;
_sideFriendly = _this select 1;
_sideIgnored = if (count _this > 2) then {_this select 2} else {[]};

_sides = [west, east, resistance, sideEnemy] - [_sideFriendly] - _sideIgnored;
_count = 0;

{_count = _count + (_x countSide _units)} forEach _sides;

_count