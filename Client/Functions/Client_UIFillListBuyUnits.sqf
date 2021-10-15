Private ['_addin','_c','_currentUpgrades','_filler','_filter','_i','_listBox','_listNames','_u','_value'];
_listNames = _this select 0;
_filler = _this select 1;
_listBox = _this select 2;
_value = _this select 3;
_u = 0;
_i = 0;

_currentUpgrades = (sideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
_filter = missionNamespace getVariable Format["WFBE_%1%2CURRENTFACTIONSELECTED",sideJoinedText,_filler];
if (isNil '_filter') then {_filter = "nil"} else {
	if (_filter == 0) then {
		_filter = 'nil';
	} else {
		_filter = ((missionNamespace getVariable Format["WFBE_%1%2FACTIONS",sideJoinedText,_filler]) select _filter);
	};
};

lnbClear _listBox;
{
	_addin = true;
	_c = missionNamespace getVariable _x;
	if (_filter != "nil") then {
		if ((_c select QUERYUNITFACTION) != _filter) then {_addin = false};
	};
	if ((_c select QUERYUNITUPGRADE) <= (_currentUpgrades select _value) && _addin) then {
		lnbAddRow [_listBox,['$'+str (_c select QUERYUNITPRICE),(_c select QUERYUNITLABEL)]];
		lnbSetData [_listBox,[_i,0],_filler];
		lnbSetValue [_listBox,[_i,0],_u];
		_i = _i + 1;
	};
	_u = _u + 1;
} forEach _listNames;

if (_i > 0) then {lnbSetCurSelRow [_listBox,0]} else {lnbSetCurSelRow [_listBox,-1]};