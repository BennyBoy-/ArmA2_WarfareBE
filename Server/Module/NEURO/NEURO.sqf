/* 
 * 		Neuro Taxi System by Benny. 
 * Use the missionNamspace to set a condition for boarding the vehicle (NEURO_TAXI_CONDITION), _x define the vehicle.
 * i.e: missionNamespace setVariable["NEURO_TAXI_CONDITION", "isNil {_x getVariable 'WFBE_Taxi_Prohib'}"];
 */

NEURO_BE_ClearVehiclePositions = {
	{
		if (!alive _x || _x distance _this > 900) then {unassignVehicle _x};
	} forEach (assignedCargo _this);
	
	{
		if !(isNull _x) then {if (!alive _x || _x distance _this > 900) then {unassignVehicle _x}};
	} forEach [assignedDriver _this, assignedGunner _this, assignedCommander _this];
};
 
NEURO_BE_GetVehicleEmptiness = {
	Private ["_cargo","_commander","_driver","_gunner","_hasCommander","_hasDriver","_hasGunner","_isFull","_isEmpty","_vehicleCargo"];
	//--- Update the ETAT.
	(_this) Call NEURO_BE_ClearVehiclePositions;
	
	_driver = _this emptyPositions "driver";
	_gunner = _this emptyPositions "gunner";
	_commander = _this emptyPositions "commander";
	_cargo = _this emptyPositions "cargo";
	
	_hasDriver = false;
	_hasGunner = false;
	_hasCommander = false;
	_vehicleCargo = count (assignedCargo _this);
	if !(isNull(assignedDriver _this)) then {_driver = 0;_hasDriver = true;};
	if !(isNull(assignedGunner _this)) then {_gunner = 0;_hasGunner = true;};
	if !(isNull(assignedCommander _this)) then {_commander = 0;_hasCommander = true;};
	
	_cargo = abs (_cargo - _vehicleCargo);

	_isFull = if (_driver == 0 && _gunner == 0 && _commander == 0 && _cargo == 0) then {true} else {false};
	_isEmpty = if (!_hasDriver && !_hasGunner && !_hasCommander) then {true} else {false};
	
	[_driver,_gunner,_commander,_cargo,_isFull,_isEmpty]
};

NEURO_BE_GetNonAssignedUnits = {
	Private ["_list"];
	_list = [];
	
	{
		if (isNull(assignedVehicle _x)) then {_list = _list + [_x]};
	} forEach _this;
	
	_list
};

NEURO_BE_GetSuitableVehicles = {
	Private ["_list","_nearest","_process","_side"];
	_nearest = _this select 0;
	_side = _this select 1;
	
	_list = [];
	{
		if (canMove _x && fuel _x > 0.2 && (side _x) in [civilian, _side]) then {
			_process = true;
			if !(isNull(driver _x)) then {if (!local(driver _x) || (side driver _x) != _side) then {_process = false}};
			if (!(isNull(assignedDriver _x)) && _process) then {if (!local(assignedDriver _x) || (side assignedDriver _x) != _side) then {_process = false}};
			
			if (_process) then {
				if (Call Compile (missionNamespace getVariable 'NEURO_TAXI_CONDITION')) then {
					_list = _list + [_x];
				};
			};
			
		};
	} forEach _nearest;
	
	_list
};

NEURO_BE_GetGroupWPDestination = {
	Private ["_destination"];
	_destination = [0,0,0];
	
	if (isNull _this) exitWith {_destination};
	
	if (count waypoints _this > 0) then {
		_destination = waypointPosition [_this, currentWaypoint _this];
	};
	
	_destination
};

NEURO_BE_GetVehicleZOffset = {
	(getPos _this) select 2
};

NEURO_BE_HandleArrivalCargo = {
	Private ["_vehicle"];
	_vehicle = vehicle _this;
	
	//--- Paradrop or unload.
	if ((_vehicle) Call NEURO_BE_GetVehicleZOffset > 25) then {
		{
			if !(surfaceIsWater(getPos _vehicle)) then {
				if (alive _x && _vehicle == vehicle _x && local _x) then {						
					unassignVehicle _x;
					[_x] orderGetIn false;
					_x action ["EJECT", _vehicle];
					sleep 1.2;
				};
			} else {
				unassignVehicle _x;
				[_x] orderGetIn false;
			};
		} forEach (assignedCargo _vehicle);
	} else {
		{
			if (alive _x && _vehicle == vehicle _x && local _x) then {
				unassignVehicle _x;
				[_x] orderGetIn false;
				sleep 0.4;
			};
		} forEach (assignedCargo _vehicle);
	};
};

