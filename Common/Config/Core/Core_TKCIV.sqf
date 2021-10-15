/* CIV Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['TK_CIV_Worker01_EP1'];
_i = _i + [['','',375,4,-1,0,0,0.4,'Takistani Civilians',[]]];

_c = _c + ['TK_CIV_Worker02_EP1'];
_i = _i + [['','',375,4,-1,0,0,0.4,'Takistani Civilians',[]]];

/* Light Vehicles */
_c = _c + ['Old_bike_TK_CIV_EP1'];
_i = _i + [['','',50,8,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Old_moto_TK_Civ_EP1'];
_i = _i + [['','',100,12,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['TT650_TK_CIV_EP1'];
_i = _i + [['','',110,15,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Lada1_TK_CIV_EP1'];
_i = _i + [['','',175,18,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Lada2_TK_CIV_EP1'];
_i = _i + [['','',175,18,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Volha_1_TK_CIV_EP1'];
_i = _i + [['','',200,21,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Volha_2_TK_CIV_EP1'];
_i = _i + [['','',200,21,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['VolhaLimo_TK_CIV_EP1'];
_i = _i + [['','',200,22,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['LandRover_TK_CIV_EP1'];
_i = _i + [['','',250,24,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['S1203_TK_CIV_EP1'];
_i = _i + [['','',320,25,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['V3S_Open_TK_CIV_EP1'];
_i = _i + [['','',380,25,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Ural_TK_CIV_EP1'];
_i = _i + [['','',390,25,-2,0,1,0,'Takistani Civilians',[]]];

_c = _c + ['Ikarus_TK_CIV_EP1'];
_i = _i + [['','',420,25,-2,0,1,0,'Takistani Civilians',[]]];

/* Air Vehicles */
_c = _c + ['An2_1_TK_CIV_EP1'];
_i = _i + [['','',10000,35,-2,1,3,0,'Takistani Civilians',[]]];

_c = _c + ['An2_2_TK_CIV_EP1'];
_i = _i + [['','',10000,35,-2,1,3,0,'Takistani Civilians',[]]];

/* Defense Structures */
_c = _c + ['Land_HBarrier3'];
_i = _i + [['','',20,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_HBarrier5'];
_i = _i + [['','',30,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_HBarrier_large'];
_i = _i + [['','',50,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_fort_bagfence_long'];
_i = _i + [['','',10,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_fort_bagfence_corner'];
_i = _i + [['','',8,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_fort_bagfence_round'];
_i = _i + [['','',12,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Hhedgehog_concreteBig'];
_i = _i + [['','',95,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Hedgehog_EP1'];
_i = _i + [['','',5,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['HeliH'];
_i = _i + [['','',15,0,0,0,'Strategic',0,'Takistani Civilians',[]]];

_c = _c + ['MASH_EP1'];
_i = _i + [['','',30,0,0,0,'Strategic',0,'Takistani Civilians',[]]];

_c = _c + ['Land_Campfire'];
_i = _i + [['','',3,0,0,0,'Strategic',0,'Civilians',[]]];

_c = _c + ['Land_fort_rampart_EP1'];
_i = _i + [['','',30,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_fort_artillery_nest_EP1'];
_i = _i + [[localize 'STR_WF_ArtilleryNest','',65,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_fortified_nest_small_EP1'];
_i = _i + [['','',40,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Sign_Danger'];
_i = _i + [[localize 'STR_WF_Minefield','',1200,0,0,0,'Strategic',0,'Takistani Civilians',[]]];

_c = _c + ['Fort_RazorWire'];
_i = _i + [['','',25,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Concrete_Wall_EP1'];
_i = _i + [['','',20,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

_c = _c + ['Land_Ind_IlluminantTower'];
_i = _i + [['','',200,0,0,0,'Fortification',0,'Takistani Civilians',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_TKCIV: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_TKCIV: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_TKCIV: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];