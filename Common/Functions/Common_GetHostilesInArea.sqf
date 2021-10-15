Private ['_hostiles','_object','_objects','_safeFromSide','_within'];
_object = _this select 0;
_safeFromSide = _this select 1;
_within = if (count _this > 2) then {_this select 2} else {50};

_objects = _object nearEntities[["Man","Car","Motorcycle","Tank","Air"],_within];
_hostiles = 0;

if (typeName _safeFromSide == 'ARRAY') then {
	{
		_hostiles = _hostiles + (_x countSide _objects);
	} forEach _safeFromSide;
};
if (typeName _safeFromSide == 'SIDE') then {
	_hostiles = _hostiles + (_safeFromSide countSide _objects);
};

_hostiles