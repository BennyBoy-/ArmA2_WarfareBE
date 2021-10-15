/*
	Parameters Constants Initialization, use the same class name for parameter as variables.
*/

for '_i' from 0 to (count (missionConfigFile >> "Params"))-1 do {
	_paramName = (configName ((missionConfigFile >> "Params") select _i));
	_value = if (isMultiplayer) then {paramsArray select _i} else {getNumber (missionConfigFile >> "Params" >> _paramName >> "default")};
	
	missionNamespace setVariable [_paramName, _value];
};

["INITIALIZATION", "Init_Parameters.sqf: Parameters are defined."] Call WFBE_CO_FNC_LogContent;