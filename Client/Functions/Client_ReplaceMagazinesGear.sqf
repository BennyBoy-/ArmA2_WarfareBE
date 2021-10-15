/*
	Replace a weapon's magazines with a new weapon's magazines.
	 Parameters:
		- Old weapon
		- New weapon
		- Current Magazines
*/

Private ["_old","_new"];

_old = _this select 0;
_new = _this select 1;
_mags = _this select 2;

_get = missionNamespace getVariable _old;
_old_mags = _get select 6;
_old_belong = _get select 4;
_pool_max = if ((_get select 4) == 2) then {8} else {12};
_get = missionNamespace getVariable _new;

_new_mags = if (isNil '_get') then {[]} else {_get select 6};
if (count _new_mags == 0) exitWith {_mags - _old_mags};

_skip = false;
if (_old_belong in [0,3]) then {
	_get = missionNamespace getVariable Format ["Mag_%1",(_new_mags select 0)];
	if ((_get select 4) == 100) then {_skip = true};
};

if (_skip) exitWith {_mags - _old_mags};

_replaced = [];
{
	_get = missionNamespace getVariable Format ["Mag_%1",_x];
	if ({_x == (_get select 6)} count _old_mags > 0) then {_replaced = _replaced + [_x]};
} forEach _mags;

if (count _replaced > 0) then {
	_replace_with = "";
	_replace_size = 0;
	{
		_get = missionNamespace getVariable Format ["Mag_%1",_x];
		if (true) exitWith {_replace_with = _get select 6;_replace_size = _get select 5};
	} forEach _new_mags;

	if (_replace_with == "") exitWith {};
	
	//--- Case sensitive fix.
	_outter = [];
	{_mag = _x;	if ({_x == _mag} count _replaced == 0) then {[_outter, _mag] Call WFBE_CO_FNC_ArrayPush}} forEach _mags;
	
	_currentSize = (_mags) Call WFBE_CL_FNC_GetMagazinesSize;//
	_size = (_outter) Call WFBE_CL_FNC_GetMagazinesSize;
	
	for '_i' from 0 to count(_mags)-1 do {
		if ((_mags select _i) in _replaced && _size < _pool_max) then {_mags set [_i, _replace_with];_size = _size + _replace_size;};
	};

	_mags = _mags - (_old_mags - [_replace_with]);
};

_mags