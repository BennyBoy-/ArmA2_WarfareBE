/* 
 * Cipher Module
 * Author: Benny.
 * Description: Alphabetical functions such as sorting and string compare.
 */

 
/* Compare whether string A is greater than string B */
CIPHER_CompareString = {
	Private ["_aisgreater","_stringA","_stringB"];
	_stringA = toArray(_this select 0);
	_stringB = toArray(_this select 1);
	
	_aisgreater = false;
	
	for '_i' from 0 to count(_stringA)-1 do {
		if (_i > count(_stringB)-1) exitWith {_aisgreater = true};
		if ((_stringA select _i) != (_stringB select _i)) exitWith {
			_aisgreater = if ((_stringA select _i) > (_stringB select _i)) then {true} else {false};
		};
	};
	
	_aisgreater;
};

/* Swap Element A with Element B in an array. */
CIPHER_ArraySwap = {
	Private ["_array","_elea","_eleb","_posa","_posb"];
	_array = _this select 0;
	_posa = _this select 1;
	_posb = _this select 2;
	
	_elea = _array select _posa;
	_eleb = _array select _posb;
	
	_array set [_posa, _eleb];
	_array set [_posb, _elea];
	
	_array;
};

/* Reverse an array */
CIPER_ArrayReverse = {
	Private ["_array","_reversed","_u"];
	_array = _this;
	_reversed = [];
	
	_u = 0;
	for '_i' from count(_array)-1 step -1 to 0 do {
		_reversed set [_u, _array select _i];
		_u = _u + 1;
	};
	
	_reversed
};

/* Sort an array by alphabetical order, selection sort. */
CIPHER_SortArray = {
	Private['_auxArray','_list','_min','_reverse'];

	_list = _this select 0;
	_reverse = _this select 1;
	_auxArray = if (count _this > 2) then {+(_this select 2)} else {[]};
	
	if (count _list == 0) exitWith {[]};
	_isString = if (typeName(_list select 0) == typeName "") then {true} else {false};

	for '_i' from 0 to (count _list)-1 do {
		_min = _i;
		
		for '_j' from _i+1 to (count _list)-1 do {
			if (_isString) then {
				if !([_list select _j, _list select _min] Call CIPHER_CompareString) then {_min = _j}
			} else {
				if ((_list select _j) < (_list select _min)) then {_min = _j};
			};
		};
		
		if (_min != _i) then {
			_list = [_list, _i, _min] Call CIPHER_ArraySwap;
			if (count _auxArray > 0) then {_auxArray = [_auxArray, _i, _min] Call CIPHER_ArraySwap};
		};
	};
	
	if (_reverse) then {
		_list = (_list) Call CIPER_ArrayReverse;
		if (count _auxArray > 0) then {_auxArray = (_auxArray) Call CIPER_ArrayReverse};
	};
	
	[_list, _auxArray]
};

/* Sort an array by alphabetical order, selection sort. */
CIPHER_SortArrayIndex = {
	Private['_auxArray','_list','_min','_reverse'];

	_list = _this select 0;
	_auxArray = [];
	for '_i' from 0 to (count _list)-1 do {_auxArray set [_i, _i]};	
	
	if (count _list == 0) exitWith {[]};
	_isString = if (typeName(_list select 0) == typeName "") then {true} else {false};

	for '_i' from 0 to (count _list)-1 do {		
		_min = _i;
		
		for '_j' from _i+1 to (count _list)-1 do {
			if (_isString) then {
				if !([_list select _j, _list select _min] Call CIPHER_CompareString) then {_min = _j}
			} else {
				if ((_list select _j) < (_list select _min)) then {_min = _j};
			};
		};
		
		if (_min != _i) then {
			_list = [_list, _i, _min] Call CIPHER_ArraySwap;
			_auxArray = [_auxArray, _i, _min] Call CIPHER_ArraySwap;
		};
	};
	
	[_list, _auxArray]
};