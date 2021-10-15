/*
	Properly sort the magazines in groups and skipped if side-defined.
	 Parameters:
		- magazines
		- side
*/

Private ["_add","_get","_m","_mag","_side"];

_m = _this select 0;
_side = _this select 1;

_get = missionNamespace getVariable Format ["WFBE_%1_Magazines", _side];
if (isNil '_get') then {_get = []};

_add = [];
{
	_mag = _x;
	if (({_x == _mag} count _get) == 0) then {
		[_add, _mag] Call WFBE_CO_FNC_ArrayPush;
	};
} forEach _m;

//--- Set or update.
if (isNil {missionNamespace getVariable Format ["WFBE_%1_Magazines", _side]}) then {
	missionNamespace setVariable [Format ["WFBE_%1_Magazines", _side], _add];
} else {
	missionNamespace setVariable [Format ["WFBE_%1_Magazines", _side], (missionNamespace getVariable Format ["WFBE_%1_Magazines", _side]) + _add];
};

_add