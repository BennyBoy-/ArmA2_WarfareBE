Private ["_entitie", "_group", "_side", "_unit"];

_unit = _this select 0;
_group = _this select 1;
_side = _this select 2;

_units = (units group _unit) Call WFBE_CO_FNC_GetLiveUnits;
//--- Be aware, if the unit that is changing group is the only one left, the join command will erase the group. We fix it by adding a "temp" unit before the join.
if ((count _units) < 2) then {_entitie = [missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side], group _unit, [0,0,0], _side, false] Call WFBE_CO_FNC_CreateUnit};
[_unit] join _group;
if !(isNull _entitie) then {deleteVehicle _entitie};