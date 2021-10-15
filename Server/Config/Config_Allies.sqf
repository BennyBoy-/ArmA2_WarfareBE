Private ['_alliesTeamCost','_alliesTeamTemplates','_alliesTeamTemplateRequires','_alliesTeamTypes','_d','_f','_get','_p','_u'];
/* ALLIES TEAM TEMPLATES */
/* CDF*/
_alliesTeamTemplates = [];
_alliesTeamTemplateRequires = [];
_alliesTeamTypes = []; //--- 0 Inf, 2 Light, 3 Armor, 4 Air
_alliesTeamCost = [];

_d		= ["Infantry - Infantry Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_Medic"];
_f 		= [true,false,false,false];
_p 		= 0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Infantry - Rifle Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_Marksman"];
_f 		= [true,false,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Infantry - Rifle Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_Marksman"];
_f 		= [true,false,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Infantry - Weapon Squad"];
_u		= ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_Engineer"];
_u = _u + ["CDF_Soldier_Light"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_Spotter"];
_f 		= [true,false,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - Infantry Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["Ural_CDF"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_Medic"];
_f 		= [true,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - Infantry Section"];
_u		= ["UAZ_AGS30_CDF"];
_u = _u + ["UAZ_AGS30_CDF"];
_u = _u + ["UAZ_MG_CDF"];
_f 		= [false,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - AA Patrol"];
_u		= ["Ural_ZU23_CDF"];
_u = _u + ["Ural_ZU23_CDF"];
_f 		= [false,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - BRDM"];
_u		= ["BRDM2_CDF"];
_u = _u + ["BRDM2_ATGM_CDF"];
_f 		= [false,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Mechanized - Rifle Squad"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier"];
_f 		= [true,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Mechanized - BMP2"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_f 		= [false,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Armored - T72"];
_u		= ["T72_CDF"];
_u = _u + ["T72_CDF"];
_u = _u + ["T72_CDF"];
_f 		= [false,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Armored - Mix"];
_u		= ["T72_CDF"];
_u = _u + ["ZSU_CDF"];
_u = _u + ["BMP2_CDF"];
_f 		= [false,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Air - Hinds"];
_u		= ["Mi24_D"];
_u = _u + ["Mi24_D"];
_f 		= [false,false,false,true];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [3];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Airborn Infantry - Hind"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["Mi24_D"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Strela"];
_f 		= [true,false,false,true];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [3];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Airborn Infantry - Mi17"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["Mi17_CDF"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Strela"];
_u = _u + ["CDF_Soldier_Medic"];
_f 		= [true,false,false,true];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [3];
_alliesTeamCost = _alliesTeamCost + [_p];

missionNamespace setVariable ['WFBE_WESTALLIESTEAMTEMPLATES',_alliesTeamTemplates];
missionNamespace setVariable ['WFBE_WESTALLIESTEAMTEMPLATEREQUIRES',_alliesTeamTemplateRequires];
missionNamespace setVariable ['WFBE_WESTALLIESTEAMTYPES',_alliesTeamTypes];
missionNamespace setVariable ['WFBE_WESTALLIESTEAMCOST',_alliesTeamCost];

missionNamespace setVariable ['WFBE_WESTALLIESCREW','CDF_Soldier_Crew'];
missionNamespace setVariable ['WFBE_WESTALLIESSOLDIER','CDF_Soldier'];
missionNamespace setVariable ['WFBE_WESTALLIESPILOT','CDF_Soldier_Pilot'];

/* Insurgent*/
_alliesTeamTemplates = [];
_alliesTeamTemplateRequires = [];
_alliesTeamTypes = []; //--- 0 Inf, 2 Light, 3 Armor, 4 Air
_alliesTeamCost = [];

_d		= ["Infantry - Group"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_GL"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_2"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_1"];
_u = _u + ["Ins_Soldier_Medic"];
_f 		= [true,false,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Infantry - Weapons Group"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_2"];
_f 		= [true,false,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Infantry - Weapon Squad"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_Sapper"];
_u = _u + ["Ins_Soldier_2"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_Sniper"];
_u = _u + ["Ins_Soldier_Sab"];
_f 		= [true,false,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [0];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - Infantry Squad"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Ural_INS"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_GL"];
_u = _u + ["Ins_Soldier_1"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_1"];
_u = _u + ["Ins_Soldier_Medic"];
_f 		= [true,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - Infantry Section"];
_u		= ["UAZ_AGS30_INS"];
_u = _u + ["UAZ_SPG9_INS"];
_u = _u + ["UAZ_MG_INS"];
_f 		= [false,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - AA Patrol"];
_u		= ["Ural_ZU23_INS"];
_u = _u + ["Ural_ZU23_INS"];
_f 		= [false,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Motorized - BRDM"];
_u		= ["BRDM2_INS"];
_u = _u + ["BRDM2_ATGM_INS"];
_f 		= [false,true,false,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [1];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Mechanized - Rifle Squad"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["BMP2_INS"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_Sniper"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_1"];
_f 		= [true,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Mechanized - BMP2"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_f 		= [false,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Armored - T72"];
_u		= ["T72_INS"];
_u = _u + ["T72_INS"];
_u = _u + ["T72_INS"];
_f 		= [false,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Armored - Mix"];
_u		= ["T72_INS"];
_u = _u + ["ZSU_INS"];
_u = _u + ["BMP2_INS"];
_f 		= [false,false,true,false];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [2];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Air - Sukhoi 25"];
_u		= ["Su25_Ins"];
_u = _u + ["Su25_Ins"];
_f 		= [false,false,false,true];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [3];
_alliesTeamCost = _alliesTeamCost + [_p];

_d		= ["Airborn Infantry - Mi17"];
_u		= ["Ins_Soldier_CO"];
_u = _u + ["Mi17_Ins"];
_u = _u + ["Ins_Soldier_MG"];
_u = _u + ["Ins_Soldier_AR"];
_u = _u + ["Ins_Soldier_Sab"];
_u = _u + ["Ins_Soldier_AT"];
_u = _u + ["Ins_Soldier_AA"];
_u = _u + ["Ins_Soldier_Medic"];
_f 		= [true,false,false,true];
_p 		=0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u; 

_alliesTeamTemplates = _alliesTeamTemplates + [_u];
_alliesTeamTemplateRequires = _alliesTeamTemplateRequires + [_f];
_alliesTeamTypes = _alliesTeamTypes + [3];
_alliesTeamCost = _alliesTeamCost + [_p];

missionNamespace setVariable ['WFBE_EASTALLIESTEAMTEMPLATES',_alliesTeamTemplates];
missionNamespace setVariable ['WFBE_EASTALLIESTEAMTEMPLATEREQUIRES',_alliesTeamTemplateRequires];
missionNamespace setVariable ['WFBE_EASTALLIESTEAMTYPES',_alliesTeamTypes];
missionNamespace setVariable ['WFBE_EASTALLIESTEAMCOST',_alliesTeamCost];

missionNamespace setVariable ['WFBE_EASTALLIESCREW','Ins_Soldier_Crew'];
missionNamespace setVariable ['WFBE_EASTALLIESSOLDIER','Ins_Soldier_1'];
missionNamespace setVariable ['WFBE_EASTALLIESPILOT','Ins_Soldier_Pilot'];