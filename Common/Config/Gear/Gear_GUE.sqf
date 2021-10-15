_faction = "GUE";

_u = [];//--- Magazine
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level

//--- Magazines
_u = _u + ["5x_22_LR_17_HMR"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [2];
_z = _z + [0];

_u = _u + ["8Rnd_9x18_Makarov"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [2];
_z = _z + [0];

_u = _u + ["8Rnd_9x18_MakarovSD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [3];
_z = _z + [1];

_u = _u + ["10Rnd_762x54_SVD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];

_u = _u + ["30Rnd_545x39_AK"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];

_u = _u + ["30Rnd_545x39_AKSD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [2];

_u = _u + ["30Rnd_762x39_AK47"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];

_u = _u + ["75Rnd_545x39_RPK"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];

_u = _u + ["100Rnd_762x54_PK"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [0];

_u = _u + ["OG7"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [100];
_z = _z + [2];

_u = _u + ["PG7V"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [50];
_z = _z + [0];

_u = _u + ["PG7VR"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [125];
_z = _z + [2];

_u = _u + ["PG7VL"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [75];
_z = _z + [1];

_u = _u + ["Strela"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [100];
_z = _z + [1];

_u = _u + ["1Rnd_SMOKE_GP25"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];

_u = _u + ["1Rnd_SMOKERED_GP25"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];

_u = _u + ["1Rnd_SMOKEGREEN_GP25"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];

_u = _u + ["1Rnd_SMOKEYELLOW_GP25"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];

[_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Magazines.sqf";

_u = [];//--- Weapon
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level
_m = [];//--- Magazines (-1 = auto, [x,y,z] = forced magazines)

//--- Weapons
_u = _u + ["AK_47_M"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [40];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["AK_47_S"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [50];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["AK_74"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [75];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["AK_74_GL"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [85];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["AKS_74_kobra"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [80];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["AKS_74_pso"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [95];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["AKS_74_U"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [80];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["AKS_74_UN_kobra"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [110];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["AKS_GOLD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [350];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["huntingrifle"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [100];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["PK"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [150];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["RPK_74"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [125];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["SVD"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [150];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["RPG7V"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [90];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["Strela"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [225];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["Makarov"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [0];
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