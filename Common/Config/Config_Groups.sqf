/*
	Define the groups to be used in town.
*/

Private ["_b","_c","_cost","_divideby","_faction","_get","_is_inf","_k","_l","_s","_side","_t"];

_k = _this select 0;
_l = _this select 1;
_side = _this select 2;
_faction = _this select 3;

for '_i' from 0 to count(_k)-1 do {
	_get = missionNamespace getVariable Format ["WFBE_%1_GROUPS_%2",_side,_k select _i];
	if (isNil '_get') then {
		missionNamespace setVariable [Format ["WFBE_%1_GROUPS_%2",_side,_k select _i], [_l select _i]];
	} else {
		[_get, _l select _i] Call WFBE_CO_FNC_ArrayPush;
	};
};

["INITIALIZATION", "Config_Groups.sqf: Initialization is done."] Call WFBE_CO_FNC_LogContent;