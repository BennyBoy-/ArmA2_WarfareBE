Private ["_actionID","_caller","_index","_lifter","_param","_sorted","_type","_vehicle","_vehicles"];

_lifter = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;
_param = _this select 3;
_vehicle = _param select 0;

_lifter setVariable ["Attached",false];
detach _vehicle;
if ((typeOf _lifter) in Zeta_Special) then {
	_vehicle setPos [(getPos _lifter select 0) - (15 * sin (getDir _vehicle)), (getPos _lifter select 1) - (15 * cos (getDir _vehicle)), getPos _lifter select 2];
};

_vehicle setVelocity (velocity _lifter);
_lifter removeAction _actionID;

sleep 1;

if ((getPos _vehicle) select 2 < 0) then {_vehicle setPos [(getPos _vehicle) select 0,(getPos _vehicle) select 1,0];_vehicle setVelocity [0,0,-0.1]};