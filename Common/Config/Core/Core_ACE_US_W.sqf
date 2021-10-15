/* ACE US Woodland Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Light Vehicles */
_c = _c + ['ACE_ATV_Honda'];
_i = _i + [['','',175,14,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_USARMY'];
_i = _i + [['','',300,15,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_MK19_USARMY'];
_i = _i + [['','',900,18,-2,1,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_GMV'];
_i = _i + [['','',1050,20,-2,1,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_GMV_MK19'];
_i = _i + [['','',1050,20,-2,1,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_M2_USARMY'];
_i = _i + [['','',850,20,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_TOW_USARMY'];
_i = _i + [['','',1450,20,-2,2,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_HMMWV_Ambulance_USARMY'];
_i = _i + [['','',725,22,-2,2,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5tOpen'];
_i = _i + [['','',400,20,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5t'];
_i = _i + [['','',400,20,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5tMGOpen'];
_i = _i + [['','',400,20,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5tMG'];
_i = _i + [['','',400,20,-2,0,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5tRepair'];
_i = _i + [['','',525,22,-2,2,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5tReammo'];
_i = _i + [['','',550,22,-2,1,1,0,'US - Woodland',[]]];

_c = _c + ['ACE_Truck5tRefuel'];
_i = _i + [['','',500,22,-2,1,1,0,'US - Woodland',[]]];

/* Heavy Vehicles */
_c = _c + ['ACE_Stryker_ICV_M2_SLAT'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_Stryker_RV_SLAT'];
_i = _i + [['','',1800,25,[false,true,2,0],0,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_Stryker_ICV_MK19_SLAT'];
_i = _i + [['','',1950,25,[false,true,2,0],0,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_Stryker_TOW_MG_Slat'];
_i = _i + [['','',1850,25,-2,2,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_Stryker_MGS_Slat'];
_i = _i + [['','',2450,25,-2,2,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M113A3_Ambul'];
_i = _i + [['','',1950,25,-2,1,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_Vulcan'];
_i = _i + [['','',1950,25,-2,1,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M113A3'];
_i = _i + [['','',1950,25,-2,1,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M2A2_W'];
_i = _i + [['','',4450,30,-2,1,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M2A3_W'];
_i = _i + [['','',4950,32,-2,2,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M1A1_NATO'];
_i = _i + [['','',5650,40,-2,2,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M1A1HA_TUSK'];
_i = _i + [['','',5650,40,-2,2,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M1A1HA_TUSK_CSAMM'];
_i = _i + [['','',5650,40,-2,2,2,0,'US - Woodland',[]]];

_c = _c + ['ACE_M6A1_W'];
_i = _i + [['','',8200,35,-2,3,2,0,'US - Woodland',[]]];

/* Air Vehicles */
_c = _c + ['ACE_AH6_GAU19_FLIR'];
_i = _i + [['','',29500,50,-2,1,3,0,'US - Woodland',[]]];

_c = _c + ['ACE_AH6J_DAGR_FLIR'];
_i = _i + [['','',35500,50,-2,1,3,0,'US - Woodland',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_ACE_US_W: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_ACE_US_W: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_ACE_US_W: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];