Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

_u			= ['CDF_Soldier'];
_u = _u		+ ['CDF_Soldier_Engineer'];
_u = _u		+ ['CDF_Soldier_Light'];
_u = _u		+ ['CDF_Soldier_GL'];
_u = _u		+ ['CDF_Soldier_Militia'];
_u = _u		+ ['CDF_Soldier_Medic'];
_u = _u		+ ['CDF_Soldier_Sniper'];
_u = _u		+ ['CDF_Soldier_Spotter'];
_u = _u		+ ['CDF_Soldier_Marksman'];
_u = _u		+ ['CDF_Soldier_RPG'];
_u = _u		+ ['CDF_Soldier_Strela'];
_u = _u		+ ['CDF_Soldier_AR'];
_u = _u		+ ['CDF_Soldier_MG'];
_u = _u		+ ['CDF_Soldier_TL'];
_u = _u		+ ['CDF_Soldier_Officer'];
_u = _u		+ ['CDF_Commander'];
_u = _u		+ ['CDF_Soldier_Pilot'];
_u = _u		+ ['CDF_Soldier_Crew'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ['UAZ_CDF'];
_u = _u		+ ['Ural_CDF'];
_u = _u		+ ['WarfareSalvageTruck_CDF'];
_u = _u		+ ['UralRepair_CDF'];
_u = _u		+ ['UralReammo_CDF'];
_u = _u		+ ['UralRefuel_CDF'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_CDF']};
_u = _u		+ ['UAZ_MG_CDF'];
_u = _u		+ ['UAZ_AGS30_CDF'];
_u = _u		+ ['BRDM2_CDF'];
_u = _u		+ ['BRDM2_ATGM_CDF'];
_u = _u		+ ['Ural_ZU23_CDF'];
_u = _u		+ ['GRAD_CDF'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ['BMP2_Ambul_CDF'];
_u = _u		+ ['ZSU_CDF'];
_u = _u		+ ['BMP2_CDF'];
_u = _u		+ ['T72_CDF'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ['Mi17_CDF'];
_u = _u		+ ['Mi17_medevac_CDF'];
if (_restriction_air == 0 ||_restriction_air == 1) then {
	_u = _u		+ ['Mi24_D'];
};
if (_restriction_air == 0) then {
	_u = _u		+ ['Su25_CDF'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];
if (_restriction_air == 0) then {
	_u = _u 	+ ['Su25_CDF'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ["MMT_Civ"];
_u = _u		+ ["TT650_Civ"];
_u = _u		+ ["Lada1"];
_u = _u		+ ["SkodaBlue"];
_u = _u		+ ["car_hatchback"];
_u = _u		+ ["datsun1_civil_1_open"];
_u = _u		+ ["V3S_Civ"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_WESTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};