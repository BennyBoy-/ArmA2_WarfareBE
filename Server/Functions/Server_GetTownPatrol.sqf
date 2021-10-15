/*
	Return a patrol team of a town.
	 Parameters:
		- Town Entity.
		- Side.
*/

Private ["_group", "_side", "_sv", "_town", "_type"];

_town = _this select 0;
_side = _this select 1;

_group = [];
_sv = _town getVariable "supplyValue";

_type = switch (true) do {
	case (_sv <= 30): {"LIGHT"};
	case (_sv > 30 && _sv < 60): {"MEDIUM"};
	case (_sv > 60): {"HEAVY"};
};

_available = missionNamespace getVariable Format["WFBE_%1_PATROL_%2", _side, _type];
if (count _available > 0) then {_group = _available select floor(random count _available)};

_group