/*
	Return a parsed gear inventory.
	 Parameters:
		- Weapons
		- Magazines
*/

Private ["_get","_get_backpack","_get_backpack_content","_get_hand","_get_mag_main","_get_mag_seco","_get_misc","_get_prim","_get_seco","_get_spec","_magazines","_return","_unit","_weapons"];

_weapons = _this select 0;
_magazines = _this select 1;
_unit = if (count _this > 2) then {_this select 2} else {objNull};

_return = [];
_get_prim = "";
_get_seco = "";
_get_backpack = "";
_get_hand = "";
_get_spec = [];
_get_misc = [];
_get_mag_main = [];
_get_mag_seco = [];

{
	_get = missionNamespace getVariable _x;
	
	if !(isNil '_get') then {
		switch (_get select 4) do {
			case 0: {_get_prim = _x};
			case 1: {_get_hand = _x};
			case 2: {_get_seco = _x};
			case 3: {_get_prim = _x; _get_seco = ""};
			case 4: {_get_spec = _get_spec + [_x]};
			case 5: {_get_misc = _get_misc + [_x]};
			case 200: {_get_backpack = _x};
			case 201: {_get_backpack = _x};
		};
	};
} forEach _weapons;

{
	_get = missionNamespace getVariable Format ["Mag_%1",_x];
	
	if !(isNil '_get') then {
		switch (_get select 4) do {
			case 100: {_get_mag_seco = _get_mag_seco + [_x]};
			case 101: {_get_mag_main = _get_mag_main + [_x]};
		};
	};
} forEach _magazines;

_get_backpack_content = [[[],[]],[[],[]]];
if (!isNull _unit && _get_backpack != "") then {_get_backpack_content = (_unit) Call WFBE_CL_FNC_GetBackpackContent};

[_get_prim,_get_seco,_get_hand,_get_backpack,_get_spec,_get_misc,_get_mag_main,_get_mag_seco,_get_backpack_content]