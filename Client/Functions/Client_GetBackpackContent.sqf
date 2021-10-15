/*
	Return the gear of unit's backpack.
	 Parameters:
		- unit
*/

Private ["_return"];

_return = [[],[]];

if !(isNull (unitBackpack _this)) then {
	_return set [0, getWeaponCargo(unitBackpack _this)];
	_return set [1, getMagazineCargo(unitBackpack _this)];
};

_return