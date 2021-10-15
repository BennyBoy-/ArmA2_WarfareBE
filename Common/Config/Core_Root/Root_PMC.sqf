Private ["_side"];

_side = "GUER";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], "Soldier_Crew_PMC"];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], "Soldier_Pilot_PMC"];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], "Soldier_PMC"];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\ca\ca_e\data\flag_tkg_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['V3S_TK_GUE_EP1','V3S_Gue']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['WarfareRepairTruck_Gue','V3S_Repair_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_Gue','V3S_Salvage_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_Gue','V3S_Supply_TK_GUE_EP1']];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_EN0_EP1','WFHQ_EN1_EP1','WFHQ_EN2_EP1','WFHQ_EN4_EP1','WFHQ_EN5_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_EN'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['Soldier_TL_PMC','Soldier_AT_PMC','Soldier_Bodyguard_M4_PMC','Soldier_AT_PMC','Soldier_MG_PKM_PMC','Soldier_Medic_PMC']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['Soldier_TL_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_AA_PMC','Soldier_MG_PMC','Soldier_Medic_PMC','Soldier_Sniper_PMC','Soldier_Sniper_PMC']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['Soldier_TL_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_AA_PMC','Soldier_AA_PMC','Soldier_Bodyguard_AA12_PMC','Soldier_Bodyguard_M4_PMC','Soldier_Sniper_PMC','Soldier_Sniper_PMC']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Ka60_PMC'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'V3S_Repair_TK_GUE_EP1'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['V3S_TK_GUE_EP1','Offroad_DSHKM_TK_GUE_EP1']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['TKBasicAmmunitionBox_EP1','TKBasicWeapons_EP1','TKLaunchers_EP1']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'SUV_PMC'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Ka60_PMC'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast_EP1'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'V3S_Supply_TK_GUE_EP1'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["TK_CIV_Worker01_EP1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['Soldier_PMC','Soldier_MG_PKM_PMC','Soldier_Sniper_PMC','Soldier_Medic_PMC'], 
		['Soldier_TL_PMC','Soldier_MG_PMC','Soldier_M4A3_PMC','Soldier_AT_PMC','Soldier_GL_PMC'],
		['ArmoredSUV_PMC','ArmoredSUV_PMC']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BTR40_MG_TK_GUE_EP1','Ural_ZU23_TK_GUE_EP1'], 
		['SUV_PMC','Soldier_TL_PMC','Soldier_AT_PMC','Soldier_Bodyguard_AA12_PMC'],
		['BTR40_MG_TK_GUE_EP1','Soldier_AA_PMC','Soldier_AA_PMC','Soldier_Medic_PMC']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T34_TK_GUE_EP1','T34_TK_GUE_EP1'], 
		['T55_TK_GUE_EP1','T55_TK_GUE_EP1'],
		['Ka60_GL_PMC','Soldier_TL_PMC','Soldier_AT_PMC','Soldier_Bodyguard_M4_PMC','Soldier_Bodyguard_M4_PMC']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['Soldier_TL_PMC','Soldier_Bodyguard_M4_PMC','Soldier_GL_PMC','Soldier_MG_PKM_PMC','Soldier_GL_PMC','Soldier_MG_PMC']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['Soldier_TL_PMC','Soldier_Bodyguard_AA12_PMC','Soldier_Bodyguard_M4_PMC','Soldier_MG_PMC','Soldier_AT_PMC','Soldier_Medic_PMC']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['Soldier_TL_PMC','Soldier_Bodyguard_M4_PMC','Soldier_Bodyguard_AA12_PMC','Soldier_AT_PMC','Soldier_AA_PMC','Soldier_Sniper_PMC']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['Soldier_TL_PMC','Soldier_Bodyguard_M4_PMC','Soldier_MG_PKM_PMC','Soldier_AT_PMC','Soldier_AT_PMC','Soldier_M4A3_PMC']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AKS_74_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG18','Makarov']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['m8_carbine_pmc','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['m8_carbine_pmc','RPG7V','Makarov']],
		[['m8_compact_pmc','M9SD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','HandGrenade_West','HandGrenade_West','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['m8_compact_pmc','M9SD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['m8_sharpshooter','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['m8_sharpshooter','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['m8_carbineGL','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','PG7VL','PG7VL','PG7VL','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['m8_carbineGL','RPG7V']],
		[['m8_carbineGL','M47Launcher_EP1','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','Dragon_EP1','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['m8_carbineGL','M47Launcher_EP1','Makarov']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'PMC'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_PMC.sqf";
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKGUE.sqf";
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];

//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_OA_TKGUE.sqf";

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_GUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_GUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_GUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_GUE.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_OA_TKGUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_OA_TKGUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_OA_TKGUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_OA_TKGUE.sqf";
};