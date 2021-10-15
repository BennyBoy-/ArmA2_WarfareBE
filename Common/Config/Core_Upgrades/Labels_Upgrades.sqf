//--- Dynamic Labels.
_upgrade_paratroopers_xlabel = {
	Private ["_label","_levels"];
	_levels = (missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_LEVELS", WFBE_Client_SideJoinedText]) select WFBE_UP_PARATROOPERS;
	_label = "";

	for '_i' from 1 to _levels do {
		_label = _label + Format[" - Level <t color='#F5D363'>%1</t>: [<t color='#F5D363'>%2</t>] Units", _i, count(missionNamespace getVariable Format["WFBE_%1PARACHUTELEVEL%2", WFBE_Client_SideJoinedText, _i])];
		if (_i < _levels) then {_label = _label + "<br/>"};
	};

	_label
};
_upgrade_supply_xlabel = {
	Private ["_label","_levels","_rates"];
	_levels = (missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_LEVELS", WFBE_Client_SideJoinedText]) select WFBE_UP_SUPPLYRATE;
	_label = "";

	_rates = if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 1) then {missionNamespace getVariable "WFBE_C_TOWNS_SUPPLY_LEVELS_TIME"} else {missionNamespace getVariable "WFBE_C_TOWNS_SUPPLY_LEVELS_TRUCK"};
	
	for '_i' from 0 to _levels do {
		_label = _label + Format[" - Level <t color='#F5D363'>%1</t>: Increase supply of [<t color='#F5D363'>%2</t>]", _i, _rates select _i];
		if (_i < _levels) then {_label = _label + "<br/>"};
	};

	_label
};
_upgrade_respawn_xlabel = {
	Private ["_label","_levels"];
	_levels = (missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_LEVELS", WFBE_Client_SideJoinedText]) select WFBE_UP_RESPAWNRANGE;
	_label = "";

	for '_i' from 0 to _levels do {
		_label = _label + Format[" - Level <t color='#F5D363'>%1</t>: [<t color='#F5D363'>%2</t>] Meters", _i, (missionNamespace getVariable "WFBE_C_RESPAWN_RANGES") select _i];
		if (_i < _levels) then {_label = _label + "<br/>"};
	};

	_label
};
_upgrade_artillery_xlabel = {
	Private ["_label","_levels"];
	_levels = (missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_LEVELS", WFBE_Client_SideJoinedText]) select WFBE_UP_ARTYTIMEOUT;
	_label = "";

	for '_i' from 0 to _levels do {
		_label = _label + Format[" - Level <t color='#F5D363'>%1</t>: [<t color='#F5D363'>%2</t>] Seconds", _i, (missionNamespace getVariable "WFBE_C_ARTILLERY_INTERVALS") select _i];
		if (_i < _levels) then {_label = _label + "<br/>"};
	};

	_label
};

//--- UI Labels
missionNamespace setVariable [Format["WFBE_C_UPGRADES_LABELS"], [
	localize 'strwfbarracks',
	localize 'strwflightfactory',
	localize 'strwfheavyfactory',
	localize 'strwfaircraftfactory',
	localize 'STR_WF_TACTICAL_Paratroop',
	localize 'str_dn_uav',
	localize 'STR_WF_UPGRADE_Supply',
	localize 'STR_WF_UPGRADE_RespawnRange',
	localize 'STR_WF_UPGRADE_Airlift',
	localize 'STR_WF_UPGRADE_Countermeasures',
	localize 'STR_WF_UPGRADE_ArtilleryUpgrade',
	localize 'STR_WF_ICBM',
	localize 'STR_WF_TACTICAL_FastTravel',
	localize 'STR_WF_UPGRADE_Gear',
	localize 'STR_WF_Ammo',
	'EASA',
	localize 'STR_WF_TACTICAL_Paradrop', 
	localize 'STR_WF_UPGRADE_ArtilleryAmmo',
	localize 'STR_WF_UPGRADE_IRS'
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_DESCRIPTIONS"], [
	localize 'STR_WF_UPGRADE_barracks_Desc',
	localize 'STR_WF_UPGRADE_lightfactory_Desc',
	localize 'STR_WF_UPGRADE_heavyfactory_Desc',
	localize 'STR_WF_UPGRADE_aircraftfactory_Desc',
	Format[localize 'STR_WF_UPGRADE_Paratroop_Desc', Format["<t color='#B6F563'>%1</t>",[configFile >> 'CfgVehicles' >> (missionNamespace getVariable Format["WFBE_%1PARACARGO", WFBE_Client_SideJoinedText]), "displayName"] Call WFBE_CO_FNC_GetConfigEntry], call _upgrade_paratroopers_xlabel],
	localize 'STR_WF_UPGRADE_uav_Desc',
	Format[localize 'STR_WF_UPGRADE_Supply_Desc', call _upgrade_supply_xlabel],
	Format[localize 'STR_WF_UPGRADE_RespawnRange_Desc', call _upgrade_respawn_xlabel],
	localize 'STR_WF_UPGRADE_Airlift_Desc',
	localize 'STR_WF_UPGRADE_Countermeasures_Desc',
	Format[localize 'STR_WF_UPGRADE_ArtilleryUpgrade_Desc', call _upgrade_artillery_xlabel],
	localize 'STR_WF_UPGRADE_ICBM_Desc',
	localize 'STR_WF_UPGRADE_FastTravel_Desc',
	localize 'STR_WF_UPGRADE_Gear_Desc',
	localize 'STR_WF_UPGRADE_Ammo_Desc',
	localize 'STR_WF_UPGRADE_EASA_Desc',
	localize 'STR_WF_UPGRADE_Paradrop_Desc',
	localize 'STR_WF_UPGRADE_ArtilleryAmmo_Desc',
	localize 'STR_WF_UPGRADE_IRS_Desc'
]];

missionNamespace setVariable [Format["WFBE_C_UPGRADES_IMAGES"], [
	"Client\Images\upgrade_infantry.paa",
	"Client\Images\upgrade_light.paa",
	"Client\Images\upgrade_heavy.paa",
	"Client\Images\upgrade_air.paa",
	"",
	"",
	"Client\Images\upgrade_supply.paa",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"", 
	"", 
	""
]];