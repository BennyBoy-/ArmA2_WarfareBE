/*
	Sanitize the gear by removing undefined stuff.
	 Parameters:
		- Content
		- Type
*/

Private ["_content", "_type"];

_content = _this select 0;
_type = _this select 1;

_sanitized = +_content;
switch (_type) do {
	case "magazines": {
		{if (isNil {missionNamespace getVariable Format["Mag_%1", _x]}) then {_sanitized = _sanitized - [_x]}} forEach _content;
	};
	case "weapons": {
		{if (isNil {missionNamespace getVariable _x}) then {_sanitized = _sanitized - [_x]}} forEach _content;
	};
};

_sanitized