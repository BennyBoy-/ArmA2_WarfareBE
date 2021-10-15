/*
	Equip a vehicle
	 Parameters:
		- Vehicle
		- Vehicle Content
*/

Private ["_counts","_items","_vehicle","_vehicle_content"];

_vehicle = _this select 0;
_vehicle_content = _this select 1;

//--- Make sure that the vehicle is alive.
if (alive _vehicle) then {
	//--- Clear the existing default content.
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	
	//--- Don't bother if there is no content.
	if (count _vehicle_content == 0) exitWith {};
	
	//--- Weapons
	_items = (_vehicle_content select 0) select 0;
	_counts = (_vehicle_content select 0) select 1;
	
	for '_i' from 0 to count(_items) do {_vehicle addWeaponCargoGlobal [_items select _i, _counts select _i]};
	
	//--- Ammo
	_items = (_vehicle_content select 1) select 0;
	_counts = (_vehicle_content select 1) select 1;
	
	for '_i' from 0 to count(_items) do {_vehicle addMagazineCargoGlobal [_items select _i, _counts select _i]};
	
	//--- Backpack
	_items = (_vehicle_content select 2) select 0;
	_counts = (_vehicle_content select 2) select 1;
	
	for '_i' from 0 to count(_items) do {_vehicle addBackpackCargoGlobal [_items select _i, _counts select _i]};
};