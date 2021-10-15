Private ["_belong","_cpt","_def_content","_div","_faction","_n","_name","_o","_p","_processed","_set","_type","_u","_z"];

_faction = _this select 0;
_u = _this select 1;
_p = _this select 2;
_n = _this select 3;
_o = _this select 4;
_z = _this select 5;

_cpt = 0;
for '_i' from 0 to count(_u)-1 do {
	if (isClass(configFile >> 'CfgVehicles' >> (_u select _i))) then {
		_processed = false;
		if (getNumber(configFile >> 'CfgVehicles' >> (_u select _i) >> "isbackpack") == 1 && !isClass(configFile >> 'CfgVehicles' >> (_u select _i) >> "assembleInfo")) then {
			_cpt = _cpt + 1;
			_processed = true;
			if (isNil {missionNamespace getVariable (_u select _i)}) then {
				_name = getText(configFile >> 'CfgVehicles' >> (_u select _i) >> "displayName");
				if ((_n select _i) != '') then {
					_tag = toArray(_n select _i);
					if (toString[_tag select 0] == "+") then {_tag set[0,20];_name = _name + toString(_tag)};
				};
				
				_set = [];
				_set set [0, if ((_p select _i) == '') then {getText(configFile >> 'CfgVehicles' >> (_u select _i) >> "picture")} else {_p select _i}];
				_set set [1, _name];
				_set set [2, _o select _i];
				_set set [3, _z select _i];
				_set set [4, 200];
				
				_def_content = [[[],[]],[[],[]]];
				if (isClass(configFile >> 'CfgVehicles' >> (_u select _i) >> 'TransportWeapons')) then {
					Private ["_cname","_get","_root"];
					for '_j' from 0 to count(configFile >> 'CfgVehicles' >> (_u select _i) >> "TransportWeapons")-1 do {
						_root = (configFile >> 'CfgVehicles' >> (_u select _i) >> 'TransportWeapons') select _j;
						_cname = getText(_root >> 'weapon');
						_get = missionNamespace getVariable _cname;
						
						if !(isNil '_get') then {
							[(_def_content select 0) select 0, _cname] Call WFBE_CO_FNC_ArrayPush;
							[(_def_content select 0) select 1, getNumber(_root >> 'count')] Call WFBE_CO_FNC_ArrayPush;
						} else {
							["ERROR", Format["Config_Backpack.sqf : [%1] Backpack [%2] Weapon [%3] could not be found in the gear file.",_faction,_u select _i,_cname], 3] Call WFBE_CO_FNC_LogContent;
						};
					};
				};
				if (isClass(configFile >> 'CfgVehicles' >> (_u select _i) >> 'TransportMagazines')) then {
					Private ["_cname","_count","_get","_root"];
					for '_j' from 0 to count(configFile >> 'CfgVehicles' >> (_u select _i) >> "TransportMagazines")-1 do {
						_root = (configFile >> 'CfgVehicles' >> (_u select _i) >> 'TransportMagazines') select _j;
						_cname = getText(_root >> 'magazine');
						_get = missionNamespace getVariable Format["Mag_%1",_cname];
						
						if !(isNil '_get') then {
							[(_def_content select 1) select 0, _cname] Call WFBE_CO_FNC_ArrayPush;
							[(_def_content select 1) select 1, getNumber(_root >> 'count')] Call WFBE_CO_FNC_ArrayPush;
						} else {
							["ERROR", Format["Config_Backpack.sqf : [%1] Backpack [%2] Ammunition [%3] could not be found in the gear file.",_faction,_u select _i,_cname], 3] Call WFBE_CO_FNC_LogContent;
						};
					};
				};
				
				_set set [5, _def_content];
				missionNamespace setVariable [Format["%1",_u select _i], _set];
				["INITIALIZATION", Format["Config_Backpack.sqf : [%1] Backpack [%2] defined",_faction,_u select _i]] Call WFBE_CO_FNC_LogContent;
			} else {
				["TRIVIAL", Format["Config_Backpack.sqf : [%1] Backpack [%2] has been skipped since it's already defined",_faction,_u select _i]] Call WFBE_CO_FNC_LogContent;
			};
		};
		if (isClass(configFile >> 'CfgVehicles' >> (_u select _i) >> "assembleInfo")) then {
			_cpt = _cpt + 1;
			_processed = true;
			if (isNil {missionNamespace getVariable (_u select _i)}) then {
				_set = [];
				_set set [0, if ((_p select _i) == '') then {getText(configFile >> 'CfgVehicles' >> (_u select _i) >> "picture")} else {_p select _i}];
				_set set [1, if ((_n select _i) == '') then {getText(configFile >> 'CfgVehicles' >> (_u select _i) >> "displayName")} else {_n select _i}];
				_set set [2, _o select _i];
				_set set [3, _z select _i];
				_set set [4, 201];
				
				missionNamespace setVariable [Format["%1",_u select _i], _set];
				["INITIALIZATION", Format["Config_Backpack.sqf : [%1] Backpack [%2] defined",_faction,_u select _i]] Call WFBE_CO_FNC_LogContent;
			} else {
				["TRIVIAL", Format["Config_Backpack.sqf : [%1] Bag [%2] has been skipped since it's already defined",_faction,_u select _i]] Call WFBE_CO_FNC_LogContent;
			};
		};
		if !(_processed) then {["ERROR", Format["Config_Backpack.sqf : [%1] Entitie [%2] is not a valid Backpack",_faction,_u select _i], 3] Call WFBE_CO_FNC_LogContent;};
	} else {
		["ERROR", Format["Config_Backpack.sqf : [%1] Backpack [%2] is not a valid class within <CfgMagazines>",_faction,_u select _i], 3] Call WFBE_CO_FNC_LogContent;
	};
};

["INFORMATION", Format ["Config_Backpack.sqf : [%1] [%2/%3] Backpacks were defined.", _faction, _cpt, count _u], 1] Call WFBE_CO_FNC_LogContent;