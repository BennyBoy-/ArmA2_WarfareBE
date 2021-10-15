Private ["_buildings","_kind","_list","_side","_type"];
_side = _this select 0;
_kind = _this select 1;
_buildings = _this select 2;

_list = [];
_type = (missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES", _side]) select _kind;
{if (typeOf _x == _type && alive _x) then {_list = _list + [_x]}} forEach _buildings;

_list