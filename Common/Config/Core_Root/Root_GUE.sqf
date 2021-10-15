Private ["_side"];

_side = "GUER";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'GUE_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'GUE_Soldier_1'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'GUE_Soldier_1'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\ca\data\Flag_napa_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['V3S_TK_GUE_EP1','V3S_Gue']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['WarfareRepairTruck_Gue','V3S_Repair_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_Gue','V3S_Salvage_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_Gue','V3S_Supply_TK_GUE_EP1']];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_CZ0','WFHQ_CZ1','WFHQ_CZ2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolCZ'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['GUE_Soldier_CO','GUE_Soldier_AT','GUE_Soldier_2','GUE_Soldier_3','GUE_Soldier_AR','GUE_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['GUE_Soldier_CO','GUE_Soldier_AT','GUE_Soldier_AT','GUE_Soldier_AT','GUE_Soldier_AA','GUE_Soldier_MG','GUE_Soldier_Medic','GUE_Soldier_Scout','GUE_Soldier_Sniper']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['GUE_Soldier_CO','GUE_Soldier_AT','GUE_Soldier_AT','GUE_Soldier_AT','GUE_Soldier_AT','GUE_Soldier_AA','GUE_Soldier_AA','GUE_Soldier_AR','GUE_Soldier_Medic','GUE_Soldier_Scout','GUE_Soldier_AT','GUE_Soldier_Sniper']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Mi17_Civilian'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'WarfareRepairTruck_Gue'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['TT650_Gue','V3S_Gue','Offroad_DSHKM_Gue']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['RUBasicAmmunitionBox','RUBasicWeaponsBox','RULaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'BRDM2_Gue'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Mi17_Civilian'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteC'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_Gue'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker3","Worker1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['GUE_Soldier_1','GUE_Soldier_MG','GUE_Soldier_Sniper','GUE_Soldier_Medic'], 
		['GUE_Soldier_CO','GUE_Soldier_AR','GUE_Soldier_3','GUE_Soldier_AT','GUE_Soldier_2'],
		['Offroad_DSHKM_Gue','Offroad_SPG9_Gue']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BRDM2_GUE','BRDM2_GUE'], 
		['V3S_GUE','GUE_Soldier_CO','GUE_Soldier_AT','GUE_Soldier_MG','GUE_Soldier_AT'],
		['BMP2_GUE','GUE_Soldier_AA','GUE_Soldier_AA','GUE_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['BMP2_GUE','BMP2_GUE'], 
		['T72_GUE','T72_GUE'],
		['GUE_Soldier_Sniper','GUE_Soldier_Scout','GUE_Soldier_Sniper']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['GUE_Soldier_CO','GUE_Soldier_1','GUE_Soldier_1','GUE_Soldier_AR','GUE_Soldier_GL','GUE_Soldier_MG']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['GUE_Soldier_CO','GUE_Soldier_1','GUE_Soldier_1','GUE_Soldier_MG','GUE_Soldier_AT','GUE_Soldier_Medic']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['GUE_Soldier_CO','GUE_Soldier_1','GUE_Soldier_1','GUE_Soldier_AT','GUE_Soldier_AA','GUE_Soldier_Sniper']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['GUE_Soldier_CO','GUE_Soldier_1','GUE_Soldier_AR','GUE_Soldier_AT','GUE_Soldier_AT','GUE_Soldier_GL']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AKS_74_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG18','Makarov']],
		[['AKS_74_U','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_U','RPG18','Makarov']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['SVD','MakarovSD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','HandGrenade_East','HandGrenade_East','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD'],
		 ['SVD','MakarovSD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']],
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['AK_74_GL','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL','RPG7V']],
		[['AK_74_GL','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL','RPG7V','Makarov']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Guerilla'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_GUE.sqf";
	
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKGUE.sqf";
	};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_GUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_GUE.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_GUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_GUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_GUE.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_GUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_GUE.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_GUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_GUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_GUE.sqf";
};