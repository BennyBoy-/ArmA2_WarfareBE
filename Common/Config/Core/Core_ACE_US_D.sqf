/* ACE US Desert Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Heavy Vehicles */
_c = _c + ['ACE_Stryker_RV_SLAT_D'];
_i = _i + [['','',1800,25,[false,true,2,0],0,2,0,'US',[]]];

_c = _c + ['ACE_M1A1HA_TUSK_DESERT'];
_i = _i + [['','',5850,40,-2,2,2,0,'US',[]]];

_c = _c + ['ACE_M1A1HA_TUSK_CSAMM_DESERT'];
_i = _i + [['','',6450,40,-2,3,2,0,'US',[]]];

/* Air Vehicles */
_c = _c + ['ACE_AH6_GAU19_FLIR'];
_i = _i + [['','',29500,50,-2,2,3,0,'US',[]]];

_c = _c + ['ACE_AH6J_DAGR_FLIR'];
_i = _i + [['','',35500,50,-2,2,3,0,'US',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_ACE_US_D: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_ACE_US_D: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_ACE_US_D: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];