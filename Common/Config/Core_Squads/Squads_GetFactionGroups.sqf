/* Use this file if you wish to set quickly a faction's groups */
Private ['_aiTeamTemplates','_aiTeamTemplateName','_aiTeamTemplateRequires','_aiTeamTypes','_aiTeamUpgrades','_blacklist','_cfgFaction','_faction','_side'];

_side = _this select 0;
_faction = _this select 1;
_blacklist = if (count _this > 2) then {_this select 2} else {[]};

_cfgFaction = configFile >> "CfgGroups" >> _side >> _faction;

if !(isClass _cfgFaction) exitWith {["ERROR", Format ["Squads_SetFactionGroups.sqf: Entry (configFile >> '%3' >> '%4') is not a valid group config.", _side,_faction]] Call WFBE_CO_FNC_LogContent};

_aiTeamTemplates = [];
_aiTeamTemplateName = [];
_aiTeamTemplateRequires = [];
_aiTeamTypes =  [];
_aiTeamUpgrades = [];

//--- Iterate through the faction's config and grab the group along with it's properties.
for "_i" from 0 to ((count _cfgFaction) - 1) do {
	Private ["_classKind"];
	_classKind = _cfgFaction select _i;
	
	if (isClass _classKind) then {
		Private ["_nameKind"];
		_nameKind = getText (_classKind >> "name");
		for "_j" from 0 to ((count _classKind) - 1) do {
			Private ["_classType"];
			_classType = _classKind select _j;
			if (isClass _classType && !(configName(_classType) in _blacklist)) then {
				Private ["_factoryPool","_groupUnits","_levels","_nameGroup","_require"];
				_nameGroup = getText (_classType >> "name");
				_aiTeamTemplateName = _aiTeamTemplateName + [Format ["%1 - %2",_nameKind,_nameGroup]];
				_groupUnits = [];
				_require = [false, false, false, false];
				_levels = [0,0,0,0];
					
				for "_k" from 0 to ((count _classType) - 1) do {
					Private ["_classUnit"];
					_classUnit = _classType select _k;
					
					if (isClass _classUnit) then {
						Private ["_unit"];
						_unit = getText (_classUnit >> "vehicle");
						_groupUnits = _groupUnits + [_unit];
						
						_get = missionNamespace getVariable _unit;
						if !(isNil "_get") then {
							_type = _get select QUERYUNITFACTORY;
							_upgrade = _get select QUERYUNITUPGRADE;
							
							_require set [_type, true];
							_levels set [_type, _upgrade];
						} else {
							["ERROR", Format ["Squads_SetFactionGroups.sqf: Unit [%1] is not defined in the Core files.", _unit]] Call WFBE_CO_FNC_LogContent;
							/* TODO, Attempt to define*/
						};
					};
				};
				
				_factoryPool = switch (configName _classKind) do {
					case "Infantry": {0};
					case "Motorized": {1};
					case "Mechanized": {2};
					case "Armor": {2};
					case "Air": {3};
					default {0};
				};
				_aiTeamTypes = _aiTeamTypes + [_factoryPool];
				_aiTeamUpgrades = _aiTeamUpgrades + [_levels];
				_aiTeamTemplateRequires = _aiTeamTemplateRequires + [_require];
				_aiTeamTemplates = _aiTeamTemplates + [_groupUnits];
			};
		};
	};
};

[_aiTeamTemplates, _aiTeamTemplateName, _aiTeamTemplateRequires, _aiTeamTypes, _aiTeamUpgrades]