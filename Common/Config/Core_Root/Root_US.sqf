Private ["_side"];

_side = "WEST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'US_Soldier_Crew_EP1'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'US_Soldier_Pilot_EP1'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'US_Soldier_EP1'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\ca_e\Data\flag_us_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['HMMWV_Ambulance','HMMWV_Ambulance_DES_EP1','UH60M_MEV_EP1','M1133_MEV_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['MtvrRepair','MtvrRepair_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_USMC','MtvrSalvage_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_USMC','MtvrSupply_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'MQ9PredatorB_US_EP1'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_EN0_EP1','WFHQ_EN1_EP1','WFHQ_EN2_EP1','WFHQ_EN4_EP1','WFHQ_EN5_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_EN'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['US_Soldier_SL_EP1','US_Soldier_LAT_EP1','US_Soldier_EP1','US_Soldier_EP1','US_Soldier_AR_EP1','US_Soldier_Medic_EP1']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['US_Soldier_SL_EP1','US_Soldier_AT_EP1','US_Soldier_AT_EP1','US_Soldier_AT_EP1','US_Soldier_AA_EP1','US_Soldier_MG_EP1','US_Soldier_Medic_EP1','US_Soldier_Spotter_EP1','US_Soldier_Sniper_EP1']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['US_Delta_Force_TL_EP1','US_Soldier_HAT_EP1','US_Soldier_HAT_EP1','US_Soldier_HAT_EP1','US_Soldier_HAT_EP1','US_Soldier_AA_EP1','US_Soldier_AA_EP1','US_Delta_Force_AR_EP1','US_Delta_Force_Assault_EP1','US_Soldier_Medic_EP1','US_Delta_Force_M14_EP1','US_Soldier_AT_EP1','US_Soldier_Marksman_EP1']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'C130J_US_EP1'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'MtvrRepair_DES_EP1'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['HMMWV_Ambulance_DES_EP1','MTVR_DES_EP1']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['USBasicAmmunitionBox_EP1','USBasicWeapons_EP1','USLaunchers_EP1']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'HMMWV_DES_EP1'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'CH_47F_EP1'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumWest_EP1'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'MtvrSupply_DES_EP1'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["TK_CIV_Worker02_EP1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['US_Soldier_TL_EP1','US_Soldier_MG_EP1','US_Soldier_Sniper_EP1','US_Soldier_Medic_EP1'], 
		['US_Soldier_TL_EP1','US_Soldier_AR_EP1','US_Soldier_GL_EP1','US_Soldier_AT_EP1','US_Soldier_EP1'],
		['HMMWV_M1151_M2_DES_EP1','HMMWV_MK19_DES_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['M1126_ICV_M2_EP1','M1135_ATGMV_EP1'], 
		['MTVR_DES_EP1','US_Soldier_TL_EP1','US_Soldier_AT_EP1','US_Soldier_MG_EP1','US_Soldier_AT_EP1'],
		['M2A3_EP1','US_Soldier_AA_EP1','US_Soldier_AA_EP1','US_Soldier_Medic_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['M2A3_EP1','M2A3_EP1'], 
		['M1A1_US_DES_EP1','M1A1_US_DES_EP1'],
		['M2A3_EP1','M2A3_EP1','US_Soldier_TL_EP1','US_Soldier_MG_EP1','US_Soldier_Marksman_EP1','US_Soldier_Medic_EP1','US_Soldier_HAT_EP1','US_Soldier_AHAT_EP1','US_Soldier_EP1'],
		['M1126_ICV_M2_EP1','US_Soldier_TL_EP1','US_Soldier_Medic_EP1','US_Soldier_GL_EP1','US_Soldier_EP1','US_Soldier_AR_EP1']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['US_Soldier_SL_EP1','US_Soldier_EP1','US_Soldier_EP1','US_Soldier_AR_EP1','US_Soldier_GL_EP1','US_Soldier_MG_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['US_Soldier_SL_EP1','US_Soldier_EP1','US_Soldier_EP1','US_Soldier_MG_EP1','US_Soldier_LAT_EP1','US_Soldier_Medic_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['US_Soldier_SL_EP1','US_Soldier_EP1','US_Soldier_EP1','US_Soldier_AT_EP1','US_Soldier_AA_EP1','US_Soldier_Sniper_EP1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['US_Soldier_SL_EP1','US_Soldier_EP1','US_Soldier_AR_EP1','US_Soldier_HAT_EP1','US_Soldier_LAT_EP1','US_Soldier_GL_EP1']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['SCAR_L_CQC','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['SCAR_L_CQC','M136','Colt1911']],
		[['G36C_camo','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C_camo','M136','Colt1911']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['M4A3_CCO_EP1','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['M4A3_CCO_EP1','M136','Colt1911']],
		[['G36K_camo','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36K_camo','M136','Colt1911']],
		[['M14_EP1','M9SD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','HandGrenade_West','HandGrenade_West','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
		 ['M14_EP1','M9SD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['SCAR_L_STD_HOLO','MAAWS','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','MAAWS_HEAT','MAAWS_HEAT','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['SCAR_L_STD_HOLO','MAAWS','Colt1911']],
		[['G36C_camo','MAAWS','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','MAAWS_HEAT','MAAWS_HEAT','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C_camo','MAAWS','Colt1911']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['SCAR_L_CQC_EGLM_Holo','MAAWS','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','MAAWS_HEAT','MAAWS_HEAT','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['SCAR_L_CQC_EGLM_Holo','MAAWS']],
		[['SCAR_H_STD_EGLM_Spect','Javelin','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','Javelin','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['SCAR_H_STD_EGLM_Spect','Javelin','Colt1911']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'US'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_US.sqf";
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_USMC.sqf";
	};
	
	if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_BAF.sqf"};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['SCAR_L_CQC','M9','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','HandGrenade_West','HandGrenade_West','HandGrenade_West','SmokeShellBlue','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
	['SCAR_L_CQC','M9']
]];

//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_OA_US.sqf";

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_US.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_US.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_US.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_US.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_OA_US.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_OA_US.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_OA_US.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_OA_US.sqf";
};