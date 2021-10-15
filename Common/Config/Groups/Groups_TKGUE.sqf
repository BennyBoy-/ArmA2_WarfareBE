/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "GUER";
_faction = "TKGUE";

_k = _k + ["Squad"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_u = _u + ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Bonesetter_EP1"];
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_MG_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_u = _u + ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Bonesetter_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Soldier_MG_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["TK_GUE_Soldier_2_EP1"];
_u = _u + ["TK_GUE_Soldier_3_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Bonesetter_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Soldier_MG_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["TK_GUE_Soldier_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["TK_GUE_Soldier_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["TK_GUE_Soldier_AA_EP1"];
_u = _u + ["TK_GUE_Soldier_AA_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["TK_GUE_Soldier_Sniper_EP1"];
_u = _u + ["TK_GUE_Soldier_2_EP1"];
_u = _u + ["TK_GUE_Soldier_Sniper_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["Offroad_DSHKM_TK_GUE_EP1"];
_u = _u + ["Offroad_SPG9_TK_GUE_EP1"];
_u = _u + ["Pickup_PK_TK_GUE_EP1"];
_u = _u + ["TK_GUE_Soldier_MG_EP1"];
_u = _u + ["TK_GUE_Soldier_5_EP1"];
_u = _u + ["TK_GUE_Soldier_Sniper_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Bonesetter_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["Offroad_DSHKM_TK_GUE_EP1"];
_u = _u + ["Offroad_DSHKM_TK_GUE_EP1"];
_u = _u + ["Offroad_DSHKM_TK_GUE_EP1"];
_u = _u + ["Pickup_PK_TK_GUE_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["Ural_ZU23_TK_GUE_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_AA_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["Ural_ZU23_TK_GUE_EP1"];
_u = _u + ["Ural_ZU23_TK_GUE_EP1"];
_u = _u + ["Ural_ZU23_TK_GUE_EP1"];
_u = _u + ["TK_GUE_Soldier_AA_EP1"];
_u = _u + ["TK_GUE_Soldier_AA_EP1"];
_u = _u + ["TK_GUE_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["BTR40_MG_TK_GUE_EP1"];
_u = _u + ["BRDM2_TK_GUE_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BRDM2_TK_GUE_EP1"];
_u = _u + ["BRDM2_TK_GUE_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BTR40_MG_TK_GUE_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["T34_TK_GUE_EP1"];
_u = _u + ["BTR40_MG_TK_GUE_EP1"];
_u = _u + ["TK_GUE_Soldier_MG_EP1"];
_u = _u + ["TK_GUE_Soldier_4_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_Sniper_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["T34_TK_GUE_EP1"];
_u = _u + ["BTR40_MG_TK_GUE_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["T34_TK_GUE_EP1"];
_u = _u + ["T34_TK_GUE_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T55_TK_GUE_EP1"];
_u = _u + ["T55_TK_GUE_EP1"];
_u = _u + ["T55_TK_GUE_EP1"];
_u = _u + ["T55_TK_GUE_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T55_TK_GUE_EP1"];
_u = _u + ["T55_TK_GUE_EP1"];
_u = _u + ["T34_TK_GUE_EP1"];
_u = _u + ["T34_TK_GUE_EP1"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";