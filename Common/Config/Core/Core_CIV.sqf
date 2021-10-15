/* CIV Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['Worker1'];
_i = _i + [['','',375,4,-1,0,0,0.4,'Civilians',[]]];

_c = _c + ['Worker2'];
_i = _i + [['','',375,4,-1,0,0,0.4,'Civilians',[]]];

_c = _c + ['Worker3'];
_i = _i + [['','',375,4,-1,0,0,0.4,'Civilians',[]]];

_c = _c + ['Worker4'];
_i = _i + [['','',375,4,-1,0,0,0.4,'Civilians',[]]];

/* Light Vehicles */
_c = _c + ['MMT_Civ'];
_i = _i + [['','',50,8,-2,0,1,0,'Civilians',[]]];

_c = _c + ['TT650_Civ'];
_i = _i + [['','',100,12,-2,0,1,0,'Civilians',[]]];

_c = _c + ['Tractor'];
_i = _i + [['','',150,15,-2,0,1,0,'Civilians',[]]];

_c = _c + ['Lada1'];
_i = _i + [['','',175,18,-2,0,1,0,'Civilians',[]]];

_c = _c + ['Lada2'];
_i = _i + [['','',175,18,-2,0,1,0,'Civilians',[]]];

_c = _c + ['LadaLM'];
_i = _i + [['','',180,20,-2,0,1,0,'Civilians',[]]];

_c = _c + ['SkodaBlue'];
_i = _i + [['','',190,17,-2,0,1,0,'Civilians',[]]];

_c = _c + ['SkodaRed'];
_i = _i + [['','',190,17,-2,0,1,0,'Civilians',[]]];

_c = _c + ['car_sedan'];
_i = _i + [['','',200,20,-2,0,1,0,'Civilians',[]]];

_c = _c + ['car_hatchback'];
_i = _i + [['','',220,20,-2,0,1,0,'Civilians',[]]];

_c = _c + ['datsun1_civil_1_open'];
_i = _i + [['','',250,22,-2,0,1,0,'Civilians',[]]];

_c = _c + ['datsun1_civil_2_covered'];
_i = _i + [['','',250,22,-2,0,1,0,'Civilians',[]]];

_c = _c + ['datsun1_civil_3_open'];
_i = _i + [['','',250,22,-2,0,1,0,'Civilians',[]]];

_c = _c + ['VWGolf'];
_i = _i + [['','',270,23,-2,0,1,0,'Civilians',[]]];

_c = _c + ['hilux1_civil_1_open'];
_i = _i + [['','',340,25,-2,0,1,0,'Civilians',[]]];

_c = _c + ['hilux1_civil_2_covered'];
_i = _i + [['','',340,25,-2,0,1,0,'Civilians',[]]];

_c = _c + ['V3S_Civ'];
_i = _i + [['','',380,22,-2,0,1,0,'Civilians',[]]];

_c = _c + ['UralCivil'];
_i = _i + [['','',390,25,-2,0,1,0,'Civilians',[]]];

_c = _c + ['Ikarus'];
_i = _i + [['','',420,25,-2,0,1,0,'Civilians',[]]];

/* Air Vehicles */
_c = _c + ['Mi17_Civilian'];
_i = _i + [['','',15000,35,-2,0,3,0,'Civilians',[]]];

/* Defense Structures */
_c = _c + ['Land_HBarrier3'];
_i = _i + [['','',20,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_HBarrier5'];
_i = _i + [['','',30,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_HBarrier_large'];
_i = _i + [['','',50,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fort_bagfence_long'];
_i = _i + [['','',10,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fort_bagfence_corner'];
_i = _i + [['','',8,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fort_bagfence_round'];
_i = _i + [['','',12,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Hhedgehog_concreteBig'];
_i = _i + [['','',95,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Hedgehog'];
_i = _i + [['','',5,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['HeliH'];
_i = _i + [['','',15,0,0,0,'Strategic',0,'Civilians',[]]];

_c = _c + ['MASH'];
_i = _i + [['','',30,0,0,0,'Strategic',0,'Civilians',[]]];

_c = _c + ['Land_Ind_SawMillPen'];
_i = _i + [['Roof','',150,0,0,0,'Strategic',0,'Civilians',[]]];

_c = _c + ['Land_Campfire'];
_i = _i + [['','',3,0,0,0,'Strategic',0,'Civilians',[]]];

_c = _c + ['Base_WarfareBBarrier5x'];
_i = _i + [['','',15,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Base_WarfareBBarrier10x'];
_i = _i + [['','',25,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Base_WarfareBBarrier10xTall'];
_i = _i + [['','',50,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fortified_nest_small'];
_i = _i + [['','',40,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fortified_nest_big'];
_i = _i + [['','',100,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_Fort_Watchtower'];
_i = _i + [['','',125,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fort_rampart'];
_i = _i + [['','',30,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_fort_artillery_nest'];
_i = _i + [['','',65,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Sign_Danger'];
_i = _i + [[localize 'STR_WF_Minefield','',1200,0,0,0,'Strategic',0,'Civilians',[]]];

_c = _c + ['Fort_RazorWire'];
_i = _i + [['','',25,0,0,0,'Fortification',0,'Civilians',[]]];

_c = _c + ['Land_Ind_IlluminantTower'];
_i = _i + [['','',200,0,0,0,'Fortification',0,'Civilians',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_CIV: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_CIV: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_CIV: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];