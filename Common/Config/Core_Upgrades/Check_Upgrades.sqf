//--- Auto Check the ai upgrade path for missing links.

Private ["_add","_enabled","_levels","_missing","_orders","_values"];

_side = _this;

_enabled = missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_ENABLED", _side];
_orders = missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_AI_ORDER", _side];
_levels = missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_LEVELS", _side];

_values = [];
for '_i' from 0 to count(_levels)-1 do {
	[_values, []] Call WFBE_CO_FNC_ArrayPush;
};

{
	_upgrade = _x select 0;
	_level = _x select 1;
	if (_enabled select _upgrade) then {
		if !(_level in (_values select _upgrade)) then {_values set [_upgrade, (_values select _upgrade) + [_level]]};
	};
} forEach _orders;

_add = [];
for '_i' from 0 to count(_values)-1 do {
	if (_enabled select _i) then {
		_found = _values select _i;
		_level = _levels select _i;
		
		for '_j' from 1 to _level do {
			if !(_j in _found) then {
				[_add, [_i, _j]] Call WFBE_CO_FNC_ArrayPush;
			};
		};
	};
};

if (count _add > 0) then {
	missionNamespace setVariable [Format ["WFBE_C_UPGRADES_%1_AI_ORDER", _side], _orders + _add];
	["TRIVIAL", Format["Check_Upgrades.sqf: [%1] AI Commander upgrade order has been completed with [%2].", _side, _add]] Call WFBE_CO_FNC_LogContent;
};