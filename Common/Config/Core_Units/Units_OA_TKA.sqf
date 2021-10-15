Private ['_restriction_air','_side','_tiMode','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";
_tiMode = missionNamespace getVariable "WFBE_C_GAMEPLAY_THERMAL_IMAGING";
_tiMode = if (_tiMode == 1 || _tiMode == 3) then {true} else {false};

_u 			= ['TK_Soldier_EP1'];
_u = _u		+ ['TK_Soldier_B_EP1'];
if (_tiMode) then {
	_u = _u		+ ['TK_Soldier_TWS_EP1'];
};
_u = _u		+ ['TK_Soldier_Engineer_EP1'];
_u = _u		+ ['TK_Soldier_LAT_EP1'];
_u = _u		+ ['TK_Soldier_AAT_EP1'];
_u = _u		+ ['TK_Soldier_AT_EP1'];
_u = _u		+ ['TK_Soldier_HAT_EP1'];
_u = _u		+ ['TK_Soldier_AA_EP1'];
_u = _u		+ ['TK_Soldier_AR_EP1'];
_u = _u		+ ['TK_Soldier_AMG_EP1'];
_u = _u		+ ['TK_Soldier_MG_EP1'];
_u = _u		+ ['TK_Soldier_GL_EP1'];
_u = _u		+ ['TK_Soldier_Spotter_EP1'];
_u = _u		+ ['TK_Soldier_Sniper_EP1'];
_u = _u		+ ['TK_Soldier_SniperH_EP1'];
_u = _u		+ ['TK_Soldier_Medic_EP1'];
_u = _u		+ ['TK_Special_Forces_EP1'];
_u = _u		+ ['TK_Special_Forces_TL_EP1'];
_u = _u		+ ['TK_Special_Forces_MG_EP1'];
_u = _u		+ ['TK_Soldier_Crew_EP1'];
_u = _u		+ ['TK_Soldier_Pilot_EP1'];
_u = _u		+ ['TK_Soldier_SL_EP1'];
_u = _u		+ ['TK_Soldier_Officer_EP1'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['TT650_TK_EP1'];
_u = _u		+ ['UAZ_Unarmed_TK_EP1'];
_u = _u		+ ['SUV_TK_EP1'];
_u = _u		+ ['UAZ_MG_TK_EP1'];
_u = _u		+ ['UAZ_AGS30_TK_EP1'];
_u = _u		+ ['LandRover_MG_TK_EP1'];
_u = _u		+ ['LandRover_SPG9_TK_EP1'];
_u = _u		+ ['V3S_TK_EP1'];
_u = _u		+ ['V3S_Open_TK_EP1'];
_u = _u		+ ['UralRepair_TK_EP1'];
_u = _u		+ ['UralReammo_TK_EP1'];
_u = _u		+ ['UralRefuel_TK_EP1'];
_u = _u		+ ['UralSalvage_TK_EP1'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['UralSupply_TK_EP1']};
_u = _u		+ ['M113Ambul_TK_EP1'];
_u = _u		+ ['BRDM2_TK_EP1'];
_u = _u		+ ['BRDM2_ATGM_TK_EP1'];
_u = _u		+ ['BTR60_TK_EP1'];
_u = _u		+ ['Ural_ZU23_TK_EP1'];
_u = _u		+ ['GRAD_TK_EP1'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['M113_TK_EP1'];
_u = _u		+ ['BMP2_TK_EP1'];
_u = _u		+ ['ZSU_TK_EP1'];
_u = _u		+ ['T34_TK_EP1'];
_u = _u		+ ['T55_TK_EP1'];
_u = _u		+ ['T72_TK_EP1'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['Mi17_TK_EP1'];
_u = _u		+ ['UH1H_TK_EP1'];
if (_restriction_air == 0 ||_restriction_air == 1) then {
	_u = _u		+ ['Mi24_D_TK_EP1'];
};
if (_restriction_air == 0) then {
	_u = _u		+ ['An2_TK_EP1'];
	_u = _u		+ ['L39_TK_EP1'];
	_u = _u		+ ['Su25_TK_EP1'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];
if (_restriction_air == 0) then {
	_u = _u		+ ['An2_TK_EP1'];
	_u = _u		+ ['L39_TK_EP1'];
	_u = _u		+ ['Su25_TK_EP1'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ["Old_bike_TK_CIV_EP1"];
_u = _u		+ ["TT650_TK_CIV_EP1"];
_u = _u		+ ["Lada2_TK_CIV_EP1"];
_u = _u		+ ["VolhaLimo_TK_CIV_EP1"];
_u = _u		+ ["Volha_2_TK_CIV_EP1"];
_u = _u		+ ["Ural_TK_CIV_EP1"];
_u = _u		+ ["S1203_TK_CIV_EP1"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_EASTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};