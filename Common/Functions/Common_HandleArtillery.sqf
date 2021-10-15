/* Handle artillery Fired EH */
Private ['_ammo','_ammoList','_cannon','_destination','_direction','_dispersion','_distance','_keepShellAlive','_landDestination','_maxRange','_nearLaser','_percent','_projectile','_radius','_shellpos','_side','_smoke','_smokeOnImpact','_velocity','_xcoord','_ycoord'];

_ammo = _this select 0;
_ammoList = _this select 2;

//--- Only Catch allowed ammo.
if (_ammo in _ammoList) then {

	//--- Retrieve the parameters.
	_projectile = _this select 1;
	_destination = _this select 3;
	_velocity = _this select 4;
	_dispersion = _this select 5;
	_cannon = _this select 6;
	_distance = _this select 7;
	_radius = _this select 8;
	_maxRange = _this select 9;
	_side = _this select 10;
	
	_smokeOnImpact = false;

	//--- Randomize Land Area.
	_distance = random (_distance / _maxRange * 100) + random _radius;
	_direction = random 360;

	//--- Default Position.
	_landDestination = [((_destination select 0)+((sin _direction)*_distance))+(random _dispersion)-(random _dispersion),(_destination select 1)+((cos _direction)*_distance)+(random _dispersion)-(random _dispersion),0];
	_keepShellAlive = true;
	
	//--- SADARM Rounds.
	if (_ammo in (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_AMMO_SADARM",_side])) then {
		[_projectile,_landDestination,_velocity] Spawn ARTY_HandleSADARM;
		_keepShellAlive = false; //--- SADARM Destroy the original round.
	};
		
	//--- ILLUM Rounds.
	if (_ammo in (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_AMMO_ILLUMN",_side])) then {
		[_projectile,_landDestination,_velocity] Spawn ARTY_HandleILLUM;
		_keepShellAlive = false; //--- ILLUM Destroy the original round.
	};
	
	//--- Some rounds remove the projectile, make sure that it's not removed or anything.
	if (_keepShellAlive) then {
		//--- LASER Rounds.
		if (_ammo in (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_AMMO_LASER",_side])) then {
			_nearLaser = _destination nearEntities ['LaserTarget',missionNamespace getVariable 'WFBE_C_ARTILLERY_AMMO_RANGE_LASER'];
			if (count _nearLaser > 0) then {
				_nearLaser = getPos ([_destination, _nearLaser] Call WFBE_CO_FNC_GetClosestEntity);
				_landDestination = [(_nearLaser select 0)+(((random _dispersion)-(random _dispersion))/4),(_nearLaser select 1)+(((random _dispersion)-(random _dispersion))/4),0];
			};
		};
		
		//--- Calculate the shell estimated spawn area.
		_distance = _landDestination distance _cannon;
		_percent = ((500 * 100 / _distance) / 100);
		_xcoord = (_landDestination select 0) + _percent * ((_cannon select 0) - (_landDestination select 0));
		_ycoord = (_landDestination select 1) + _percent * ((_cannon select 1) - (_landDestination select 1));
		_shellpos = [_xcoord,_ycoord,1000];
		
		//--- Calculate the direction
		_xcoord = (_landDestination select 0) - (_cannon select 0);
		_ycoord = (_landDestination select 1) - (_cannon select 1);
		_direction =  -(((_ycoord atan2 _xcoord) + 270) % 360);
		if (_direction < 0) then {_direction = _direction + 360};
		
		//--- Track the shell (FX)?
		_smokeOnImpact = if (_ammo in (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_DEPLOY_SMOKE",_side])) then {true} else {false};
		
		//--- Release the shell.
		if !(isNull _projectile) then {
			_projectile setPos _shellpos; 
			_projectile setVelocity [(sin _direction*_velocity),(cos _direction*_velocity),((_velocity * 2.03) * -1)];
			
			if (WF_A2_Vanilla) then {
				//---- MLRS ammo has some weird config problems on vanilla.
				if (_ammo == "R_MLRS" || _ammo == "ARTY_R_227mm_HE_Rocket") then {
					_projectile setPos _landDestination;
				};
			};
		};
	};
	
	//--- Release smoke on an impact if needed.
	if (_smokeOnImpact) then {
		_shellPos = [];
		
		//--- Wait for the last known position.
		while {!isNull _projectile} do {
			_shellPos = getPos _projectile;
			sleep 0.02;
		};
		
		//--- If we have it, release it.
		if (count _shellPos > 0) then {
			_shellPos set [2,0];
			_smoke = "ARTY_SmokeShellWhite" createVehicle _shellPos;
			_smoke setPos _shellPos;
		};
	};
};