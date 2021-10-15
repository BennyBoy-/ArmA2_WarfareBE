Private ["_act","_caller","_vehicle"];

_vehicle = _this select 0;
_caller = _this select 1;
_act = _this select 2;

_caller action ["EJECT",_vehicle];
_caller setVelocity [0,0,0];
[_caller] Exec "ca\air2\Halo\data\Scripts\HALO_getout.sqs";