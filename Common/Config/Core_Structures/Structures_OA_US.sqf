Private ['_c','_count','_d','_dir','_dis','_n','_s','_side','_t','_v'];

_side = _this;

/* Root Definition */
_MHQ = "M1130_CV_EP1";
_HQ = "M1130_HQ_unfolded_EP1";
_BAR = "US_WarfareBBarracks_EP1";
_LVF = "US_WarfareBLightFactory_EP1";
_CC = "US_WarfareBUAVterminal_EP1";
_HEAVY = "US_WarfareBHeavyFactory_EP1";
_AIR = "US_WarfareBAircraftFactory_EP1";
_SP = "US_WarfareBVehicleServicePoint_EP1";
_AAR = "US_WarfareBAntiAirRadar_EP1";

/* Mash used after being deployed */
missionNamespace setVariable [Format["WFBE_%1FARP", _side], 'Camp_EP1'];

/* Construction Crates */
missionNamespace setVariable [Format["WFBE_%1CONSTRUCTIONSITE", _side], 'US_WarfareBContructionSite_EP1'];

/* Structures */
_v			= ["Headquarters"];
_n			= [_HQ];
_d			= [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c			= [missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_COST_DEPLOY"];
_t			= [if (WF_Debug) then {1} else {30}];
_s			= ["HQSite"];
_dis		= [15];
_dir		= [0];

_v = _v		+ ["Barracks"];
_n = _n		+ [_BAR];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [200];
_t = _t		+ [if (WF_Debug) then {1} else {70}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [18];
_dir = _dir	+ [90];

_v = _v		+ ["Light"];
_n = _n		+ [_LVF];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [600];
_t = _t		+ [if (WF_Debug) then {1} else {90}];
_s = _s		+ ["MediumSite"];
_dis = _dis	+ [25];
_dir = _dir	+ [90];

_v = _v		+ ["CommandCenter"];
_n = _n		+ [_CC];
_d = _d		+ [localize "STR_WF_CommandCenter"];
_c = _c		+ [1200];
_t = _t		+ [if (WF_Debug) then {1} else {110}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [20];
_dir = _dir	+ [90];

_v = _v		+ ["Heavy"];
_n = _n		+ [_HEAVY];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [2800];
_t = _t		+ [if (WF_Debug) then {1} else {130}];
_s = _s		+ ["MediumSite"];
_dis = _dis	+ [25];
_dir = _dir	+ [90];

_v = _v		+ ["Aircraft"];
_n = _n		+ [_AIR];
_d = _d		+ [localize "STR_WF_AircraftFactory"];
_c = _c		+ [4400];
_t = _t		+ [if (WF_Debug) then {1} else {150}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [31];
_dir = _dir	+ [90];

_v = _v		+ ["ServicePoint"];
_n = _n		+ [_SP];
_d = _d		+ [localize "STR_WF_MAIN_ServicePoint"];
_c = _c		+ [700];
_t = _t		+ [if (WF_Debug) then {1} else {70}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [21];
_dir = _dir	+ [90];

if ((missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR") > 0) then {
	_v = _v		+ ["AARadar"];
	_n = _n		+ [_AAR];
	_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
	_c = _c		+ [3200];
	_t = _t		+ [if (WF_Debug) then {1} else {280}];
	_s = _s		+ ["MediumSite"];
	_dis = _dis	+ [21];
	_dir = _dir	+ [90];
};

for [{_count = count _v - 1},{_count >= 0},{_count = _count - 1}] do {
	missionNamespace setVariable [Format["WFBE_%1%2TYPE",_side,_v select _count],_count];
};

{
	missionNamespace setVariable [Format ["%1%2",_side, _x select 0], _x select 1];
} forEach [["HQ",_HQ],["BAR",_BAR],["LVF",_LVF],["CC",_CC],["HEAVY",_HEAVY],["SP",_SP],["AAR",_AAR]];

missionNamespace setVariable [Format["WFBE_%1MHQNAME", _side], _MHQ];
missionNamespace setVariable [Format["WFBE_%1STRUCTURES", _side], _v];
missionNamespace setVariable [Format["WFBE_%1STRUCTURENAMES", _side], _n];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDESCRIPTIONS", _side], _d];
missionNamespace setVariable [Format["WFBE_%1STRUCTURECOSTS", _side], _c];
missionNamespace setVariable [Format["WFBE_%1STRUCTURETIMES", _side], _t];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDISTANCES", _side], _dis];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDIRECTIONS", _side], _dir];
missionNamespace setVariable [Format["WFBE_%1STRUCTURESCRIPTS", _side], _s];

/* Defenses */
_n			= ["WarfareBMGNest_M240_US_EP1"];
_n = _n		+ ["M2HD_mini_TriPod_US_EP1"];
_n = _n		+ ["SearchLight_US_EP1"];
_n = _n		+ ["M2StaticMG_US_EP1"];
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_n = _n		+ ["BAF_GPMG_Minitripod_W"];
	_n = _n		+ ["BAF_GMG_Tripod_W"];
	_n = _n		+ ["BAF_L2A1_Minitripod_W"];
	_n = _n		+ ["BAF_L2A1_Tripod_W"];
};
_n = _n		+ ["MK19_TriPod_US_EP1"];
_n = _n		+ ["TOW_TriPod_US_EP1"];
_n = _n		+ ["Stinger_Pod_US_EP1"];
_n = _n		+ ["M252_US_EP1"];
_n = _n		+ ["M119_US_EP1"];
_n = _n		+ ["Land_HBarrier3"];
_n = _n		+ ["Land_HBarrier5"];
_n = _n		+ ["Land_HBarrier_large"];
_n = _n		+ ["US_WarfareBBarrier5x_EP1"];
_n = _n		+ ["US_WarfareBBarrier10x_EP1"];
_n = _n		+ ["US_WarfareBBarrier10xTall_EP1"];
_n = _n		+ ["MASH_EP1"];
_n = _n		+ ["Land_fort_bagfence_long"];
_n = _n		+ ["Land_fort_bagfence_corner"];
_n = _n		+ ["Land_fort_bagfence_round"];
_n = _n		+ ["Land_fortified_nest_small_EP1"];
_n = _n		+ ["Land_fort_rampart_EP1"];
_n = _n		+ ["Land_fort_artillery_nest_EP1"];
_n = _n		+ ["Hhedgehog_concreteBig"];
_n = _n		+ ["Hedgehog_EP1"];
_n = _n		+ ["Land_CamoNet_NATO_EP1"];
_n = _n		+ ["Land_CamoNetVar_NATO_EP1"];
_n = _n		+ ["Land_CamoNetB_NATO_EP1"];
_n = _n		+ ["Sign_Danger"];
_n = _n		+ ["HeliH"];
_n = _n		+ ["Fort_RazorWire"];
_n = _n		+ ["Concrete_Wall_EP1"];
_n = _n		+ ["Land_Campfire"];
_n = _n		+ ["USOrdnanceBox_EP1"];
_n = _n		+ ["USVehicleBox_EP1"];
_n = _n		+ ["USBasicAmmunitionBox_EP1"];
_n = _n		+ ["USBasicWeapons_EP1"];
_n = _n		+ ["USLaunchers_EP1"];
_n = _n		+ ["USSpecialWeapons_EP1"];

/* Class used for AI, AI will attempt to build those */
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MG", _side], ['M2StaticMG_US_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_GL", _side], ['MK19_TriPod_US_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_AAPOD", _side], ['Stinger_Pod_US_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_ATPOD", _side], ['TOW_TriPod_US_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_CANNON", _side], ['M119_US_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MASH", _side], ['MASH_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MORTAR", _side], ['M252_US_EP1']];

missionNamespace setVariable [Format["WFBE_%1DEFENSENAMES", _side], _n];