//--- Radiation
Private ['_target','_z'];

_target = _this select 0;
[_target] Spawn {
	Private ["_array","_target"];
	_target = _this select 0;
	for [{_z = 0},{_z < 100},{_z = _z + 1}] do {
		_array = _target nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], 1000];
		{
			_x setDammage (getDammage _x +  0.03);
			{_x setDammage  (getDammage _x + 0.05)} forEach crew _x;
		} forEach _array;
		sleep (5 + random 5);
	};
	deleteVehicle _target;
};