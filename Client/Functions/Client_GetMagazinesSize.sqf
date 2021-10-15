/*
	Calculate the size of the magazines
	 Parameters:
		- Magazines
*/

Private ["_get","_size"];

_size = 0;

{
	_get = missionNamespace getVariable Format["Mag_%1",_x];
	
	if !(isNil '_x') then {
		_size = _size + (_get select 5);
	};
} forEach _this;

_size