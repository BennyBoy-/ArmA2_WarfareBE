/* USMC Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['USMC_Soldier'];
_i = _i + [['','',150,4,-1,0,0,0.83,'USMC',[]]];

_c = _c + ['USMC_Soldier2'];
_i = _i + [['','',125,4,-1,0,0,0.79,'USMC',[]]];

_c = _c + ['USMC_Soldier_LAT'];
_i = _i + [['','',225,5,-1,0,0,0.84,'USMC',[]]];

_c = _c + ['USMC_Soldier_AT'];
_i = _i + [['','',350,5,-1,2,0,0.86,'USMC',[]]];

_c = _c + ['USMC_Soldier_HAT'];
_i = _i + [['','',800,6,-1,3,0,0.88,'USMC',[]]];

_c = _c + ['USMC_Soldier_AA'];
_i = _i + [['','',400,6,-1,2,0,0.87,'USMC',[]]];

_c = _c + ['USMC_Soldier_AR'];
_i = _i + [['','',210,5,-1,1,0,0.84,'USMC',[]]];

_c = _c + ['USMC_Soldier_MG'];
_i = _i + [['','',220,5,-1,0,0,0.85,'USMC',[]]];

_c = _c + ['USMC_Soldier_GL'];
_i = _i + [['','',160,5,-1,0,0,0.83,'USMC',[]]];

_c = _c + ['USMC_SoldierS_Sniper'];
_i = _i + [['','',320,6,-1,2,0,0.88,'USMC',[]]];

_c = _c + ['USMC_SoldierM_Marksman'];
_i = _i + [['','',350,6,-1,2,0,0.9,'USMC',[]]];

_c = _c + ['USMC_SoldierS_SniperH'];
_i = _i + [['','',400,6,-1,3,0,0.92,'USMC',[]]];

_c = _c + ['USMC_Soldier_Medic'];
_i = _i + [['','',190,4,-1,0,0,0.85,'USMC',[]]];

_c = _c + ['USMC_SoldierS_Engineer'];
_i = _i + [['','',225,5,-1,0,0,0.83,'USMC',[]]];

_c = _c + ['USMC_SoldierS'];
_i = _i + [['','',300,7,-1,1,0,0.88,'USMC',[]]];

_c = _c + ['USMC_SoldierS_Spotter'];
_i = _i + [['','',320,6,-1,3,0,0.89,'USMC',[]]];

_c = _c + ['USMC_Soldier_Crew'];
_i = _i + [['','',120,4,-1,0,0,0.81,'USMC',[]]];

_c = _c + ['USMC_Soldier_Pilot'];
_i = _i + [['','',120,4,-1,0,0,0.8,'USMC',[]]];

_c = _c + ['USMC_Soldier_TL'];
_i = _i + [['','',240,5,-1,1,0,0.83,'USMC',[]]];

_c = _c + ['USMC_Soldier_SL'];
_i = _i + [['','',220,5,-1,2,0,0.92,'USMC',[]]];

/* Light Vehicles */
_c = _c + ['MMT_USMC'];
_i = _i + [['','',50,10,-2,0,1,0,'USMC',[]]];

_c = _c + ['M1030'];
_i = _i + [['','',150,12,-2,0,1,0,'USMC',[]]];

_c = _c + ['HMMWV'];
_i = _i + [['','',300,15,-2,0,1,0,'USMC',[]]];

_c = _c + ['Zodiac'];
_i = _i + [['','',225,17,-2,0,1,0,'USMC',[]]];

_c = _c + ['HMMWV_M2'];
_i = _i + [['','',700,18,-2,0,1,0,'USMC',[]]];

_c = _c + ['HMMWV_Armored'];
_i = _i + [['','',750,20,-2,1,1,0,'USMC',[]]];

_c = _c + ['HMMWV_MK19'];
_i = _i + [['','',900,22,-2,1,1,0,'USMC',[]]];

_c = _c + ['HMMWV_TOW'];
_i = _i + [['','',1450,20,-2,2,1,0,'USMC',[]]];

_c = _c + ['HMMWV_Avenger'];
_i = _i + [['','',1750,25,-2,3,1,0,'USMC',[]]];

_c = _c + ['HMMWV_Ambulance'];
_i = _i + [['','',725,22,-2,1,1,0,'USMC',[]]];

_c = _c + ['MTVR'];
_i = _i + [['','',400,20,-2,0,1,0,'USMC',[]]];

_c = _c + ['WarfareSalvageTruck_USMC'];
_i = _i + [['','',450,21,-2,0,1,0,'USMC',[]]];

_c = _c + ['MtvrRepair'];
_i = _i + [['','',525,22,-2,0,1,0,'USMC',[]]];

_c = _c + ['WarfareReammoTruck_USMC'];
_i = _i + [['','',550,22,-2,1,1,0,'USMC',[]]];

_c = _c + ['MtvrRefuel'];
_i = _i + [['','',500,22,-2,1,1,0,'USMC',[]]];

