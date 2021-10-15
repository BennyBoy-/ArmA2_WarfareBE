/* ACE Russian Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Light Vehicles */
_c = _c + ['ACE_BTR70_RU'];
_i = _i + [['','',175,14,-2,0,1,0,'Russians',[]]];

_c = _c + ['ACE_BRDM2_SA9_RU'];
_i = _i + [['','',175,14,-2,0,1,0,'Russians',[]]];


/* Heavy Vehicles */
_c = _c + ['ACE_T72B_RU'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'Russians',[]]];

_c = _c + ['ACE_T72BA_RU'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'Russians',[]]];

_c = _c + ['ACE_BMP2D_RU'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'Russians',[]]];

_c = _c + ['ACE_BMD_1_RU'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'Russians',[]]];

_c = _c + ['ACE_BMD_1P_RUS'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'Russians',[]]];

_c = _c + ['ACE_BMD_2K_RU'];
_i = _i + [['','',1650,25,[false,true,2,0],0,2,0,'Russians',[]]];



/* Air Vehicles */
_c = _c + ['ACE_Mi24_V_FAB250_RU'];
_i = _i + [['','',29500,50,-2,1,3,0,'Russians',[]]];

_c = _c + ['ACE_Mi24_V_UPK23_RU'];
_i = _i + [['','',35500,50,-2,1,3,0,'Russians',[]]];

_c = _c + ['ACE_Su27_CAP'];
_i = _i + [['','',35500,50,-2,1,3,0,'Russians',[]]];

_c = _c + ['ACE_Su27_CASP'];
_i = _i + [['','',35500,50,-2,1,3,0,'Russians',[]]];

_c = _c + ['ACE_Su27_CAS'];
_i = _i + [['','',35500,50,-2,1,3,0,'Russians',[]]];

for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		_get = (_c select _z) Call GetNamespace;
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
			[_c select _z,_i select _z] Call SetNamespace;
		} else {
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_ACE_US_D: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_ACE_US_D: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_ACE_RU: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];