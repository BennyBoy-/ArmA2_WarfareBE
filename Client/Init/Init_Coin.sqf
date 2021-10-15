Private ['_area','_coin','_coinCategories','_coinItemArray','_curId','_d','_defenseCategories','_defenseCosts','_defenseDescriptions','_defenses','_emptyStructures','_extra','_fix','_i','_indexCategory','_isHQdeployed','_structureCosts','_structureDescriptions','_structures','_updateDefenses','_updateStructures'];
_area = _this select 0;
_isHQdeployed = _this select 1;
_coin = _this select 2;
_extra = "";
if (count _this > 3) then {_extra = _this select 3};

_coin setVariable ["BIS_COIN_areasize", _area];
_coin setVariable ["BIS_COIN_fundsDescription",["$"]];
if (_extra == "") then {
	_coin setVariable ["BIS_COIN_funds",if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {[(sideJoined) Call GetSideSupply, Call GetPlayerFunds]} else {Call GetPlayerFunds}];
	_coin setVariable ["BIS_COIN_fundsDescription",if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {["S ","$ "]} else {["$ "]}];
};

_defenses = [];
_defenseCosts = [];
_defenseDescriptions = [];
_defenseCategories = [];

_structures = [(missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",sideJoinedText]) select 0];
_structureCosts = [(missionNamespace getVariable Format["WFBE_%1STRUCTURECOSTS",sideJoinedText]) select 0];
_structureDescriptions = [(missionNamespace getVariable Format["WFBE_%1STRUCTUREDESCRIPTIONS",sideJoinedText]) select 0];

_i = 0;

_updateStructures = false;
_updateDefenses = false;
_emptyStructures = false;

if (_isHQdeployed && _extra == "") then {_i = 1;_updateStructures = true; _updateDefenses = true};
if (_extra == "REPAIR") then {_updateDefenses = true; _emptyStructures = true;_coin setVariable ["BIS_COIN_funds",Call GetPlayerFunds]};

if (_updateStructures) then {
	_structures = missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",sideJoinedText];
	_structureCosts = missionNamespace getVariable Format["WFBE_%1STRUCTURECOSTS",sideJoinedText];
	_structureDescriptions = missionNamespace getVariable Format["WFBE_%1STRUCTUREDESCRIPTIONS",sideJoinedText];
};

if (_updateDefenses) then {
	_defenses = missionNamespace getVariable Format["WFBE_%1DEFENSENAMES",sideJoinedText];
	{
		_d = missionNamespace getVariable _x;
		if !(isNil '_d') then {
			_defenseCosts = _defenseCosts + [(_d select QUERYUNITPRICE)];
			_defenseDescriptions = _defenseDescriptions + [(_d select QUERYUNITLABEL)];
			_defenseCategories = _defenseCategories + [(_d select QUERYUNITFACTORY)];
		};
	} forEach _defenses;
};

if (_emptyStructures) then {
	_structures = [];
	_structureCosts = [];
	_structureDescriptions = [];
};

_indexCategory=0;
_coinCategories = [];
_coinItemArray = [];
if (count _structures > 0) then {_coinCategories = _coinCategories + [localize "strwfbase"];_indexCategory =_indexCategory +1;};
if (count _defenses > 0) then {if (_extra == "REPAIR") then {_coinCategories = []};_coinCategories = _coinCategories + [localize "str_m04t37_0"] + [localize "STR_WF_Fortification"] + [localize "STR_WF_Strategic"] + [localize "STR_WF_Ammo"]};

if (_isHQdeployed && _i == 1 && _extra == "") then {_coinItemArray = _coinItemArray + [[_structures select 0,0,[0, _structureCosts select 0], (_structureDescriptions select 0) + " " +  localize "strwfhqmobilizeme"]]};
for [{_i=_i}, {_i<count _structures}, {_i = _i+1}] do {
  _coinItemArray = _coinItemArray + [[_structures select _i,0,[0, _structureCosts select _i], (_structureDescriptions select _i)]];
};

_fix = if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {1} else {0};
if (_extra == "REPAIR") then {_coinItemArray = [];_indexCategory=0;_fix = 0};
for '_i' from 0 to count(_defenses)-1 do {
	_curId = _indexCategory;
	switch (_defenseCategories select _i) do {
		case "Fortification": {_curId = _indexCategory + 1};
		case "Strategic": {_curId = _indexCategory + 2};
		case "Ammo": {_curId = _indexCategory + 3};
	};
  _coinItemArray = _coinItemArray + [[_defenses select _i,_curId,[_fix, _defenseCosts select _i], _defenseDescriptions select _i]];    
} forEach _defenses;

_coin setVariable ["BIS_COIN_categories",_coinCategories]; 
_coin setVariable ["BIS_COIN_items",_coinItemArray];

//--- Logic ID
if (isnil "BIS_coin_lastID") then {BIS_coin_lastID = -1};
BIS_coin_lastID = BIS_coin_lastID + 1;
call compile format ["BIS_coin_%1 = _coin; _coin setvehiclevarname 'BIS_coin_%1';",BIS_coin_lastID];

_coin setVariable ["BIS_COIN_ID",BIS_coin_lastID];

//--- Temporary variables
_coin setVariable ["BIS_COIN_params",[]];