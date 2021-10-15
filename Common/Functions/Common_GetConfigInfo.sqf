Private ['_element','_from','_object'];
_object = _this select 0;
_element = _this select 1;
_from = if (count _this > 2) then {_this select 2} else {'CfgVehicles'};

if (typeName _object == 'OBJECT') then {_object = typeOf(_object)};

getText (configFile >> _from >> _object >> _element)