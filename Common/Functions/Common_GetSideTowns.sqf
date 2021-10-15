Private ['_sideID','_towns'];

_sideID = (_this) Call GetSideID;
_towns = [];

{
	if ((_x getVariable 'sideID') == _sideID) then {_towns = _towns + [_x]};
} forEach towns;

_towns