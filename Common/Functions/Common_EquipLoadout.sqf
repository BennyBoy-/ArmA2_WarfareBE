Private['_ammo','_unit','_use','_weapon','_weapons'];

_unit = _this select 0;
_weapons = _this select 1;
_ammo = _this select 2;

removeAllWeapons _unit;
removeAllItems _unit;

{_unit addMagazine _x} forEach _ammo;
{_unit addWeapon _x} forEach _weapons;

_use = primaryWeapon _unit;
if (_use == "") then {
	Private ["_kind"];
	{
		_kind = getNumber(configFile >> 'CfgWeapons' >> _x >> "type");
		if (_kind in [1,2,4,5]) exitWith {_use = _x};
	} forEach _weapons;
};

if (_use != "") then {
	Private ["_muzzles"];
	_muzzles = getArray (configFile >> "CfgWeapons" >> _use >> "muzzles"); 
	if !("this" in _muzzles) then {_unit selectWeapon (_muzzles select 0)} else {_unit selectWeapon _use}; 
};