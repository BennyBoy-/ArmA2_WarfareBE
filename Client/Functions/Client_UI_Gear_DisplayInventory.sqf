/*
	Display the gear inventory.
	 Parameters:
		- Weapons
		- Magazines
		- Refresh parts
*/

Private ["_magazines","_weapons"];

_weapons = _this select 0;
_magazines = _this select 1;
_refresh = _this select 2;

_update_weapons = false;
_update_magazines = false;
_update_magazines_sec = false;
_update_items = false;
_update_special = false;

if ("all" in _refresh) then {_update_weapons = true;_update_magazines = true; _update_magazines_sec = true; _update_special = true;_update_items = true;};
if ("items" in _refresh) then {_update_items = true};
if ("magazines_main" in _refresh) then {_update_magazines = true};
if ("magazines_hand" in _refresh) then {_update_magazines_sec = true};
if ("weapons" in _refresh) then {_update_weapons = true};
if ("special" in _refresh) then {_update_special = true};

if (_update_weapons) then {
	_idc_prim = 503401;
	_idc_seco = 503402;
	_idc_side = 503403;

	{
		_get = missionNamespace getVariable _x;
		
		if !(isNil '_get') then {
			switch (_get select 4) do {
				case 0: {ctrlSetText [_idc_prim, _get select 0]; ctrlShow[_idc_seco, true]; _idc_prim = 0};
				case 1: {ctrlSetText [_idc_side, _get select 0]; _idc_side = 0};
				case 2: {ctrlSetText [_idc_seco, _get select 0]; ctrlShow[_idc_seco, true]; _idc_seco = 0};
				case 3: {ctrlSetText [_idc_prim, _get select 0]; ctrlShow[_idc_seco, false]; _idc_prim = 0; _idc_seco = 0};
				case 200: {ctrlSetText [_idc_seco, _get select 0]; ctrlShow[_idc_seco, true]; _idc_seco = 0};
				case 201: {ctrlSetText [_idc_seco, _get select 0]; ctrlShow[_idc_seco, true]; _idc_seco = 0};
			};
		};
	} forEach _weapons;
	
	if (_idc_prim != 0) then {ctrlSetText[_idc_prim, '\ca\ui\data\ui_gear_gun_gs.paa']};
	if (_idc_seco != 0) then {ctrlSetText[_idc_seco, '\ca\ui\data\ui_gear_sec_gs.paa']; ctrlShow[_idc_seco, true];};
	if (_idc_side != 0) then {ctrlSetText[_idc_side, '\ca\ui\data\ui_gear_hgun_gs.paa']};
};

if (_update_special) then {
	_idcs = [503533, 503534];
	_i = 0;
	
	{
		_get = missionNamespace getVariable _x;
		
		if !(isNil '_get') then {
			if ((_get select 4) == 4) then {
				ctrlSetText[_idcs select _i, _get select 0];
				_idcs set [_i, 0];
				_i = _i + 1;
			};
		};

		if (_i >= 2) exitWith {};
	} forEach _weapons;
	
	{if (_x != 0) then {ctrlSetText[_x, '\ca\ui\data\ui_gear_eq_gs.paa']}} forEach _idcs;
};
if (_update_items) then {
	_idcs = 503521;
	_i = 0;
	
	{
		_get = missionNamespace getVariable _x;
		
		if !(isNil '_get') then {
			if ((_get select 4) == 5) then {
				ctrlSetText[_idcs + _i, _get select 0];
				_i = _i + 1;
			};
		};
		
		if (_i >= 12) exitWith {};
	} forEach _weapons;
	for '_j' from 11 to _i step -1 do {ctrlSetText[_idcs + _j, '\ca\ui\data\ui_gear_eq_gs.paa'];};
};

if (_update_magazines) then {
	_idcs = 503501;
	_i = 0;
	
	{
		_get = missionNamespace getVariable Format["Mag_%1",_x];
		
		if !(isNil '_get') then {
			if ((_get select 4) == 101) then {
				_size = _get select 5;
				ctrlSetText[_idcs + _i, _get select 0];
				_i = _i + 1;
				for '_j' from _size-2 to 0 step -1 do {
					ctrlSetText[_idcs + _i, ""];
					_i = _i + 1;
				};
			};
		};
		
		if (_i >= 12) exitWith {};
	} forEach _magazines;
	
	for '_j' from 11 to _i step -1 do {ctrlSetText[_idcs + _j, '\ca\ui\data\ui_gear_mag_gs.paa'];};
};

if (_update_magazines_sec) then {
	_idcs = 503513;
	_i = 0;
	
	{
		_get = missionNamespace getVariable Format["Mag_%1",_x];
		
		if !(isNil '_get') then {
			if ((_get select 4) == 100) then {
				_size = _get select 5;
				ctrlSetText[_idcs + _i, _get select 0];
				_i = _i + 1;
				for '_j' from _size-2 to 0 step -1 do {
					ctrlSetText[_idcs + _i, ""];
					_i = _i + 1;
				};
			};
		};
		
		if (_i >= 8) exitWith {};
	} forEach _magazines;
	
	for '_j' from 7 to _i step -1 do {ctrlSetText[_idcs + _j, '\ca\ui\data\ui_gear_hgunmag_gs.paa'];};
};