NEURO_BE_UpdateTeamDestination = {
	Private ["_assignedVehicle","_destinationDriver","_forceOut","_group","_groupDestination"];
	_group = _this;
	_forceOut = [];
	
	_groupDestination = (_group) Call NEURO_BE_GetGroupWPDestination;
	
	{
		_assignedVehicle = assignedVehicle _x;
		
		if !(isNull _assignedVehicle) then {
			if (isNull(driver _assignedVehicle) && isNull(assignedDriver _assignedVehicle) || isPlayer(_assignedVehicle)) then {
				_forceOut = _forceOut + [_x];
			} else {
				_destinationDriver = (group (driver _assignedVehicle)) Call NEURO_BE_GetGroupWPDestination;
				if (_groupDestination distance _destinationDriver > 600) then {
					if (_x in (assignedCargo _assignedVehicle)) then {_forceOut = _forceOut + [_x]};
				};
			};
		};
	} forEach (units _group);

	if (count _forceOut > 0) then {
		{unassignVehicle _x} forEach _forceOut;
		_forceOut orderGetIn false;
	};
};

NEURO_BE_AssignToVehicle = {
	Private ["_assignedUnits","_cargoEmptiness","_emptiness","_group","_isEmpty","_isFull","_isPlayerVehicle","_near","_position","_process","_range","_unit","_units","_vehicle"];
	_group = _this select 0;
	_position = _this select 1;
	_range = 500;
	
	_groupUnits = units _group;
	_units = (_groupUnits) Call NEURO_BE_GetNonAssignedUnits;
	if (count _units == 0) exitWith {};
	
	_near = _position nearEntities [["Motorcycle","Car","Tank","Helicopter"], _range];
	_near = [_near, side _group] Call NEURO_BE_GetSuitableVehicles;
	if (count _near == 0) exitWith {};
	
	_assignedUnits = [];
	
	{
		_vehicle = _x;
		_emptiness = (_vehicle) Call NEURO_BE_GetVehicleEmptiness;
		_cargoEmptiness = _emptiness select 3;
		
		_isFull = if (_emptiness select 4) then {true} else {false};
		_isEmpty = if (_emptiness select 5) then {true} else {false};
		_isPlayerVehicle = if (isPlayer(_vehicle)) then {true} else {false};
		
		//--- Vehicle is not full.
		if (!_isFull && !_isPlayerVehicle) then {
			//--- Driver, Gunner, Commander.
			if (_isEmpty || (effectiveCommander _vehicle) in _groupUnits) then {
				//--- Driver
				if ((_emptiness select 0) > 0) then {
					(_units select 0) assignAsDriver _vehicle;
					_assignedUnits = _assignedUnits + [_units select 0];
					_units = _units - [_units select 0];
				};
				
				//--- Gunner.
				if ((_emptiness select 1) > 0 && count _units > 0) then {
					(_units select 0) assignAsGunner _vehicle;
					_assignedUnits = _assignedUnits + [_units select 0];
					_units = _units - [_units select 0];
				};
				
				//--- Commander.
				if ((_emptiness select 2) > 0 && count _units > 0) then {
					(_units select 0) assignAsCommander _vehicle;
					_assignedUnits = _assignedUnits + [_units select 0];
					_units = _units - [_units select 0];
				};
			};
		
			//--- Cargo.
			if (_cargoEmptiness > 0 && count _units > 0) then {
				_count = count _units;
				
				//--- Make sure that the vehicle is going around the squad's destination.
				_process = true;
				if !(isNull(driver _vehicle)) then {
					_driverMoveTo = (group driver _vehicle) Call NEURO_BE_GetGroupWPDestination;
					_distance = _driverMoveTo distance ((_group) Call NEURO_BE_GetGroupWPDestination);
					
					if (_distance > 600 || (_driverMoveTo select 0 == 0 && _driverMoveTo select 1 == 0)) then {_process = false};
				};
				
				//--- All condition are met, the ai may be able to board the vehicle.
				if (_process) then {
					for '_i' from 0 to _count-1 do {
						_unit = _units select _i;
					
						if (_unit distance _vehicle < 500) then {
							_unit assignAsCargo _vehicle;
							_assignedUnits = _assignedUnits + [_unit];
							_cargoEmptiness = _cargoEmptiness - 1;
						};
						
						if (_cargoEmptiness <= 0) exitWith {};
					};
				};
			};
			
			_units = _units - _assignedUnits;
		};
		
		if (count _units == 0) exitWith {};
	} forEach _near;
	
	if (count _assignedUnits > 0) then {_assignedUnits orderGetIn true};
};