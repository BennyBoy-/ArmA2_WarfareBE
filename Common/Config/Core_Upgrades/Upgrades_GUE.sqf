Private ["_side"];

_side = _this;

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_ENABLED", _side], [
	true, //--- Barracks
	true, //--- Light
	true, //--- Heavy
	false, //--- Air
	true, //--- Paratroopers
	if (isNil{missionNamespace getVariable Format["WFBE_%1UAV", _side]}) then {false} else {true}, //--- UAV
	true, //--- Supply
	true, //--- Respawn Range
	true, //--- Airlift
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") == 1) then {true} else {false}, //--- Custom Flares
	if ((missionNamespace getVariable "WFBE_C_ARTILLERY") > 0) then {true} else {false}, //--- Artillery Time
	false, //--- ICBM
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL") > 0) then {true} else {false}, //--- Fast Travel
	true, //--- Gear
	true, //--- Build Ammo
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA") > 0) then {true} else {false}, //--- EASA
	true, //--- Supply Paradrop
	if ((missionNamespace getVariable "WFBE_C_ARTILLERY") > 0) then {true} else {false}, //--- Artillery Ammo
	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE") > 0) then {true} else {false} //--- IR Smoke
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_COSTS", _side], [
	[[300,750],[900,2250]], //--- Barracks
	[[800,1600],[1200,3500]], //--- Light
	[[2500,5000]], //--- Heavy
	[[5000,10000]], //--- Air
	[[2000,8000],[3000,12000],[4000,24000]], //--- Paratroopers
	[[2500,5600]], //--- UAV
	[[2500,12500],[5000,27500],[15000,50000],[30000,100000]], //--- Supply
	[[500,2000],[1500,4000],[2500,7500]], //--- Respawn Range
	[[1000,4000]], //--- Airlift
	[[4500,14000]], //--- Custom Flares
	[[1200,3500],[1800,4400],[3000,9000]], //--- Artillery Time
	[[50000,250000]], //--- ICBM
	[[1500,5000]], //--- Fast Travel
	[[500,2500],[1500,5000],[2250,10000]], //--- Gear
	[[750,2250]], //--- Build Ammo
	[[4500,35000]], //--- EASA
	[[3000,10000]], //--- Supply Paradrop
	[[2500,5000],[3500,10000],[4500,15000]], //--- Artillery Ammo
	[[5000,25000]] //--- IR Smoke
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_LEVELS", _side], [
	2, //--- Barracks
	2, //--- Light
	1, //--- Heavy
	1, //--- Air
	3, //--- Paratroopers
	1, //--- UAV
	4, //--- Supply
	3, //--- Respawn Range
	1, //--- Airlift
	1, //--- Custom Flares
	3, //--- Artillery Time
	1, //--- ICBM
	1, //--- Fast Travel
	3, //--- Gear
	1, //--- Build Ammo
	1, //--- EASA
	1, //--- Supply Paradrop
	3, //--- Artillery Ammo
	1 //--- IR Smoke
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_LINKS", _side], [
	[[],[WFBE_UP_GEAR,1]], //--- Barracks
	[[],[WFBE_UP_BARRACKS,2]], //--- Light
	[[]], //--- Heavy
	[[],[WFBE_UP_HEAVY,1]], //--- Air
	[
		[[WFBE_UP_BARRACKS,1],[WFBE_UP_AIR,1],[WFBE_UP_GEAR,1]],
		[[WFBE_UP_BARRACKS,2],[WFBE_UP_AIR,2],[WFBE_UP_GEAR,2]],
		[[WFBE_UP_BARRACKS,2],[WFBE_UP_AIR,2],[WFBE_UP_GEAR,3]]
	], //--- Paratroopers
	[[WFBE_UP_AIR,2]], //--- UAV
	[[],[WFBE_UP_LIGHT,1],[WFBE_UP_LIGHT,2],[WFBE_UP_LIGHT,2]], //--- Supply
	[[WFBE_UP_LIGHT,1],[WFBE_UP_LIGHT,2],[WFBE_UP_LIGHT,2]], //--- Respawn Range
	[[WFBE_UP_AIR,1]], //--- Airlift
	[[WFBE_UP_AIR,2]], //--- Custom Flares
	[
		[[WFBE_UP_BARRACKS,1],[WFBE_UP_LIGHT,1]],
		[[WFBE_UP_BARRACKS,2],[WFBE_UP_LIGHT,2]],
		[[WFBE_UP_BARRACKS,2],[WFBE_UP_LIGHT,2]]
	], //--- Artillery Time
	[[WFBE_UP_AIR,2]], //--- ICBM
	[
		[[WFBE_UP_LIGHT,1],[WFBE_UP_SUPPLYRATE,1]]
	], //--- Fast Travel
	[[WFBE_UP_BARRACKS,1],[WFBE_UP_BARRACKS,2],[WFBE_UP_BARRACKS,2]], //--- Gear
	[[WFBE_UP_GEAR,2]], //--- Build Ammo
	[[]], //--- EASA
	[[WFBE_UP_AIRLIFT,1]], //--- Supply Paradrop
	[
		[[WFBE_UP_GEAR,1],[WFBE_UP_HEAVY,1]],
		[[WFBE_UP_GEAR,2],[WFBE_UP_HEAVY,1]],
		[[WFBE_UP_GEAR,3],[WFBE_UP_HEAVY,1]]
	], //--- Artillery Ammo
	[[WFBE_UP_HEAVY, 1]] //--- IR Smoke
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_TIMES", _side], [
	[30,60], //--- Barracks
	[40,70], //--- Light
	[50], //--- Heavy
	[60,90,120], //--- Air
	[35,55,75], //--- Paratroopers
	[60], //--- UAV
	[60,120,180,240], //--- Supply
	[30,60,90], //--- Respawn Range
	[45], //--- Airlift
	[100], //--- Custom Flares
	[40,80,120], //--- Artillery Time
	[300], //--- ICBM
	[60], //--- Fast Travel
	[25,50,75], //--- Gear
	[40], //--- Build Ammo
	[90], //--- EASA
	[50], //--- Supply Paradrop
	[60,120,180], //--- Artillery Ammo
	[120] //--- IR Smoke
]];

