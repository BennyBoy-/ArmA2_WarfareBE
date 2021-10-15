/*
	Server receives PVF Here.
	 Parameters:
		- Server PVF
*/

Private ["_parameters","_publicVar","_script"];

_publicVar = _this;

_script = _publicVar select 0;
_parameters = if (count _publicVar > 1) then {_publicVar select 1} else {[]};

_parameters Spawn (Call Compile _script);