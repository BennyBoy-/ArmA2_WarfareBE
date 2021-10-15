Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

_u 			= ['GUE_Soldier_1'];
_u = _u		+ ['GUE_Soldier_2'];
_u = _u		+ ['GUE_Soldier_3'];
_u = _u		+ ['GUE_Soldier_GL'];
_u = _u		+ ['GUE_Soldier_AT'];
_u = _u		+ ['GUE_Soldier_AA'];
_u = _u		+ ['GUE_Soldier_AR'];
_u = _u		+ ['GUE_Soldier_MG'];
_u = _u		+ ['GUE_Soldier_Sniper'];
_u = _u		+ ['GUE_Soldier_Medic'];
_u = _u		+ ['GUE_Soldier_Crew'];
_u = _u		+ ['GUE_Soldier_Pilot'];
_u = _u		+ ['GUE_Soldier_Scout'];
_u = _u		+ ['GUE_Soldier_Sab'];
_u = _u		+ ['GUE_Commander'];
_u = _u		+ ['GUE_Worker2'];
_u = _u		+ ['GUE_Woodlander3'];
_u = _u		+ ['GUE_Villager3'];
_u = _u		+ ['GUE_Woodlander2'];
_u = _u		+ ['GUE_Woodlander1'];
_u = _u		+ ['GUE_Villager4'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['TT650_Gue'];
_u = _u		+ ['V3S_Gue'];
_u = _u		+ ['Pickup_PK_GUE'];
_u = _u		+ ['Offroad_DSHKM_Gue'];
_u = _u		+ ['Offroad_SPG9_Gue'];
_u = _u		+ ['WarfareRepairTruck_Gue'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSalvageTruck_Gue']};
_u = _u		+ ['WarfareReammoTruck_Gue'];
_u = _u		+ ['WarfareSupplyTruck_Gue'];
_u = _u		+ ['BRDM2_Gue'];
_u = _u		+ ['Ural_ZU23_Gue'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['BMP2_Gue'];
_u = _u		+ ['T72_Gue'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['Mi17_Civilian'];

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ["MMT_Civ"];
_u = _u		+ ["TT650_Civ"];
_u = _u		+ ["Tractor"];
_u = _u		+ ["Lada2"];
_u = _u		+ ["LadaLM"];
_u = _u		+ ["SkodaRed"];
_u = _u		+ ["VWGolf"];
_u = _u		+ ["datsun1_civil_2_covered"];
_u = _u		+ ["hilux1_civil_2_covered"];
_u = _u		+ ["UralCivil"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_GUERSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};