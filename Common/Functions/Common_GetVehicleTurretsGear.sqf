/*
	Return the turrets along with it's weapons/magazines of a vehicle (based on http://community.bistudio.com/wiki/weaponsTurret)
	Ex: [["M256","M240BC_veh"],["20Rnd_120mmSABOT_M1A2","20Rnd_120mmHE_M1A2","1200Rnd_762x51_M240"],[0],"bin\config.bin/CfgVehicles/M1A2_TUSK_MG/Turrets/MainTurret"]
	 Parameters:
		- Vehicle
*/

private ["_result", "_class"];
_result = [];

_class = configFile >> "CfgVehicles" >> ( switch (typeName _this) do { case "STRING" : {_this}; case "OBJECT" : {typeOf _this}; default {nil}}) >> "turrets";
[_class, []] call WFBE_CO_FNC_FindTurretsRecursive;

_result