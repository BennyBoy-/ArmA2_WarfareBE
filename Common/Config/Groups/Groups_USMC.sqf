/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "USMC";

_k = _k + ["Squad"];
_u		= ["USMC_Soldier_SL"];
_u = _u + ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["FR_TL"];
_u = _u + ["FR_AR"];
_u = _u + ["FR_GL"];
_u = _u + ["FR_Marksman"];
_u = _u + ["FR_R"];
_u = _u + ["FR_Corpsman"];
_u = _u + ["FR_Sapper"];
_u = _u + ["FR_AC"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_LAT"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_LAT"];
_l = _l + [_u];

_k = _k + ["Team_HAT"];
_u		= ["USMC_Soldier_HAT"];
_u = _u + ["USMC_Soldier_HAT"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_LAT"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AA"];
_u = _u + ["USMC_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["USMC_SoldierS_Sniper"];
_u = _u + ["USMC_SoldierS_Spotter"];
_u = _u + ["USMC_SoldierS_Sniper"];
_u = _u + ["USMC_SoldierS"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["HMMWV_M2"];
_u = _u + ["HMMWV_Mk19"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["HMMWV_TOW"];
_u = _u + ["HMMWV_TOW"];
_u = _u + ["USMC_Soldier_AR"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["HMMWV_M2"];
_u = _u + ["HMMWV_Mk19"];
_u = _u + ["HMMWV_TOW"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["HMMWV_Avenger"];
_u = _u + ["HMMWV_Avenger"];
_u = _u + ["USMC_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["HMMWV_Avenger"];
_u = _u + ["HMMWV_Avenger"];
_u = _u + ["HMMWV_Avenger"];
_u = _u + ["HMMWV_Avenger"];
_u = _u + ["USMC_Soldier_AA"];
_u = _u + ["USMC_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["LAV25"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["LAV25"];
_u = _u + ["LAV25"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["USMC_Soldier_SL"];
_u = _u + ["AAV"];
_u = _u + ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_u = _u + ["USMC_Soldier"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["AAV"];
_u = _u + ["AAV"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["M1A1"];
_u = _u + ["M1A1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_u = _u + ["M1A1"];
_u = _u + ["M1A1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";