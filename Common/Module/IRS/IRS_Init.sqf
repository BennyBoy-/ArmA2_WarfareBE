/*
	IR Smoke system.
*/

WFBE_CO_MOD_IRS_CreateSmoke = Compile preprocessFileLineNumbers "Common\Module\IRS\IRS_CreateSmoke.sqf";
WFBE_CO_MOD_IRS_DeploySmoke = Compile preprocessFileLineNumbers "Common\Module\IRS\IRS_DeploySmoke.sqf";
WFBE_CO_MOD_IRS_HandleMissile = Compile preprocessFileLineNumbers "Common\Module\IRS\IRS_HandleMissile.sqf";
WFBE_CO_MOD_IRS_OnIncomingMissile = Compile preprocessFileLineNumbers "Common\Module\IRS\IRS_OnIncomingMissile.sqf";

missionNamespace setVariable ['WFBE_IRS_AREA_OPERATING', 35]; //--- IR Smoke will operate only if the vehicle is within x meters of a SmokeLauncher grenade.
missionNamespace setVariable ['WFBE_IRS_AUTO_DETECT_RANGE', 200]; //--- IR Smoke missile smoke detection.
missionNamespace setVariable ['WFBE_IRS_FLARE_DELAY', 60];
missionNamespace setVariable ['WFBE_IRS_MISSILE_CHECK_RANGE', 200]; //--- IR Smoke actions will be checked when the missile enter that range.

//--- Initialize vehicles IRS (Type / Dodge Chance / IR Smoke deploy count).
_u =      [["AAV", 40, 2]];
_u = _u + [["BAF_FV510_W", 60, 3]];
_u = _u + [["BAF_FV510_D", 60, 3]];
_u = _u + [["BMP2_CDF", 40, 2]];
_u = _u + [["BMP2_Gue", 40, 2]];
_u = _u + [["BMP2_INS", 40, 2]];
_u = _u + [["BMP2_TK_EP1", 40, 2]];
_u = _u + [["BMP3", 55, 3]];
_u = _u + [["BTR90", 55, 2]];
_u = _u + [["LAV25", 55, 2]];
_u = _u + [["M1126_ICV_M2_EP1", 50, 1]];
_u = _u + [["M1126_ICV_mk19_EP1", 45, 1]];
_u = _u + [["M1129_MC_EP1", 50, 1]];
_u = _u + [["M1135_ATGMV_EP1", 50, 1]];
_u = _u + [["M1128_MGS_EP1", 50, 1]];
_u = _u + [["M1133_MEV_EP1", 50, 1]];
_u = _u + [["M1A1", 60, 4]];
_u = _u + [["M1A1_US_DES_EP1", 60, 4]];
_u = _u + [["M1A2_TUSK_MG", 65, 4]];
_u = _u + [["M1A2_US_TUSK_MG_EP1", 65, 4]];
_u = _u + [["M2A2_EP1", 55, 3]];
_u = _u + [["M2A3_EP1", 55, 3]];
_u = _u + [["M6_EP1", 60, 3]];
_u = _u + [["T72_CDF", 55, 4]];
_u = _u + [["T72_INS", 55, 4]];
_u = _u + [["T72_Gue", 55, 4]];
_u = _u + [["T72_RU", 55, 4]];
_u = _u + [["T72_TK_EP1", 55, 4]];
_u = _u + [["T90", 70, 4]];

//--- Only define the vehicle if it's defined in the core files and if it has smokes in config. (i.e -> "T90_IRS" = [65, 4].
{
	_type = _x select 0;
	if !(isNil {missionNamespace getVariable _type}) then {
		if (isNumber (configFile >> "CfgVehicles" >> _type >> "smokeLauncherGrenadeCount")) then {
			missionNamespace setVariable [Format["%1_IRS",_type], [_x select 1, _x select 2]];
		};
	};
} forEach _u;