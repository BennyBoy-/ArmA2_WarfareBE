/*
	Update the gear price
*/

Private ["_count_old","_count_new","_counts","_difference","_div","_find","_gear","_gear_bp","_gear_mags","_gear_new","_gear_old","_gear_veh","_get","_iprice","_mags","_prefix","_price"];

_gear = +(_this select 0);
_gear_mags = +(_this select 1);
_gear_bp = +(_this select 2);
_gear_veh = +(_this select 3);

_price = 0;
_div = missionNamespace getVariable "WFBE_C_PLAYERS_GEAR_SELL_COEF";

_prefix = "";
{
	_gear_old = _x select 0;
	_gear_new = _x select 1;
	
	_iprice = 0;
	{
		_find = _gear_new find _x;
		_get = missionNamespace getVariable Format["%1%2",_prefix,_x];
		if !(isNil '_get') then {if (_find != -1) then {_gear_new set [_find, false]} else {_iprice = _iprice - (_get select 2)}};
	} forEach _gear_old;
	_price = _price + round(_iprice*_div);
	{
		if (typeName _x == "STRING") then {
			_get = missionNamespace getVariable Format["%1%2",_prefix,_x];
			if !(isNil '_get') then {_price = _price + (_get select 2)};
		};
	} forEach _gear_new;
	
	_prefix = "Mag_";
} forEach [_gear,_gear_mags];

if !(WF_A2_Vanilla) then {
	{
		_gear_new = _x select 1;
		_gear_old = _x select 0;

		_prefix = "";
		for '_k' from 0 to count(_gear_old)-1 do {
			_mags = (_gear_old select _k) select 0;
			_counts = (_gear_old select _k) select 1;
			
			_iprice = 0;
			
			for '_i' from 0 to count(_mags)-1 do {
				_find = ((_gear_new select _k) select 0) find (_mags select _i);
				_get = missionNamespace getVariable Format["%1%2",_prefix,(_mags select _i)];
				if !(isNil '_get') then {
					_count_old = _counts select _i; 
					if (_find != -1) then {
						_count_new = ((_gear_new select _k) select 1) select _find;
						_difference = (_count_new - _count_old);
						if (_difference < 0) then {
							((_gear_new select _k) select 0) set [_find, false];
							_iprice = _iprice - ((_get select 2)*(_difference));
						} else {
							((_gear_new select _k) select 1) set [_find, _difference];
						};
					} else {
						_iprice = _iprice - ((_get select 2)*(_count_old));
					};
				};
			};
			
			_price = _price - abs(round(_iprice*_div));
			_prefix = if (_k == 0) then {"Mag_"} else {""};
		};
		
		_prefix = "";
		for '_k' from 0 to count(_gear_new)-1 do {
			_mags = (_gear_new select _k) select 0;
			_counts = (_gear_new select _k) select 1;
			
			for '_i' from 0 to count(_mags)-1 do {
				if (typeName(_mags select _i) == "STRING") then {
					_get = missionNamespace getVariable Format["%1%2",_prefix,(_mags select _i)];
					if !(isNil '_get') then {
						_price = _price + ((_get select 2)*(_counts select _i));
					};
				};
			};
			
			_prefix = if (_k == 0) then {"Mag_"} else {""};
		} forEach _gear_new;
	} forEach [_gear_bp, _gear_veh];
};

[_price]