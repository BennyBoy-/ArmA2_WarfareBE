/* Adapted from BIS turret's function. */
private ['_entry','_turrestcount','_turrets'];
_entry = configFile >> 'CfgVehicles' >> _this >> 'Turrets';

vhasCommander = false;
vhasGunner = false;
_turrets = [_entry] Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleTurretsReturn.sqf";

tmp_overall = [];

if (count _turrets > 0) then {
	[_turrets, []] Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleTurrets.sqf";
};

_turrestcount = count(tmp_overall);
if (vhasGunner) then {_turrestcount = _turrestcount - 1};
if (vhasCommander) then {_turrestcount = _turrestcount - 1};

[[vhasCommander,vhasGunner,count(tmp_overall)+1,_turrestcount], tmp_overall]