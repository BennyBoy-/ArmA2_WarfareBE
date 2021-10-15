Private ['_aiTeamTemplateRequires','_aiTeamTemplateName','_aiTeamTemplates','_aiTeamTypes','_aiTeamUpgrades','_return','_side','_u'];

_side = _this;

//--- Overall Dump.
_return = ["East", "RU", ["RU_Pchela1TSquadron","RU_Ka52Squadron"]] Call Compile preprocessFile "Common\Config\Core_Squads\Squads_GetFactionGroups.sqf";
_aiTeamTemplates = _return select 0;
_aiTeamTemplateName = _return select 1;
_aiTeamTemplateRequires = _return select 2;
_aiTeamTypes = _return select 3;
_aiTeamUpgrades = _return select 4;

//--- Custom Groups.
_u		= ["2S6M_Tunguska"];
_u = _u + ["2S6M_Tunguska"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Anti Air Platoon"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,3,0]];

_u		= ["T72_RU"];
_u = _u + ["T72_RU"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank Platoon (Light)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,1,0]];

_u		= ["Mi17_Ins"];
_u = _u + ["MVD_Soldier_TL"];
_u = _u + ["MVD_Soldier_GL"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_Marksman"];
_u = _u + ["MVD_Soldier_AT"];
_u = _u + ["MVD_Soldier_AT"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Infantry Mi-8 Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[2,0,0,0]];

_u		= ["Mi17_rockets_RU"];
_u = _u + ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Infantry Mi-8 Squadron (Rockets)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[2,0,0,1]];

if ((missionNamespace getVariable "WFBE_C_UNITS_KAMOV_DISABLED") == 0) then {
	_u		= ["Ka52Black"];
	_u = _u + ["Ka52"];

	_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Ka-52 Squadron"];
	_aiTeamTemplates = _aiTeamTemplates + [_u];
	_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
	_aiTeamTypes = _aiTeamTypes + [3];
	_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,3]];
};

missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATES", _side], _aiTeamTemplates];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEREQUIRES", _side], _aiTeamTemplateRequires];
missionNamespace setVariable [Format["WFBE_%1AITEAMTYPES", _side], _aiTeamTypes];
missionNamespace setVariable [Format["WFBE_%1AITEAMUPGRADES", _side], _aiTeamUpgrades];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEDESCRIPTIONS", _side], _aiTeamTemplateName];