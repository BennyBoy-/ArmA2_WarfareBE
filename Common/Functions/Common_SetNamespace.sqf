Private ['_get','_override','_variable','_value'];

_variable = _this select 0;
_value = _this select 1;
_override = if (count _this > 2) then {_this select 2} else {false};

//--- BIS Bug, typename doesn't work properly with nil.
if !(_override) then {
	_get = _variable Call GetNamespace;
	if (isNil '_get') then {
		missionNamespace setVariable [_variable,_value];
	};
} else {
	missionNamespace setVariable [_variable,_value];
};