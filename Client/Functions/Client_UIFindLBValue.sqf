Private ['_itemsCount','_listbox','_retVal','_value'];
_listbox = _this select 0;
_value = _this select 1;

_itemsCount = lbSize _listbox;

_retVal = -1;
for '_i' from 0 to _itemsCount-1 do {
	if (lbValue[_listbox, _i] == _value) exitWith {_retVal = _i};
};

_retVal