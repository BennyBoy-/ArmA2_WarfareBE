Private ['_config','_faction','_group','_kind','_side','_type'];
_side = _this select 0;
_faction = _this select 1;
_kind = _this select 2;
_type = _this select 3;

_config = configFile >> "CfgGroups" >> _side >> _faction >> _kind >> _type;
_group = [];

if (isClass _config) then {
	for "_j" from 0 to ((count _config) - 1) do {
		private ["_mclass"];
		_mclass = _config select _j;
		
		if (isClass (_mclass)) then {
			_group = _group + [getText(_mclass >> "vehicle")];
		};
	};
} else {
	["ERROR", Format ["Common_GetGroupFromConfig.sqf: Entry (configFile >> 'CfgGroups' >> '%3' >> '%4' >> '%5' >> '%6') is not a valid group config.", _side,_faction,_kind,_typ]] Call WFBE_CO_FNC_LogContent;
};

_group