Private["_count","_currentPosition","_direction","_obstacles","_placed","_position","_radius","_retPos","_vehicles"];
scopeName "PlaceSafe";

_position = _this select 0;
_radius = if (count _this > 1) then {_this select 1} else {35};
_retPos = [];

_currentPosition = _position;
_placed = false;
_direction = 0;

for [{_count = 0},{_count < 30 && !_placed},{_count = _count + 1}] do {
	_obstacles = nearestObjects [_currentPosition, ["Building"], 15];
	_vehicles = _currentPosition nearEntities [["Building","Car","Tank","Air"], 7];

	if (count _obstacles > 0 || count _vehicles > 0 || surfaceIsWater _currentPosition) then {
		_currentPosition = [(_position select 0)+((sin _direction)*_radius),(_position select 1)+((cos _direction)*_radius),0];
		_direction = _direction + 36;
		if (_count > 15) then {_radius = _radius + 25};
	} else {
		_retPos = _currentPosition;
		_placed = true;
		breakTo "PlaceSafe";
	};
};

_retPos