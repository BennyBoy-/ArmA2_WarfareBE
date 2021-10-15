Private ['_aiTeamTemplateRequires','_aiTeamTemplateName','_aiTeamTemplates','_aiTeamTypes','_aiTeamUpgrades','_return','_side','_u'];

_side = _this;

//--- Overall Dump.
_return = ["West", "CDF"] Call Compile preprocessFile "Common\Config\Core_Squads\Squads_GetFactionGroups.sqf";
_aiTeamTemplates = _return select 0;
_aiTeamTemplateName = _return select 1;
_aiTeamTemplateRequires = _return select 2;
_aiTeamTypes = _return select 3;
_aiTeamUpgrades = _return select 4;

//--- Custom Groups.
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - APC Platoon"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,2,0]];

_u		= ["ZSU_CDF"];
_u = _u + ["ZSU_CDF"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - AA Platoon"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,1,0]];

_u		= ["Mi17_CDF"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Spotter"];
_u = _u + ["CDF_Soldier"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Mi-8 Infantry Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,0,0,0]];

missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATES", _side], _aiTeamTemplates];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEREQUIRES", _side], _aiTeamTemplateRequires];
missionNamespace setVariable [Format["WFBE_%1AITEAMTYPES", _side], _aiTeamTypes];
missionNamespace setVariable [Format["WFBE_%1AITEAMUPGRADES", _side], _aiTeamUpgrades];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEDESCRIPTIONS", _side], _aiTeamTemplateName];