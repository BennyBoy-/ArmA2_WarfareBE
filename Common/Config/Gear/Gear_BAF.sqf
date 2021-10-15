_faction = "BAF";

_u = [];//--- Magazine
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level

//--- Magazines
_u = _u + ["5Rnd_127x99_AS50"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [20];
_z = _z + [3];

_u = _u + ["5Rnd_86x70_L115A1"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [2];

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

_u = _u + ["200Rnd_556x45_L110A1"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [50];
_z = _z + [1];

_u = _u + ["NLAW"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [2];

_u = _u + ["BAF_L109A1_HE"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];

_u = _u + ["BAF_ied_v1"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];

_u = _u + ["BAF_ied_v2"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [25];
_z = _z + [1];

_u = _u + ["BAF_ied_v3"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [40];
_z = _z + [2];

_u = _u + ["BAF_ied_v4"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [50];
_z = _z + [2];

[_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Magazines.sqf";

_u = [];//--- Weapon
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level
_m = [];//--- Magazines (-1 = auto, [x,y,z] = forced magazines)

//--- Weapons
_u = _u + ["BAF_AS50_scoped"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [380];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["BAF_AS50_TWS"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [580];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["BAF_LRR_scoped"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [290];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["BAF_LRR_scoped_W"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [270];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_RIS_Holo"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [200];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_UGL_Holo"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [215];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_RIS_SUSAT"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [230];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_UGL_SUSAT"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [245];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_RIS_ACOG"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_UGL_ACOG"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [260];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["BAF_L85A2_RIS_CWS"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [385];
_z = _z + [3];
_m = _m + [-1];

_u = _u + ["BAF_L86A2_ACOG"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [270];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["BAF_L110A1_Aim"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [270];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["BAF_L7A2_GPMG"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [240];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["BAF_NLAW_Launcher"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [350];
_z = _z + [2];
_m = _m + [-1];

[_faction, _u, _p, _n, _o, _z, _m] Call Compile preprocessFile "Common\Config\Config_Weapons.sqf";

_u = [];//--- Backpack
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level

//--- Backpacks & Tripods
_u = _u + ["BAF_AssaultPack_ARAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo AR)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_ATAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo AT)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_FAC"];
_p = _p + [''];
_n = _n + ['+(Ammo FAC)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_HAAAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo HAA)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_HATAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo HAT)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_LRRAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo LRR)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_MGAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo MG)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_RifleAmmo"];
_p = _p + [''];
_n = _n + ['+(Ammo)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["BAF_AssaultPack_special"];
_p = _p + [''];
_n = _n + ['+(Ammo Explosives)'];
_o = _o + [70];
_z = _z + [0];

_u = _u + ["Tripod_Bag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [0];

_u = _u + ["BAF_L2A1_ACOG_minitripod_bag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [270];
_z = _z + [1];

_u = _u + ["BAF_L2A1_ACOG_tripod_bag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [350];
_z = _z + [0];

_u = _u + ["BAF_GPMG_Minitripod_D_bag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [300];
_z = _z + [1];

_u = _u + ["BAF_GMG_ACOG_minitripod_bag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [300];
_z = _z + [1];

[_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Backpack.sqf";