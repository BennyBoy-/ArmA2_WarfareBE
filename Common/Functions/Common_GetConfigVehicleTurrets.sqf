private ["_turrets", "_i", "_path"];
_turrets = _this select 0;
_path = _this select 1;
_i = 0;

while {_i < (count _turrets)} do {
	private ["_turretIndex", "_thisTurret"];
	_turretIndex = _turrets select _i;
	_thisTurret = _path + [_turretIndex];
	
	tmp_overall = tmp_overall + [_thisTurret];
	
	[([_turrets select (_i + 1), _thisTurret] Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleTurrets.sqf")];
	
	_i = _i + 2;
};