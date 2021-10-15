Private["_belowUnits","_height","_min","_units","_z"];

_units = _this Select 0;
_height = _this Select 1;
_min = if (count _this > 2) then {_this select 2} else {-10};

_belowUnits = [];

{_z = getPos _x select 2;if (_z < _height && _z >= _min) then {_belowUnits = _belowUnits + [_x]}} ForEach _units;

_belowUnits