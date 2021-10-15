MenuAction = -1;

_type = (missionNamespace getVariable 'WFBE_EASA_Vehicles') find (typeOf (vehicle player));
if (_type == -1) exitWith {["ERROR", Format ["GUI_Menu_EASA.sqf: Player vehicle [%1] was not found within the list.", vehicle player]] Call WFBE_CO_FNC_LogContent};
_data = ((missionNamespace getVariable 'WFBE_EASA_Loadouts') select _type);


_listPrice = [];
_listDesc = [];
_listBox = 23003;
for [{_i = 0},{_i < count(_data)},{_i = _i + 1}] do {
	_cdata = _data select _i;
	for [{_j = 0},{_j < count(_cdata)},{_j = _j + 1}] do {
		if (_j == 0) then {_listPrice = _listPrice + [(_cdata select 0) select 0]};
		if (_j == 1) then {
			_listDesc = _listDesc + [(_cdata select 1) select 0];
			lnbAddRow [_listBox,["$"+str((_cdata select 0) select 0)+".",(_cdata select 1) select 0]]};
		if (_j > 1) then {
		};
	};
};

if (count _listPrice > 0) then {lnbSetCurSelRow [_listBox,0]} else {lnbSetCurSelRow [_listBox,-1]};

while {alive player && dialog} do {
	sleep 0.1;
	
	if (side player != sideJoined) exitWith {closeDialog 0};
	if !(dialog) exitWith {};
	
	//--- Command AI.
	if (MenuAction == 101) then {
		MenuAction = -1;
		_funds = Call GetPlayerFunds;
		
		_iddx = lnbCurSelRow _listBox;
		if (_iddx != -1) then {
			if (_funds > (_listPrice select _iddx)) then {
				[vehicle player, _iddx, true] Call EASA_Equip;
				-(_listPrice select _iddx) Call ChangePlayerFunds;
				hint parseText(Format[localize 'STR_WF_INFO_EASA_Purchase',(_listDesc select _iddx)]);
				closeDialog 0;
			} else {
				hint parseText(Format[localize 'STR_WF_INFO_Funds_Missing',(_listPrice select _iddx) - _funds,_listDesc select _iddx]);
			};
		};
	};
};