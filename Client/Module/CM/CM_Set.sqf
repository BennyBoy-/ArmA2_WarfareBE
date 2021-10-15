Private ["_amount","_vehicle"];
_vehicle = _this select 0;

if (isNull _vehicle) exitWith {};
waitUntil {commonInitComplete};
sleep 2;
_amount = if (_vehicle isKindOf "Plane") then {missionNamespace getVariable 'WFBE_C_UNITS_COUNTERMEASURE_PLANES'} else {missionNamespace getVariable 'WFBE_C_UNITS_COUNTERMEASURE_CHOPPERS'};
_vehicle setVariable ["FlareCount", _amount];
_vehicle setVariable ["FlareActive", false];
