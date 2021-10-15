/*
	Get closest enemy location.
	 Parameters:
		- Entity.
		- Side ID of the friendly side.
		- {Ignored Towns Side IDs}
*/

Private ["_closest","_distance","_entity","_side","_sideID","_ignoredSideID"];

_entity = _this select 0;
_sideID = _this select 1;
_ignoredSideID = if (count _this > 2) then {_this select 2} else {[]};

_closest = objNull;
_distance = 100000;

{
	_side = _x getVariable "sideID";
	if (_side != _sideID && !(_sideID in _ignoredSideID) && (_x distance _entity) < _distance) then {_closest = _x; _distance = _x distance _entity};
} forEach towns;

_closest