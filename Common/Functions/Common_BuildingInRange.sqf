Private ['_buildings','_buildingType','_checks','_closest','_range','_side','_unit'];
_buildingType = _this select 0;
_buildings = _this select 1;
_range = _this select 2;
_side = _this select 3;
_unit = _this select 4;

_closest = objNull;

_checks = [_side,missionNamespace getVariable Format ["WFBE_%1%2",str _side,_buildingType],_buildings] Call GetFactories;
if (count _checks > 0) then {
	_closest = [_unit,_checks] Call WFBE_CO_FNC_GetClosestEntity;
	if (_unit distance _closest > _range) then {_closest = objNull};
};

_closest