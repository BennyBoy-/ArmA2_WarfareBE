/*
	Return the free cargo capacity of a vehicle
	 Parameters:
		- unit
		- category to check
		- existing loadout
*/

Private ["_b","_count","_existing_content","_get","_items","_limit_bak","_limit_mag","_limit_wep","_m","_prefix","_unit","_w"];

_unit = _this select 0;
_existing_content = _this select 1;

_limit_bak = getNumber(configFile >> 'CfgVehicles' >> _unit >> "transportMaxBackpacks");
_limit_mag = getNumber(configFile >> 'CfgVehicles' >> _unit >> "transportMaxMagazines");
_limit_wep = getNumber(configFile >> 'CfgVehicles' >> _unit >> "transportMaxWeapons");

_w = 0;_b = 0;_m = 0;

for '_i' from 0 to 2 do {
	if (count(_existing_content select _i) > 0) then {
		_prefix = if (_i == 1) then {"Mag_"} else {""};
		_items = ((_existing_content) select _i) select 0;
		_count = ((_existing_content) select _i) select 1;
		for '_j' from 0 to count(_items)-1 do {
			_get = missionNamespace getVariable Format["%1%2",_prefix,_items select _j];
			if !(isNil '_get') then {
				switch (true) do {
					case ((_get select 4) in [4,5,100,101]): {_m = _m + (_count select _j)};
					case ((_get select 4) < 4): {_w = _w + (_count select _j)};
					case ((_get select 4) in [200,201]): {_b = _b + (_count select _j)};
				};
			};
		};
	};
};

[_limit_wep - _w, _limit_mag - _m, _limit_bak - _b, _w, _m, _b]