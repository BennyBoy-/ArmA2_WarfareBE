/*
	Return the free cargo capacity of a backpack
	 Parameters:
		- unit
		- category to check
		- existing loadout
*/

Private ["_count","_existing_content","_get","_items","_limit_mag","_limit_wep","_m","_prefix","_roomfor_mag","_roomfor_wep","_size","_size_m","_size_w","_unit","_w"];

_unit = _this select 0;
_existing_content = _this select 1;

_limit_mag = getNumber(configFile >> 'CfgVehicles' >> _unit >> "transportMaxMagazines");
_limit_wep = getNumber(configFile >> 'CfgVehicles' >> _unit >> "transportMaxWeapons");

_w = 0;
_size = 0;
_size_w = 0;
_size_m = 0;
_m = 0;

for '_i' from 0 to 2 do {
	if (count(_existing_content select _i) > 0) then {
		_prefix = if (_i == 1) then {"Mag_"} else {""};
		_items = ((_existing_content) select _i) select 0;
		_count = ((_existing_content) select _i) select 1;
		for '_j' from 0 to count(_items)-1 do {
			_get = missionNamespace getVariable Format["%1%2",_prefix,_items select _j];
			if !(isNil '_get') then {
				_size = _size + ((_get select 5) * (_count select _j));
				if (_i == 1) then {
					_m = _m + (_count select _j);
					_size_m = _size_m + ((_get select 5) * (_count select _j));
				} else {
					if ((_get select 4) in [4,5]) then {_m = _m + (_count select _j);_size_m = _size_m + ((_get select 5) * (_count select _j));} else {_w = _w + (_count select _j);_size_w = _size_w + ((_get select 5) * (_count select _j));};
				};
			};
		};
	};
};

_roomfor_mag = if (_m < _limit_mag) then {true} else {false};
_roomfor_wep = if (_w < _limit_wep) then {true} else {false};

[_limit_mag - _size, _roomfor_mag, _roomfor_wep, _size_w, _size_m, _w, _m]