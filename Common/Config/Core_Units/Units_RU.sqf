Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

_u 			= ['RU_Soldier'];
_u = _u		+ ['RU_Soldier2'];
_u = _u		+ ['RU_Soldier_LAT'];
_u = _u		+ ['RU_Soldier_AT'];
_u = _u		+ ['RU_Soldier_HAT'];
_u = _u		+ ['RU_Soldier_AA'];
_u = _u		+ ['RU_Soldier_AR'];
_u = _u		+ ['RU_Soldier_MG'];
_u = _u		+ ['RU_Soldier_GL'];
_u = _u		+ ['RU_Soldier_Marksman'];
_u = _u		+ ['RU_Soldier_Spotter'];
_u = _u		+ ['RU_Soldier_Sniper'];
_u = _u		+ ['RU_Soldier_SniperH'];
_u = _u		+ ['RU_Soldier_Medic'];
_u = _u		+ ['RU_Soldier_TL'];
_u = _u		+ ['RU_Soldier_SL'];
_u = _u		+ ['RU_Soldier_Crew'];
_u = _u		+ ['RU_Soldier_Pilot'];
_u = _u		+ ['RUS_Soldier1'];
_u = _u		+ ['RUS_Soldier2'];
_u = _u		+ ['RUS_Soldier_GL'];
_u = _u		+ ['RUS_Soldier_Marksman'];
_u = _u		+ ['RUS_Soldier3'];
_u = _u		+ ['RUS_Soldier_TL'];
_u = _u		+ ['MVD_Soldier_GL'];
_u = _u		+ ['MVD_Soldier_MG'];
_u = _u		+ ['MVD_Soldier_Marksman'];
_u = _u		+ ['MVD_Soldier_AT'];
_u = _u		+ ['MVD_Soldier_Sniper'];
_u = _u		+ ['MVD_Soldier_TL'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['MMT_Civ'];
_u = _u		+ ['TT650_Ins'];
_u = _u		+ ['UAZ_RU'];
_u = _u		+ ['PBX'];
_u = _u		+ ['UAZ_MG_INS'];
_u = _u		+ ['UAZ_AGS30_RU'];
_u = _u		+ ['UAZ_SPG9_INS'];
_u = _u		+ ['Kamaz'];
_u = _u		+ ['KamazRepair'];
_u = _u		+ ['WarfareReammoTruck_RU'];
_u = _u		+ ['KamazRefuel'];
_u = _u		+ ['WarfareSalvageTruck_RU'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_RU']};
_u = _u		+ ['GAZ_Vodnik_MedEvac'];
_u = _u		+ ['BRDM2_INS'];
_u = _u		+ ['BRDM2_ATGM_INS'];
_u = _u		+ ['GAZ_Vodnik'];
_u = _u		+ ['GAZ_Vodnik_HMG'];
_u = _u		+ ['Ural_ZU23_INS'];
_u = _u		+ ['BTR90'];
_u = _u		+ ['GRAD_RU'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['BMP2_INS'];
_u = _u		+ ['BMP3'];
_u = _u		+ ['ZSU_INS'];
_u = _u		+ ['T72_RU'];
_u = _u		+ ['T90'];
_u = _u		+ ['2S6M_Tunguska'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['Mi17_Ins'];
_u = _u		+ ['Mi17_medevac_RU'];
if (_restriction_air == 0 ||_restriction_air == 1) then {
	_u = _u		+ ['Mi17_rockets_RU'];
	_u = _u		+ ['Mi24_V'];
	_u = _u		+ ['Mi24_P'];
	if ((missionNamespace getVariable "WFBE_C_UNITS_KAMOV_DISABLED") == 0) then {
		_u = _u		+ ['Ka52'];
		_u = _u		+ ['Ka52Black'];
	};
};
if (_restriction_air == 0) then {
	_u = _u		+ ['Su34'];
	_u = _u		+ ['Su25_Ins'];
	_u = _u		+ ['Su39'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];
if (_restriction_air == 0) then {
	_u = _u 	+ ['Su34'];
	_u = _u		+ ['Su25_Ins'];
	_u = _u		+ ['Su39'];
};

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
	_u = _u		+ [missionNamespace getVariable "WFBE_EASTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};