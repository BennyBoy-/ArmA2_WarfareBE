/*
	Handle the missile before that it impact the vehicle, this is only triggered if the vehicle has some IR Smoke deployed.
	Note that the Missile has to be local to the machine that is executing this script.
	Uses modified IKE Shtora from A1.
	 Parameters:
		- Vehicle
		- Missile
		- Ammo
*/

Private ["_ammo", "_get", "_maneuvrability", "_missile", "_missile_range", "_smokeshells", "_vehicle"];

_vehicle = _this select 0;
_missile = _this select 1;
_ammo = _this select 2;

_missile_range = missionNamespace getVariable "WFBE_IRS_AUTO_DETECT_RANGE";
_get = missionNamespace getVariable Format ["%1_IRS", typeOf _vehicle];

//--- Wait until that the missile enter the operative area of the tank.
waitUntil {_missile distance _vehicle < _missile_range};

if !(alive _missile) exitWith {};

//--- Attempt to get the IR Smoke grenade models deployed by the tank within the IR Smoke operative area.
_smokeshells = (getPos _vehicle) nearObjects ["SmokeShellVehicle", missionNamespace getVariable "WFBE_IRS_AREA_OPERATING"];
if (count _smokeshells == 0) exitWith {};

if (random 100 <= (_get select 0)) then {
	//--- Deflect the missile.
	_maneuvrability = if (isNumber (configFile >> "CfgAmmo" >> _ammo >> "maneuvrability")) then {getNumber (configFile >> "CfgAmmo" >> _ammo >> "maneuvrability")} else {20};
	
	_calculated = 0; 
	while {(_missile distance _vehicle) > (round _calculated)} do {
		if (!alive _missile || !alive _vehicle) exitWith {};
		_vm = velocity _missile;
		_vmx = (_vm select 0)+(random 10);
		_vmy = (_vm select 1)+(random 10);
		_vmz = (_vm select 2)+(random 10);

		_vh = velocity _vehicle;
		_vhx = (_vh select 0)^2;
		_vhy = (_vh select 1)^2;
		_vhz = (_vh select 2)^2;

		_vdx = _vhx - _vmx;
		_vdy = _vhy - _vmy;
		_vdz = _vhz - _vmz;

		_calculated = 25+(((_vdx^2) + (_vdy^2) + (_vdz))^(1/3));
		if !(alive _missile) exitWith {};
	};
	
	_count = 0;
	while {_count < 10} do {
		if (!alive _missile || !alive _vehicle) exitWith {};

		_dm = vectorDir _missile;
		_um = vectorUp _missile;

		_dmx = _dm select 0;
		_dmy = _dm select 1;
		_dmz = _dm select 2;
		_missile setVectorDirAndUp [[(_dmx + ((random _maneuvrability) - (_maneuvrability / 2)) / 30), (_dmy + ((random _maneuvrability) - (_maneuvrability / 2)) / 30), (_dmz + ((random _maneuvrability) - (_maneuvrability / 1.25)) / 30)], _um];
		sleep 0.01;
		_count =_count +1;
	};
};