Private ["_belong","_cpt","_div","_faction","_is","_m","_magz","_n","_o","_p","_set","_size","_u","_z"];

_faction = _this select 0;
_u = _this select 1;
_p = _this select 2;
_n = _this select 3;
_o = _this select 4;
_z = _this select 5;
_m = _this select 6;

_cpt = 0;
for '_i' from 0 to count(_u)-1 do {
	if (isClass(configFile >> 'CfgWeapons' >> (_u select _i))) then {
		if (isNil {missionNamespace getVariable Format["%1",_u select _i]}) then {
			_set = [];
			_div = 0;
			_belong = -1;
			_size = -1;
			_is = "";
			switch (getNumber(configFile >> 'CfgWeapons' >> (_u select _i) >> "type")) do {
				case 1: {_belong = 0;_size = 10;_is = "Primary"};
				case 2: {_belong = 1;_size = 5;_is = "Pistol"};
				case 4: {_belong = 2;_size = 10;_is = "Launcher"};
				case 5: {_belong = 3;_size = 10;_is = "Primary (Both)"};
				case 4096: {_belong = 4;_size = 1;_is = "Equipment"};
				case 131072: {_belong = 5;_size = 1;_is = "Item"};
			};
			
			if (_belong != -1) then { 
				_magz = [];
				if (typeName(_m select _i) != "ARRAY") then {
					{_magz = _magz + (if (_x == "this") then {getArray(configFile >> 'CfgWeapons' >> (_u select _i) >> 'magazines')} else {getArray(configfile >> "CfgWeapons" >> (_u select _i) >> _x >> "magazines")})} forEach getArray(configFile >> "CfgWeapons" >> (_u select _i) >> "muzzles");
				};
				_set set [0, if ((_p select _i) == '') then {getText(configFile >> 'CfgWeapons' >> (_u select _i) >> "picture")} else {_p select _i}];
				_set set [1, if ((_n select _i) == '') then {getText(configFile >> 'CfgWeapons' >> (_u select _i) >> "displayName")} else {_n select _i}];
				_set set [2, _o select _i];
				_set set [3, _z select _i];
				_set set [4, _belong];
				_set set [5, _size];
				_set set [6, if (typeName(_m select _i) == "ARRAY") then {_m select _i} else {_magz}];
				
				missionNamespace setVariable [Format["%1",_u select _i], _set];
				_cpt = _cpt + 1;
				["INITIALIZATION", Format["Config_Weapons.sqf : [%1] Weapon [%2], Belong to [%3]",_faction,_u select _i,_is]] Call WFBE_CO_FNC_LogContent;
			} else {
				["WARNING", Format["Config_Weapons.sqf : [%1] Weapon [%2] was not defined since it's gear emplacement is unknown (type)",_faction,_u select _i], 2] Call WFBE_CO_FNC_LogContent;
			};
		} else {
			_cpt = _cpt + 1;
			["TRIVIAL", Format["Config_Weapons.sqf : [%1] Weapon [%2] has been skipped since it's already defined",_faction,_u select _i]] Call WFBE_CO_FNC_LogContent;
		};
	} else {
		["ERROR", Format["Config_Weapons.sqf : [%1] Weapon [%2] is not a valid class within <CfgWeapons>",_faction,_u select _i], 3] Call WFBE_CO_FNC_LogContent;
	};
};

["INFORMATION", Format ["Config_Weapons.sqf : [%1] [%2/%3] Entities were defined.", _faction, _cpt, count _u], 1] Call WFBE_CO_FNC_LogContent;