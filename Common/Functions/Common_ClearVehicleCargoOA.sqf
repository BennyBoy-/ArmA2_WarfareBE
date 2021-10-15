/*
	Clear the Cargo of a vehicle (Arrowhead).
	 Parameters:
		- Vehicle
*/

Private ["_vehicle"];

_vehicle = _this;

if (count ((getMagazineCargo _vehicle) select 0) > 0) then {clearMagazineCargoGlobal _vehicle};
if (count ((getWeaponCargo _vehicle) select 0) > 0) then {clearWeaponCargoGlobal _vehicle};
if (count ((getBackpackCargo _vehicle) select 0) > 0) then {clearBackpackCargoGlobal _vehicle};