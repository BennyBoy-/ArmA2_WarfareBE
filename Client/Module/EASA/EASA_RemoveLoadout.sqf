Private ['_loadout','_vehicle'];
_vehicle = _this select 0;
_loadout = _this select 1;

{
	for [{_i = count(_x)-1},{_i >= 0},{_i = _i - 1}] do {
		if (_i > 0) then {
			_vehicle removeMagazine (_x select _i);
		} else {
			_vehicle removeWeapon (_x select _i);
		};
	};
} forEach _loadout;