/*
	Remove a magazine from the gear menu.
	 Parameters:
		- Magazines
		- Index
*/

Private ["_get","_size"];

_magazines = _this select 0;
_index = _this select 1;

_i = 0;
_size = 0;
_exit = false;
{
	_get = missionNamespace getVariable Format["Mag_%1",_x];
	
	if !(isNil '_x') then {
		_size = _size + (_get select 5);
		if (_index <= _size) then {_exit = true;_index = _i};
		_i = _i + 1;
	};
	
	if (_exit) exitWith {};
} forEach _magazines;

_magazines set [_index, false];
_magazines = _magazines - [false];

_magazines