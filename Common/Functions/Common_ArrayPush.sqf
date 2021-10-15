/*
	Array Push function.
	 Parameters:
		- Array.
		- Value.
*/

Private ["_array","_value"];

_array = _this select 0;
_value = _this select 1;

_array set [count(_array), _value];
_array