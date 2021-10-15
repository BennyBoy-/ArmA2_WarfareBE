Private ["_side"];

_side = "EAST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'Ins_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'Ins_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'Ins_Soldier_1'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\Data\flag_chdkz_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['BMP2_Ambul_INS']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['UralRepair_INS']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_INS']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_INS']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'Pchela1T'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_CZ0','WFHQ_CZ1','WFHQ_CZ2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolCZ'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['USMC_Soldier_SL','USMC_Soldier_LAT','USMC_Soldier','USMC_Soldier2','USMC_Soldier_AR','USMC_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['USMC_Soldier_SL','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AA','USMC_Soldier_MG','USMC_Soldier_Medic','USMC_SoldierS_Spotter','USMC_SoldierS_Sniper']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['FR_Assault_R','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_AA','USMC_Soldier_AA','FR_AR','FR_AC','USMC_Soldier_Medic','FR_Marksman','USMC_Soldier_AT','USMC_SoldierS_Sniper']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Mi17_Ins'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'UralRepair_INS'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['BMP2_Ambul_INS','Ural_INS']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['RUBasicAmmunitionBox','RUBasicWeaponsBox','RULaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'BRDM2_INS'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Mi17_Ins'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_INS'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker3","Worker1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['Ins_Commander','Ins_Soldier_MG','Ins_Soldier_Sniper','Ins_Soldier_Medic'], 
		['Ins_Commander','Ins_Soldier_AR','Ins_Soldier_GL','Ins_Soldier_AT','Ins_Soldier_1'],
		['UAZ_MG_INS','UAZ_SPG9_INS']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BRDM2_INS','BRDM2_ATGM_INS'], 
		['Ural_INS','Ins_Commander','Ins_Soldier_AT','Ins_Soldier_MG','Ins_Soldier_AT'],
		['BMP2_INS','Ins_Soldier_AA','Ins_Soldier_AA','Ins_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T72_INS','BMP2_INS'], 
		['T72_INS','T72_INS'],
		['BMP2_INS','BMP2_INS','Ins_Commander','Ins_Soldier_MG','Ins_Soldier_Sniper','Ins_Soldier_Medic','Ins_Soldier_AT','Ins_Soldier_AT','Ins_Soldier_1'],
		['BMP2_INS','Ins_Commander','Ins_Soldier_Medic','Ins_Soldier_GL','Ins_Soldier_1','Ins_Soldier_AR']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['Ins_Commander','Ins_Soldier_1','Ins_Soldier_1','Ins_Soldier_AR','Ins_Soldier_GL','Ins_Soldier_MG']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['Ins_Commander','Ins_Soldier_1','Ins_Soldier_1','Ins_Soldier_MG','Ins_Soldier_AT','Ins_Soldier_Medic']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['Ins_Commander','Ins_Soldier_1','Ins_Soldier_1','Ins_Soldier_AT','Ins_Soldier_AA','Ins_Soldier_Sniper']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['Ins_Commander','Ins_Soldier_1','Ins_Soldier_AR','Ins_Soldier_AT','Ins_Soldier_AT','Ins_Soldier_GL']];
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
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Insurgents'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_INS.sqf";
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];

//--- Artillery.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_INS.sqf";
//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_INS.sqf";
//--- Units.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_INS.sqf";
//--- Upgrades.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_INS.sqf";

if (WF_A2_CombinedOps) then {
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_INS.sqf";
} else {
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_INS.sqf";
};