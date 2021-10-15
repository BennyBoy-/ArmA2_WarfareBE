/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "RU";

_k = _k + ["Squad"];
_u		= ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Marksman"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_Medic"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["RUS_Commander"];
_u = _u + ["RUS_Soldier1"];
_u = _u + ["RUS_Soldier2"];
_u = _u + ["RUS_Soldier_GL"];
_u = _u + ["RUS_Soldier_Marksman"];
_u = _u + ["RUS_Soldier3"];
_u = _u + ["RUS_Soldier_TL"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["MVD_Soldier_TL"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_AT"];
_u = _u + ["MVD_Soldier_GL"];
_u = _u + ["MVD_Soldier_Sniper"];
_u = _u + ["MVD_Soldier_Marksman"];
_l = _l + [_u];

_k = _k + ["Team"];
_u 		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_GL"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_LAT"];
_l = _l + [_u];

_k = _k + ["Team_HAT"];
_u		= ["RU_Soldier_HAT"];
_u = _u + ["RU_Soldier_HAT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_AT"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["RU_Soldier_Marksman"];
_u = _u + ["RUS_Soldier_Marksman"];
_u = _u + ["RU_Soldier_Marksman"];
_u = _u + ["RUS_Soldier_Marksman"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["RU_Soldier_TL"];
_u = _u + ["GAZ_Vodnik"];
_u = _u + ["GAZ_Vodnik_HMG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_Marksman"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["UAZ_AGS30_RU"];
_u = _u + ["UAZ_AGS30_RU"];
_u = _u + ["UAZ_AGS30_RU"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["GAZ_Vodnik_HMG"];
_u = _u + ["GAZ_Vodnik_HMG"];
_u = _u + ["GAZ_Vodnik"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["BTR90"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["2S6M_Tunguska"];
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
_u		= ["BTR90"];
_u = _u + ["BTR90"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["RU_Soldier_SL"];
_u = _u + ["BTR90"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_GL"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["RU_Soldier_SL"];
_u = _u + ["BMP3"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_GL"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["BMP3"];
_u = _u + ["BMP3"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["T72_RU"];
_u = _u + ["T72_RU"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T90"];
_u = _u + ["T90"];
_u = _u + ["T72_RU"];
_u = _u + ["T72_RU"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T90"];
_u = _u + ["T90"];
_u = _u + ["T90"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";