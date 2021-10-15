/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "GUER";
_faction = "GUE";

_k = _k + ["Squad"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["GUE_Soldier_GL"];
_u = _u + ["GUE_Soldier_AR"];
_u = _u + ["GUE_Soldier_1"];
_u = _u + ["GUE_Soldier_3"];
_u = _u + ["GUE_Soldier_2"];
_u = _u + ["GUE_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["GUE_Soldier_GL"];
_u = _u + ["GUE_Soldier_AT"];
_u = _u + ["GUE_Soldier_AR"];
_u = _u + ["GUE_Soldier_MG"];
_u = _u + ["GUE_Soldier_AT"];
_u = _u + ["GUE_Soldier_2"];
_u = _u + ["GUE_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["GUE_Soldier_2"];
_u = _u + ["GUE_Soldier_MG"];
_u = _u + ["GUE_Soldier_AT"];
_u = _u + ["GUE_Soldier_GL"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["GUE_Soldier_1"];
_u = _u + ["GUE_Soldier_AR"];
_u = _u + ["GUE_Soldier_GL"];
_u = _u + ["GUE_Soldier_MG"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["GUE_Worker2"];
_u = _u + ["GUE_Woodlander3"];
_u = _u + ["GUE_Villager3"];
_u = _u + ["GUE_Woodlander2"];
_u = _u + ["GUE_Woodlander1"];
_u = _u + ["GUE_Villager4"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["GUE_Soldier_AT"];
_u = _u + ["GUE_Soldier_AT"];
_u = _u + ["GUE_Soldier_AT"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["GUE_Soldier_AA"];
_u = _u + ["GUE_Soldier_AA"];
_u = _u + ["GUE_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["GUE_Soldier_Sniper"];
_u = _u + ["GUE_Soldier_Sniper"];
_u = _u + ["GUE_Soldier_Scout"];
_u = _u + ["GUE_Soldier_Scout"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["Offroad_DSHKM_Gue"];
_u = _u + ["Offroad_SPG9_Gue"];
_u = _u + ["Pickup_PK_GUE"];
_u = _u + ["GUE_Soldier_MG"];
_u = _u + ["GUE_Soldier_3"];
_u = _u + ["GUE_Soldier_Sniper"];
_u = _u + ["GUE_Soldier_AR"];
_u = _u + ["GUE_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["Offroad_DSHKM_Gue"];
_u = _u + ["Offroad_DSHKM_Gue"];
_u = _u + ["Offroad_SPG9_Gue"];
_u = _u + ["Pickup_PK_GUE"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["GUE_Soldier_GL"];
_u = _u + ["GUE_Soldier_AA"];
_u = _u + ["GUE_Soldier_1"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["Ural_ZU23_Gue"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["GUE_Soldier_AA"];
_u = _u + ["GUE_Soldier_AA"];
_u = _u + ["GUE_Soldier_AA"];
_u = _u + ["GUE_Soldier_1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["GUE_Soldier_AR"];
_u = _u + ["BRDM2_GUE"];
_u = _u + ["BRDM2_GUE"];
_u = _u + ["GUE_Soldier_GL"];
_u = _u + ["GUE_Soldier_1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BRDM2_GUE"];
_u = _u + ["BRDM2_GUE"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["GUE_Soldier_CO"];
_u = _u + ["BMP2_GUE"];
_u = _u + ["GUE_Soldier_MG"];
_u = _u + ["GUE_Soldier_GL"];
_u = _u + ["GUE_Soldier_3"];
_u = _u + ["GUE_Soldier_AR"];
_u = _u + ["GUE_Soldier_Sniper"];
_u = _u + ["GUE_Soldier_AT"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["BMP2_GUE"];
_u = _u + ["BMP2_GUE"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["T72_GUE"];
_u = _u + ["T72_GUE"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T72_GUE"];
_u = _u + ["T72_GUE"];
_u = _u + ["T72_GUE"];
_u = _u + ["T72_GUE"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T72_GUE"];
_u = _u + ["T72_GUE"];
_u = _u + ["BMP2_GUE"];
_u = _u + ["BMP2_GUE"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";