Private ["_lock","_vehicle"];

_vehicle = _this select 0;

_lock = if (locked _vehicle) then {false} else {true};

_vehicle lock _lock;