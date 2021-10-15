/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "INS";

_k = _k + ["Squad"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_Medic"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_1"];
_u = _u + ["Ins_Soldier_1"];
_u = _u + ["Ins_Soldier_GL"];
_u = _u + ["Ins_Soldier_1"];
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_Sniper"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_GL"];
_u = _u + ["Ins_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_Medic"];
_u = _u + ["Ins_Soldier_2"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_Sniper"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_GL"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AR"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AT"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["Ins_Soldier_Sniper"];
_u = _u + ["Ins_Soldier_Sniper"];
_u = _u + ["Ins_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["UAZ_MG_INS"];
_u = _u + ["UAZ_AGS30_INS"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_GL"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_2"];
_u = _u + ["Ins_Soldier_1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["UAZ_AGS30_INS"];
_u = _u + ["UAZ_AGS30_INS"];
_u = _u + ["UAZ_AGS30_INS"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["Offroad_DSHKM_INS"];
_u = _u + ["Pickup_PK_INS"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["Ins_Soldier_AA"];
_u = _u + ["Ural_ZU23_INS"];
_u = _u + ["Ural_ZU23_INS"];
_u = _u + ["Ins_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["ZSU_INS"];
_u = _u + ["ZSU_INS"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["BRDM2_INS"];
_u = _u + ["BRDM2_INS"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BRDM2_INS"];
_u = _u + ["BRDM2_ATGM_INS"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["BMP2_INS"];
_u = _u + ["Ins_Soldier_1"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["T72_INS"];
_u = _u + ["T72_INS"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_u = _u + ["T72_INS"];
_u = _u + ["T72_INS"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T72_INS"];
_u = _u + ["T72_INS"];
_u = _u + ["T72_INS"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";