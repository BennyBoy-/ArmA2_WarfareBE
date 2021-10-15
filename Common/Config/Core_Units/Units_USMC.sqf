Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

_u 			= ['USMC_Soldier'];
_u = _u		+ ['USMC_Soldier2'];
_u = _u		+ ['USMC_Soldier_LAT'];
_u = _u		+ ['USMC_Soldier_AT'];
_u = _u		+ ['USMC_Soldier_HAT'];
_u = _u		+ ['USMC_Soldier_AA'];
_u = _u		+ ['USMC_Soldier_AR'];
_u = _u		+ ['USMC_Soldier_MG'];
_u = _u		+ ['USMC_Soldier_GL'];
_u = _u		+ ['USMC_SoldierS_Sniper'];
_u = _u		+ ['USMC_SoldierS_SniperH'];
_u = _u		+ ['USMC_SoldierM_Marksman'];
_u = _u		+ ['USMC_Soldier_Medic'];
_u = _u		+ ['USMC_SoldierS_Engineer'];
_u = _u		+ ['USMC_SoldierS'];
_u = _u		+ ['USMC_SoldierS_Spotter'];
_u = _u		+ ['USMC_Soldier_TL'];
_u = _u		+ ['USMC_Soldier_SL'];
_u = _u		+ ['USMC_Soldier_Crew'];
_u = _u		+ ['USMC_Soldier_Pilot'];
_u = _u		+ ['FR_GL'];
_u = _u		+ ['FR_Corpsman'];
_u = _u		+ ['FR_Assault_R'];
_u = _u		+ ['FR_Assault_GL'];
_u = _u		+ ['FR_AR'];
_u = _u		+ ['FR_TL'];
_u = _u		+ ['FR_R'];
_u = _u		+ ['FR_Sapper'];
_u = _u		+ ['FR_AC'];
_u = _u		+ ['FR_Marksman'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['MMT_USMC'];
_u = _u		+ ['M1030'];
_u = _u		+ ['HMMWV'];
_u = _u		+ ['Zodiac'];
_u = _u		+ ['HMMWV_M2'];
_u = _u		+ ['HMMWV_Armored'];
_u = _u		+ ['HMMWV_MK19'];
_u = _u		+ ['HMMWV_TOW'];
_u = _u		+ ['HMMWV_Avenger'];
_u = _u		+ ['HMMWV_Ambulance'];
_u = _u		+ ['MTVR'];
_u = _u		+ ['MtvrRepair'];
_u = _u		+ ['WarfareReammoTruck_USMC'];
_u = _u		+ ['MtvrRefuel'];
_u = _u		+ ['WarfareSalvageTruck_USMC'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_USMC']};
_u = _u		+ ['RHIB'];
_u = _u		+ ['RHIB2Turret'];
_u = _u		+ ['LAV25'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['AAV'];
_u = _u		+ ['M1A1'];
_u = _u		+ ['MLRS'];
_u = _u		+ ['M1A2_TUSK_MG'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ['MH60S'];
if (_restriction_air == 0 ||_restriction_air == 1) then {
	_u = _u		+ ['UH1Y'];
	_u = _u		+ ['AH1Z'];
	_u = _u		+ ['AH64D'];
};
if (_restriction_air == 0) then {
	_u = _u		+ ['MV22'];
	_u = _u		+ ['C130J'];
	_u = _u		+ ['F35B'];
	_u = _u		+ ['AV8B'];
	_u = _u		+ ['AV8B2'];
	_u = _u		+ ['A10'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];
if (_restriction_air == 0) then {
	_u = _u 	+ ['MV22'];
	_u = _u		+ ['C130J'];
	_u = _u		+ ['F35B'];
	_u = _u		+ ['AV8B'];
	_u = _u		+ ['AV8B2'];
	_u = _u		+ ['A10'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ["MMT_Civ"];
_u = _u		+ ["TT650_Civ"];
_u = _u		+ ["Lada1"];
_u = _u		+ ["SkodaBlue"];
_u = _u		+ ["car_sedan"];
_u = _u		+ ["car_hatchback"];
_u = _u		+ ["datsun1_civil_1_open"];
_u = _u		+ ["datsun1_civil_3_open"];
_u = _u		+ ["hilux1_civil_1_open"];
_u = _u		+ ["V3S_Civ"];
_u = _u		+ ["Ikarus"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_WESTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};