//todo, on commander missing link checkup, skip disabled upgrades.
missionNamespace setVariable [Format["WFBE_C_UPGRADES_%1_AI_ORDER", _side], [
	[WFBE_UP_BARRACKS,1],
	[WFBE_UP_GEAR,1],
	[WFBE_UP_LIGHT,1],
	[WFBE_UP_SUPPLYRATE,1],
	[WFBE_UP_BARRACKS,2],
	[WFBE_UP_GEAR,2],
	[WFBE_UP_LIGHT,2],
	[WFBE_UP_RESPAWNRANGE,1],
	[WFBE_UP_SUPPLYRATE,2],
	[WFBE_UP_HEAVY,1],
	[WFBE_UP_ARTYTIMEOUT,1],
	[WFBE_UP_SUPPLYRATE,3],
	[WFBE_UP_ARTYTIMEOUT,2],
	[WFBE_UP_GEAR,3],
	[WFBE_UP_RESPAWNRANGE,2],
	[WFBE_UP_ARTYTIMEOUT,3],
	[WFBE_UP_AIRLIFT,1],
	[WFBE_UP_RESPAWNRANGE,3],
	[WFBE_UP_PARATROOPERS,1],
	[WFBE_UP_PARATROOPERS,2],
	[WFBE_UP_UAV,1],
	[WFBE_UP_PARATROOPERS,3],
	[WFBE_UP_EASA,1],
	[WFBE_UP_SUPPLYPARADROP,1]
]];

//--- Check potential missing definition.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Check_Upgrades.sqf";