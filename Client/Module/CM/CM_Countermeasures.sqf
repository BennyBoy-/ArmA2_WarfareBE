Private ["_flarecount","_i","_isActive","_missile","_type","_vehicle"];
_vehicle = _this select 0;
_missile = _this select 1;

if (alive _vehicle && (getPos _vehicle) select 2 > 5) then {
	_isActive = _vehicle getvariable "FlareActive";
	_type = getNumber (configFile >> "CfgAmmo" >> _missile >> "AirLock");
	if ((_type == 1) && (! _isActive)) then {
		private ["_flarecount"];
		_vehicle setVariable ["FlareActive", true];
		if ((driver _vehicle) == player) then {_vehicle vehicleChat "WARNING: incomming missile!"};
		_flarecount = _vehicle getVariable "FlareCount";
		if (_flarecount > 0) then {
			_this Spawn CM_Spoofing;
			for [{_i=0}, {_i<8}, {_i=_i+1}] do {
				[_vehicle] Call CM_Flares;
				sleep 0.3;
			};
		};
		_vehicle setVariable ["FlareActive", false];
	};
};