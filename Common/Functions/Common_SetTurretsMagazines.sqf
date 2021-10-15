/*
	Set the ammunition of a vehicle's turrets.
	 Parameters:
		- Vehicle
		- Turrets (WFBE_CO_FNC_GetVehicleTurretsGear)
*/

Private ["_vehicle", "_turretPath", "_turretsData"];

_vehicle = _this select 0;
_turretsData = _this select 1;

{
	_turretPath = _x select 2;
	{_vehicle addMagazineTurret [_x, _turretPath]} forEach (_x select 1);
} forEach _turretsData;

true