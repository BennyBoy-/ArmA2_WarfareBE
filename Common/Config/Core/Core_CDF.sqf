/* CDF Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['CDF_Soldier'];
_i = _i + [['','',150,4,-1,0,0,0.65,'CDF',[]]];

_c = _c + ['CDF_Soldier_Engineer'];
_i = _i + [['','',225,5,-1,0,0,0.66,'CDF',[]]];

_c = _c + ['CDF_Soldier_Light'];
_i = _i + [['','',175,4,-1,0,0,0.65,'CDF',[]]];

_c = _c + ['CDF_Soldier_GL'];
_i = _i + [['','',180,4,-1,0,0,0.65,'CDF',[]]];

_c = _c + ['CDF_Soldier_Militia'];
_i = _i + [['','',160,3,-1,0,0,0.62,'CDF',[]]];

_c = _c + ['CDF_Soldier_Medic'];
_i = _i + [['','',210,4,-1,0,0,0.69,'CDF',[]]];

_c = _c + ['CDF_Soldier_Sniper'];
_i = _i + [['','',230,5,-1,1,0,0.72,'CDF',[]]];

_c = _c + ['CDF_Soldier_Spotter'];
_i = _i + [['','',240,6,-1,1,0,0.71,'CDF',[]]];

_c = _c + ['CDF_Soldier_Marksman'];
_i = _i + [['','',235,7,-1,3,0,0.69,'CDF',[]]];

_c = _c + ['CDF_Soldier_RPG'];
_i = _i + [['','',250,6,-1,1,0,0.64,'CDF',[]]];

_c = _c + ['CDF_Soldier_Strela'];
_i = _i + [['','',400,6,-1,2,0,0.68,'CDF',[]]];

_c = _c + ['CDF_Soldier_AR'];
_i = _i + [['','',165,6,-1,1,0,0.64,'CDF',[]]];

_c = _c + ['CDF_Soldier_MG'];
_i = _i + [['','',180,5,-1,0,0,0.65,'CDF',[]]];

_c = _c + ['CDF_Soldier_TL'];
_i = _i + [['','',210,6,-1,2,0,0.73,'CDF',[]]];

_c = _c + ['CDF_Soldier_Officer'];
_i = _i + [['','',230,7,-1,1,0,0.74,'CDF',[]]];

_c = _c + ['CDF_Commander'];
_i = _i + [['','',280,7,-1,3,0,0.75,'CDF',[]]];

_c = _c + ['CDF_Soldier_Pilot'];
_i = _i + [['','',130,5,-1,0,0,0.62,'CDF',[]]];

_c = _c + ['CDF_Soldier_Crew'];
_i = _i + [['','',130,5,-1,0,0,0.63,'CDF',[]]];

/* Light Vehicles */
_c = _c + ['UAZ_CDF'];
_i = _i + [['','',150,15,-2,0,1,0,'CDF',[]]];

_c = _c + ['UAZ_MG_CDF'];
_i = _i + [['','',310,17,-2,0,1,0,'CDF',[]]];

_c = _c + ['UAZ_AGS30_CDF'];
_i = _i + [['','',475,25,-2,1,1,0,'CDF',[]]];

_c = _c + ['Ural_CDF'];
_i = _i + [['','',300,20,-2,0,1,0,'CDF',[]]];

_c = _c + ['WarfareSalvageTruck_CDF'];
_i = _i + [['','',450,18,-2,0,1,0,'CDF',[]]];

_c = _c + ['UralRepair_CDF'];
_i = _i + [['','',525,21,-2,2,1,0,'CDF',[]]];

_c = _c + ['UralReammo_CDF'];
_i = _i + [['','',550,21,-2,1,1,0,'CDF',[]]];

_c = _c + ['UralRefuel_CDF'];
_i = _i + [['','',500,21,-2,1,1,0,'CDF',[]]];

_c = _c + ['WarfareSupplyTruck_CDF'];
_i = _i + [['','',550,21,-2,0,1,0,'CDF',[]]];

_c = _c + ['BRDM2_CDF'];
_i = _i + [['','',1100,25,-2,1,1,0,'CDF',[]]];

_c = _c + ['BRDM2_ATGM_CDF'];
_i = _i + [['','',1650,25,-2,2,1,0,'CDF',[]]];

_c = _c + ['Ural_ZU23_CDF'];
_i = _i + [['','',1750,20,-2,2,1,0,'CDF',[]]];

_c = _c + ['GRAD_CDF'];
_i = _i + [['','',4200,35,-2,3,1,0,'CDF',[]]];

/* Heavy Vehicles */
_c = _c + ['BMP2_Ambul_CDF'];
_i = _i + [['','',950,20,-2,0,2,0,'CDF',[]]];

_c = _c + ['BMP2_CDF'];
_i = _i + [['','',2600,30,-2,1,2,0,'CDF',[]]];

_c = _c + ['ZSU_CDF'];
_i = _i + [['','',3400,35,-2,2,2,0,'CDF',[]]];

_c = _c + ['T72_CDF'];
_i = _i + [['','',4900,35,-2,3,2,0,'CDF',[]]];

/* Air Vehicles */
_c = _c + ['Mi17_CDF'];
_i = _i + [['','',15000,35,-2,0,3,0,'CDF',[]]];

_c = _c + ['Mi17_medevac_CDF'];
_i = _i + [['','',18000,35,-2,1,3,0,'CDF',[]]];

_c = _c + ['Mi24_D'];
_i = _i + [['','',65000,40,-2,2,3,0,'CDF',[]]];

_c = _c + ['Su25_CDF'];
_i = _i + [['','',92000,55,-2,3,3,0,'CDF',[]]];

/* Static Defenses */
_c = _c + ['CDF_WarfareBMGNest_PK'];
_i = _i + [['','',300,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['DSHkM_Mini_TriPod_CDF'];
_i = _i + [['','',200,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['DSHKM_CDF'];
_i = _i + [['','',225,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['SearchLight_CDF'];
_i = _i + [['','',125,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['AGS_CDF'];
_i = _i + [['','',700,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['SPG9_CDF'];
_i = _i + [['','',475,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['ZU23_CDF'];
_i = _i + [['','',945,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['2b14_82mm_CDF'];
_i = _i + [['Podnos 2B14','',1150,0,1,0,'Defense',0,'CDF',[]]];

_c = _c + ['D30_CDF'];
_i = _i + [['','',2250,0,1,0,'Defense',0,'CDF',[]]];

for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		_get = missionNamespace getVariable (_c select _z);
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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_CDF: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_CDF: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_CDF: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];