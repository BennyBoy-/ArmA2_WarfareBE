/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "US";

_k = _k + ["Squad"];
_u		= ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["US_Delta_Force_TL_EP1"];
_u = _u + ["US_Delta_Force_Assault_EP1"];
_u = _u + ["US_Delta_Force_MG_EP1"];
_u = _u + ["US_Delta_Force_AR_EP1"];
_u = _u + ["US_Delta_Force_EP1"];
_u = _u + ["US_Delta_Force_Medic_EP1"];
_u = _u + ["US_Delta_Force_M14_EP1"];
_u = _u + ["US_Delta_Force_Air_Controller_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_HAT"];
_u		= ["US_Soldier_HAT_EP1"];
_u = _u + ["US_Soldier_HAT_EP1"];
_u = _u + ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AA_EP1"];
_u = _u + ["US_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["US_Soldier_Sniper_EP1"];
_u = _u + ["US_Soldier_Marksman_EP1"];
_u = _u + ["US_Soldier_Sniper_EP1"];
_u = _u + ["US_Soldier_Spotter_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["HMMWV_M998_crows_M2_DES_EP1"];
_u = _u + ["HMMWV_M998_crows_MK19_DES_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["HMMWV_TOW_DES_EP1"];
_u = _u + ["HMMWV_TOW_DES_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["HMMWV_M998_crows_M2_DES_EP1"];
_u = _u + ["HMMWV_M998_crows_MK19_DES_EP1"];
_u = _u + ["HMMWV_TOW_DES_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["HMMWV_Avenger_DES_EP1"];
_u = _u + ["HMMWV_Avenger_DES_EP1"];
_u = _u + ["US_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["M6_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["M1126_ICV_M2_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["M1126_ICV_M2_EP1"];
_u = _u + ["M1126_ICV_mk19_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["M1126_ICV_M2_EP1"];
_u = _u + ["M1135_ATGMV_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["M2A2_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["M2A3_EP1"];
_u = _u + ["M2A3_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["M1A1_US_DES_EP1"];
_u = _u + ["M1A1_US_DES_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A1_US_DES_EP1"];
_u = _u + ["M1A1_US_DES_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";