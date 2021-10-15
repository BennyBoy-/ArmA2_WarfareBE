Private ["_income","_incomeCoef","_incomeSystem","_side"];
_side = (_this) Call GetSideID;

_income = 0;
_incomeSystem = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM";
_incomeCoef = 0;
if (_incomeSystem == 3) then {_incomeCoef = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_COEF"};

{
	if ((_x getVariable "sideID") == _side) then {
		switch (_incomeSystem) do {
			case 3: {_income = _income + ((_x getVariable "supplyValue")*_incomeCoef)};
			default {_income = _income + (_x getVariable "supplyValue")};
		};
	};
} forEach towns;

_income