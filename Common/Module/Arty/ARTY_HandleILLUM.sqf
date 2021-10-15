/* ILLUM Handler, Battlefield light bringer */
Private ['_deployPos','_destination','_flare','_force','_shell','_targetToHit','_velocity'];
_shell = _this select 0;
_destination = _this select 1;
_velocity = _this select 2;

//--- 1KM Above.
_destination set [2, 1000];

//--- Positionate the shell in the air.
_shell setPos _destination;
_targetToHit = objNull;

//--- Fall straigh.
_shell setVelocity [0,0,-_velocity];

//--- Wait before deploying.
waitUntil {(getPos _shell select 2) < 310};

//--- Retrieve the shell position.
_deployPos = getPos _shell;
deleteVehicle _shell;

//--- Deploy a Flare.
_flare = "ARTY_Flare_Medium" createVehicle _deployPos;
_flare setPos _deployPos;