Private["_destination","_direction","_faceAway","_maxRadius","_minRadius","_object","_placeSafe","_position","_radius","_randomDirection","_safeRadius"];

_object = _this Select 0;
_position = _this Select 1;
_minRadius = _this Select 2;
_maxRadius = _this Select 3;

_faceAway = true;
if (Count _this > 4) then {_faceAway = _this Select 4};

_randomDirection = true;
if (Count _this > 5) then {_randomDirection = _this Select 5};

_placeSafe = false;
if (Count _this > 6) then {_placeSafe = _this Select 6};

_direction = Random 360;
_radius = (Random (_maxRadius - _minRadius)) + _minRadius;

if (_placeSafe) then {
	_safeRadius = (_maxRadius - _minRadius) / 2;
	if (_safeRadius < 5) then {_safeRadius = 5};
	_destination = [(_position Select 0)+((sin _direction)*_radius),(_position Select 1)+((cos _direction)*_radius),(_position Select 2)+0.5];
	[_object,_destination,_safeRadius] Call PlaceSafe;
} else {
	_object SetPos [(_position Select 0)+((sin _direction)*_radius),(_position Select 1)+((cos _direction)*_radius),(_position Select 2)+0.5];
};

if (_randomDirection) then {_object SetDir Random 360};

if (_faceAway) then {
	_destination = GetPos _object;
	_object SetDir -((((_destination Select 1) - (_position Select 1)) atan2 ((_destination Select 0) - (_position Select 0))) - 90);
};