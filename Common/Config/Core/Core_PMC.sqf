/* PMC Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['Soldier_AA_PMC'];
_i = _i + [['','',300,6,-1,2,0,0.92,'PMC',[]]];

_c = _c + ['Soldier_AT_PMC'];
_i = _i + [['','',260,6,-1,0,0,0.90,'PMC',[]]];

_c = _c + ['Soldier_Bodyguard_AA12_PMC'];
_i = _i + [['','',325,6,-1,3,0,0.94,'PMC',[]]];

_c = _c + ['Soldier_Bodyguard_M4_PMC'];
_i = _i + [['','',225,6,-1,0,0,0.94,'PMC',[]]];

_c = _c + ['Soldier_Crew_PMC'];
_i = _i + [['','',170,6,-1,0,0,0.89,'PMC',[]]];

_c = _c + ['Soldier_Engineer_PMC'];
_i = _i + [['','',270,6,-1,2,0,0.91,'PMC',[]]];

_c = _c + ['Soldier_GL_M16A2_PMC'];
_i = _i + [['','',185,6,-1,0,0,0.92,'PMC',[]]];

_c = _c + ['Soldier_GL_PMC'];
_i = _i + [['','',260,6,-1,2,0,0.92,'PMC',[]]];

_c = _c + ['Soldier_M4A3_PMC'];
_i = _i + [['','',210,6,-1,1,0,0.91,'PMC',[]]];

_c = _c + ['Soldier_Medic_PMC'];
_i = _i + [['','',255,6,-1,2,0,0.92,'PMC',[]]];

_c = _c + ['Soldier_MG_PKM_PMC'];
_i = _i + [['','',190,6,-1,0,0,0.90,'PMC',[]]];

_c = _c + ['Soldier_MG_PMC'];
_i = _i + [['','',260,6,-1,3,0,0.92,'PMC',[]]];

_c = _c + ['Soldier_Pilot_PMC'];
_i = _i + [['','',175,6,-1,0,0,0.90,'PMC',[]]];

_c = _c + ['Soldier_PMC'];
_i = _i + [['','',230,6,-1,0,0,0.91,'PMC',[]]];

_c = _c + ['Soldier_Sniper_KSVK_PMC'];
_i = _i + [['','',290,6,-1,0,0,0.94,'PMC',[]]];

_c = _c + ['Soldier_Sniper_PMC'];
_i = _i + [['','',275,6,-1,0,0,0.94,'PMC',[]]];

_c = _c + ['Soldier_TL_PMC'];
_i = _i + [['','',280,6,-1,0,0,0.95,'PMC',[]]];

/* Light Vehicles */
_c = _c + ['SUV_PMC'];
_i = _i + [['','',300,20,-2,0,1,0,'PMC',[]]];

_c = _c + ['ArmoredSUV_PMC'];
_i = _i + [['','',1250,25,-2,0,1,0,'PMC',[]]];

/* Air Vehicles */
_c = _c + ['Ka137_PMC'];
_i = _i + [['','',3000,35,-2,0,3,0,'PMC',[]]];

_c = _c + ['Ka137_MG_PMC'];
_i = _i + [['','',3500,35,-2,0,3,0,'PMC',[]]];

_c = _c + ['Ka60_PMC'];
_i = _i + [['','',35000,43,-2,1,3,0,'PMC',[]]];

_c = _c + ['Ka60_GL_PMC'];
_i = _i + [['','',37500,45,-2,2,3,0,'PMC',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_PMC: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_PMC: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_PMC: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];