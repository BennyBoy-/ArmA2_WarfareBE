/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "CDF";

_k = _k + ["Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_RPG"];
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Engineer"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_RPG"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Strela"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_Spotter"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_Marksman"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["UAZ_AGS30_CDF"];
_u = _u + ["UAZ_MG_CDF"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_AR"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["UAZ_AGS30_CDF"];
_u = _u + ["UAZ_MG_CDF"];
_u = _u + ["UAZ_MG_CDF"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["Ural_ZU23_CDF"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["CDF_Soldier_Strela"];
_u = _u + ["Ural_ZU23_CDF"];
_u = _u + ["Ural_ZU23_CDF"];
_u = _u + ["CDF_Soldier_Strela"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["ZSU_CDF"];
_u = _u + ["ZSU_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["BRDM2_CDF"];
_u = _u + ["BRDM2_CDF"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BRDM2_CDF"];
_u = _u + ["BRDM2_ATGM_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["T72_CDF"];
_u = _u + ["T72_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["T72_CDF"];
_u = _u + ["T72_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T72_CDF"];
_u = _u + ["T72_CDF"];
_u = _u + ["T72_CDF"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";