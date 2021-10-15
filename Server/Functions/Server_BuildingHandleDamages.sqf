Private ['_building','_dammages','_origin','_side','_sideBuilding','_side'];

_building = _this select 0;
_dammages = _this select 1;
_origin = _this select 2;
_sideBuilding = _building getVariable "wfbe_side";
_side = side _origin;

if (_side in [_sideBuilding, sideEnemy]) then {
	_dammages = false;
} else {
	_dammages = [_building, _dammages] Call HandleBuildingDamage;
};

_dammages