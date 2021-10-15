/* SADARM Handler, Armor Killer */ 
Private ['_altitude','_barrel','_burst','_chuteModel','_deployPos','_destination','_dir','_dx','_dy','_dz','_force','_hmag','_mag','_parachute','_projectile','_px','_py','_pz','_shell','_targetFound','_targets','_targetToHit','_ux','_uy','_uz','_v1','_velocity','_xoff','_yoff','_zcomp','_zoff'];
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
waitUntil {(getPos _shell select 2) < 600};

//--- Retrieve the shell position.
_deployPos = getPos _shell;
deleteVehicle _shell;

//--- Deploy the model.
_chuteModel = missionNamespace getVariable Format ["WFBE_%1PARACHUTE",sideJoined];
_parachute = _chuteModel createVehicle _deployPos;
_parachute setPos _deployPos;
_barrel = "Barrel4" createVehicle _deployPos;
_barrel attachTo [_parachute,[0,0,0]];

//--- Free Fall Simulation with stabilization.
waitUntil
{
	_altitude = getPos _parachute select 2;
	_v1 = velocity _parachute;
	_parachute setVelocity [_v1 select 0, _v1 select 1, -_velocity];
	(_altitude < 400);
};

//--- Using BIS SADARM Script, improved.
_targetFound = false;

//--- Wait until either way the device find no target and fall bellow 10 meters or it find one or more targets.
waitUntil
{
	_deployPos = getPos _barrel;
	_px = _deployPos select 0;
	_py = _deployPos select 1;
	_pz = _deployPos select 2;

	//--- Awaits for the altitude.
	if (_pz < 275 and _pz > 75) then {
		//--- Retrieve an potential target list.
		_targets = _barrel nearEntities [["Car","Motorcycle","Tank","Ship","StaticCannon"], missionNamespace getVariable "WFBE_C_ARTILLERY_AMMO_RANGE_SADARM"];
		if (count _targets > 0) then {
			_targetToHit = _targets select floor(random count _targets);
			sleep (random 3); 
			_targetFound = true;
		};
	};

	sleep 0.2;

	(_pz < 10 or _targetFound);
};

// Deploy attack munition if a target was found.
if (_targetFound && alive _barrel) then {
	_deployPos = getPos _barrel;
	_px = _deployPos select 0;
	_py = _deployPos select 1;
	_pz = _deployPos select 2;

	deleteVehicle _barrel;
	deleteVehicle _parachute;

	// Create burst.
	_burst = "ARTY_SADARM_BURST" createVehicleLocal [_px, _py, _pz + 5];
	_burst setPos [_px, _py, _pz + 5];
	
	// Create projectile
	_projectile = "ARTY_SADARM_PROJO" createVehicleLocal [_px, _py, _pz + 5];
	_projectile setPos [_px, _py, _pz + 5];

	// Calculate direction
	_xoff = (getPos _targetToHit select 0) - _px;
	_yoff = (getPos _targetToHit select 1) - _py;
	_zoff = - _pz;
	_mag = sqrt(_xoff*_xoff + _yoff*_yoff + _zoff*_zoff);
	_dir = [_xoff/_mag, _yoff/_mag, _zoff/_mag];
	_dx = _dir select 0;
	_dy = _dir select 1;
	_dz = _dir select 2;
	_hmag = sqrt(_dx*_dx + _dy*_dy);
	_zcomp = -_dz/_hmag;
	_ux = _zcomp*_dx;
	_uy = _zcomp*_dy;
	_uz = _hmag;
	
	//--- Positionate the projectile.
	_projectile setVectorDir _dir;
	_projectile setVectorUp [_ux,_uy,_uz];
	_projectile setVelocity [(_dir select 0) * 300, (_dir select 1) * 300, (_dir select 2) * 300];
};

//--- Delete the model.
deleteVehicle _barrel;
if !(isNull _parachute) then {deleteVehicle _parachute};