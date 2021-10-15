/*
	Parse the content of a template into a pre-parsed system.
	 Parameters:
		- Magazines
*/

Private ["_counts","_item","_items","_magazines"];
_magazines = _this;

if (count _magazines > 0) then {
	_items = _magazines select 0;
	_counts = _magazines select 1;
	_magazines = [];
	for '_j' from 0 to count(_items)-1 do {
		_item = _items select _j;
		for '_k' from 0 to (_counts select _j)-1 do {[_magazines, _item] Call WFBE_CO_FNC_ArrayPush};
	};
} else {
	_magazines = [];
};

_magazines