Private ['_array','_indexExcluded','_newArray','_z'];
_array = _this select 0;
_indexExcluded = _this select 1;

_newArray = [];
for [{_z = 0},{_z < count(_array)},{_z = _z + 1}] do {
	if (_z != _indexExcluded) then {
		_newArray = _newArray + [_array select _z];
	};
};

_newArray