_c = _c + ['WarfareSupplyTruck_USMC'];
_i = _i + [['','',550,25,-2,0,1,0,'USMC',[]]];

_c = _c + ['RHIB'];
_i = _i + [['','',850,25,-2,1,1,0,'USMC',[]]];

_c = _c + ['RHIB2Turret'];
_i = _i + [['','',1250,27,-2,2,1,0,'USMC',[]]];

_c = _c + ['LAV25'];
_i = _i + [['','',1650,27,-2,3,1,0,'USMC',[]]];

/* Heavy Vehicles */
_c = _c + ['AAV'];
_i = _i + [['','',2550,25,-2,0,2,0,'USMC',[]]];

_c = _c + ['M1A1'];
_i = _i + [['','',5650,40,-2,if (WF_A2_Vanilla) then {1} else {2},2,0,'USMC',[]]];

_c = _c + ['MLRS'];
_i = _i + [['','',5800,40,-2,3,2,0,'USMC',[]]];

_c = _c + ['M1A2_TUSK_MG'];
_i = _i + [['','',6950,40,-2,if (WF_A2_Vanilla) then {2} else {3},2,0,'USMC',[]]];

/* Air Vehicles */
_c = _c + ['MH60S'];
_i = _i + [['','',15000,35,-2,0,3,0,'USMC',[]]];

_c = _c + ['UH1Y'];
_i = _i + [['','',25000,40,-2,1,3,0,'USMC',[]]];

_c = _c + ['MV22'];
_i = _i + [['','',25000,43,-2,1,3,0,'USMC',[]]];

_c = _c + ['C130J'];
_i = _i + [['','',26500,52,-2,1,3,0,'USMC',[]]];

_c = _c + ['AH1Z'];
_i = _i + [['','',86000,60,-2,2,3,0,'USMC',[]]];

_c = _c + ['AH64D'];
_i = _i + [['','',80000,60,-2,2,3,0,'USMC',[]]];

_c = _c + ['F35B'];
_i = _i + [['','',90000,62,-2,3,3,0,'USMC',[]]];

_c = _c + ['AV8B'];
_i = _i + [['','',95000,65,-2,3,3,0,'USMC',[]]];

_c = _c + ['AV8B2'];
_i = _i + [['','',130000,65,-2,3,3,0,'USMC',[]]];

_c = _c + ['A10'];
_i = _i + [['','',100000,70,-2,3,3,0,'USMC',[]]];

/* Special */
_c = _c + ['MQ9PredatorB'];
_i = _i + [['','',30000,35,2,2,3,0,'USMC',[]]];

/* Static Defenses */
_c = _c + ['USMC_WarfareBMGNest_M240'];
_i = _i + [['','',300,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M2HD_mini_TriPod'];
_i = _i + [['','',200,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M2StaticMG'];
_i = _i + [['','',225,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['SearchLight'];
_i = _i + [['','',125,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['MK19_TriPod'];
_i = _i + [['','',700,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['TOW_TriPod'];
_i = _i + [['','',800,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['Stinger_Pod'];
_i = _i + [['','',850,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M252'];
_i = _i + [['','',1150,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M119'];
_i = _i + [['','',2250,0,1,0,'Defense',0,'USMC',[]]];

/* Defense Structures */
_c = _c + ['Land_CamoNet_NATO'];
_i = _i + [['','',35,0,0,0,'Strategic',0,'USMC',[]]];

_c = _c + ['Land_CamoNetVar_NATO'];
_i = _i + [['','',45,0,0,0,'Strategic',0,'USMC',[]]];

_c = _c + ['Land_CamoNetB_NATO'];
_i = _i + [['','',55,0,0,0,'Strategic',0,'USMC',[]]];

_c = _c + ['USOrdnanceBox'];
_i = _i + [['','',850,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USVehicleBox'];
_i = _i + [['','',1200,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USBasicAmmunitionBox'];
_i = _i + [['','',1950,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USBasicWeaponsBox'];
_i = _i + [['','',2975,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USLaunchersBox'];
_i = _i + [['','',6250,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USSpecialWeaponsBox'];
_i = _i + [['','',7200,0,0,0,'Ammo',0,'USMC',[]]];

for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		missionNamespace getVariable (_c select _z);
		if (isNil '_get') then {
			if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call GetConfigInfo]};
			if (typeName ((_i select _z) select 4) == 'SCALAR') then {
				if (((_i select _z) select 4) == -2) then {
					_ret = (_c select _z) Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleCrewSlot.sqf";
					(_i select _z) set [4, _ret select 0];
					(_i select _z) set [9, _ret select 1];
				};
			};
			if (WF_Debug) then {(_i select _z) set [3,1]};
			_p = if ((_c select _z) isKindOf 'Man') then {'portrait'} else {'picture'};
			(_i select _z) set [1, [_c select _z,_p] Call GetConfigInfo];
			missionNamespace setVariable [_c select _z, _i select _z];
		} else {
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_USMC: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_USMC: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_USMC: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];