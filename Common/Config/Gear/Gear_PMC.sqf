_faction = "PMC";

_u = [];//--- Magazine
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level

//--- Magazines
_u = _u + ["20Rnd_B_AA12_Pellets"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];

_u = _u + ["20Rnd_B_AA12_74Slug"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [1];

_u = _u + ["20Rnd_B_AA12_HE"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [40];
_z = _z + [3];

_u = _u + ["30Rnd_556x45_G36"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [0];

_u = _u + ["30Rnd_556x45_G36SD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [20];
_z = _z + [0];

_u = _u + ["30Rnd_556x45_Stanag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [0];

_u = _u + ["30Rnd_556x45_StanagSD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [20];
_z = _z + [0];

_u = _u + ["100Rnd_556x45_BetaCMag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [30];
_z = _z + [0];

[_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Magazines.sqf";

_u = [];//--- Weapon
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level
_m = [];//--- Magazines (-1 = auto, [x,y,z] = forced magazines)

//--- Weapons
_u = _u + ["AA12_PMC"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [225];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["m8_carbine"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [220];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["m8_carbineGL"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [235];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["m8_compact"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [225];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["m8_SAW"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["m8_sharpshooter"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [270];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["m8_carbine_pmc"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [230];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["m8_compact_pmc"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [235];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["m8_holo_sd"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["m8_tws"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [380];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["m8_tws_sd"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [350];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["ItemCompass"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemGPS"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [25];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemMap"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemRadio"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemWatch"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];
_m = _m + [-1];

[_faction, _u, _p, _n, _o, _z, _m] Call Compile preprocessFile "Common\Config\Config_Weapons.sqf";