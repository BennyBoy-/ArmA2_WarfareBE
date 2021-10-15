/*
	Return the closest object among a list
	 Parameters:
		- Entity.
		- List.
*/

Private["_distance","_nearest","_object","_objects"];

_object = _this select 0;
_objects = _this select 1;

_nearest = objNull;
_distance = 100000;
{if (_x distance _object < _distance) then {_nearest = _x;_distance = _x distance _object}} forEach _objects;

_nearest