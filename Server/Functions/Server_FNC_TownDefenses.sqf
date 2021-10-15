/*
	Town defenses Specific Functions.
	 Scope: Server.
*/

/*
	Manage or spawn mortars in a town if needed.
	 Parameters:
		- Town.
		- Side.
*/
WFBE_SE_FNC_ManageTownMortars = {
	Private ["_side", "_sideID", "_town"];

	_town = _this select 0;
	_side = _this select 1;
	
	_sideID = (_side) Call WFBE_CO_FNC_GetSideID;
	_spawned = _town getVariable "wfbe_mortars_spawned";

	if !(isNil "_spawned") then { //--- If previous mortars set exists, remove them if needed.
		{deleteVehicle _x} forEach ((_spawned select 0) + (_spawned select 1));
	};
	
	[_town, _side] Call WFBE_SE_FNC_SpawnTownMortars;
};

/*
	Acquire a shelling position for the mortars.
	 Parameters:
		- Town
		- Side
*/
WFBE_SE_FNC_MortarGetShellPosition = {
	Private ["_defensive_group", "_friendly_id", "_mortars", "_objects", "_objects_tooclose", "_precognition", "_range_max", "_range_min", "_regroup_range", "_scan", "_side", "_target", "_targets", "_targets_force", "_targets_scanned", "_town", "_units", "_units_friendly", "_units_hostile", "_xtot", "_ytot"];
	
	_town = _this select 0;
	_side = _this select 1;
	
	_scan = ["Man","Car","Motorcycle","Tank","Air","Ship","StaticWeapon"];
	
	_mortars = (_town getVariable "wfbe_mortars_spawned") select 0; //--- Retrieve the mortars.
	_xtot = 0; _ytot = 0;
	{_pos = getPos _x; _xtot = _xtot + (_pos select 0); _ytot = _ytot + (_pos select 1);} forEach _mortars;
	_xtot = _xtot / (count _mortars); _ytot = _ytot / (count _mortars);
	
	_objects_tooclose = ([_xtot, _ytot, 0] nearEntities [_scan, missionNamespace getVariable "WFBE_C_TOWNS_MORTARS_RANGE_MIN"]) unitsBelowHeight 5; //--- Get the entities within the mortar min fire range.
	_objects = (_town nearEntities [_scan, missionNamespace getVariable "WFBE_C_TOWNS_MORTARS_RANGE_MAX"]) unitsBelowHeight 5; //--- Get the entities within the max fire range.
	_objects = _objects - _objects_tooclose; //--- Remove the units which are too close of the mortars centroid.

	_units = [_objects, [west, east, resistance]] Call WFBE_CO_FNC_GetUnitsPerSide; //--- Filter the units per side.
	_friendly_id = [west, east, resistance] find _side;
	_units_friendly = _units select _friendly_id;
	_units_hostile = [];
	for '_i' from 0 to 2 do {if (_i != _friendly_id) then {_units_hostile = _units_hostile + (_units select _i)}};
	
	if (count _units_hostile == 0) exitWith {[]}; //--- Don't bother if there is no targets in range.
	
	_defensive_group = missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side];
	_precognition = missionNamespace getVariable "WFBE_C_TOWNS_MORTARS_PRECOGNITION";
	_regroup_range = missionNamespace getVariable "WFBE_C_TOWNS_MORTARS_SCAN";
	_targets = [];
	_targets_scanned = [];
	{
		if !(_x in _targets_scanned) then {
			_near = _x nearEntities [_scan, _regroup_range];
			if ((_side countSide _near) == 0) then {
				if (random 100 <= _precognition || _defensive_group knowsAbout _x >= 1) then {
					[_targets, _near] Call WFBE_CO_FNC_ArrayPush;
					{if !(_x in _targets_scanned) then {[_targets_scanned, _x] Call WFBE_CO_FNC_ArrayPush}} forEach _near;
				};
			};
		};
	} forEach _units_hostile; //--- Retrieve the potential targets.
	
	if (count _targets == 0) exitWith {[]}; //--- Don't bother if there is no targets to fire at.
	
	_targets_force = [];
	for '_i' from 0 to (count _targets)-1 do {{[_targets_force, _i] Call WFBE_CO_FNC_ArrayPush} forEach (_targets select _i)}; //--- The more the targets, the more the chance to target.
	_targets_force = (_targets_force) Call WFBE_CO_FNC_ArrayShuffle; //--- Shuffle the array.
	
	_target = _targets_force select floor(random count _targets_force); //--- Get a random index, this will be our target.
	_target = _targets select _target; //--- Retrieve a unit bunch from our targets.
	_target = _target select floor(random count _target); //--- Retrieve a single unit among the unit array.
	
	getPos _target
};

/*
	Handle the mortar support.
	 Parameters:
		- Town
		- Mortars
*/
WFBE_SE_FNC_MortarSupport = {
	Private ["_interval", "_mortar_lastfired", "_mortars", "_process", "_side", "_town"];
	
	_town = _this select 0;
	_mortars = _this select 1;
	_side = (_town getVariable "sideID") Call WFBE_CO_FNC_GetSideFromID;
	
	_interval = missionNamespace getVariable "WFBE_C_TOWNS_MORTARS_INTERVAL";
	_mortar_lastfired = time - (_interval - (_interval / 8));
	
	_process = true;
	while {_process} do {
		sleep 20;
		
		_process = false;
		{
			if (alive _x) then {if (alive gunner _x) then {if (local gunner _x) then {_process = true}}};
			if (_process) exitWith {};
		} forEach _mortars;
		
		if (time - _mortar_lastfired > _interval && _process) then { //--- Ready to fire, acquire a new target.
			_target = [_town, _side] Call WFBE_SE_FNC_MortarGetShellPosition; //--- Attempt to acquire a target for the mortars.
			if (count _target > 0) then {
				_mortar_lastfired = time;
				{if (alive _x) then {if (alive gunner _x && !someAmmo _x) then {if (local gunner _x) then {[_x, _side] Call RearmVehicle}}}} forEach _mortars; //--- Rearm the mortars before firing if needed.
				[_mortars, _target, _side] Call WFBE_SE_FNC_MortarRequestFireMission; //--- Request a fire mission.
				["INFORMATION", Format ["WFBE_SE_FNC_MortarSupport : [%1] [%2] Mortars are now firing on target [%3] [%4].", _town, _side, _target, typeOf _target]] Call WFBE_CO_FNC_LogContent;
			};
		};
	};
};

/*
	Request a fire mission from the mortars.
	 Parameters:
		- Mortars
		- Position
		- Side
*/
WFBE_SE_FNC_MortarRequestFireMission = {
	Private ["_mortars", "_position", "_side", "_splash_range"];
	
	_mortars = _this select 0;
	_position = _this select 1;
	_side = _this select 2;
	
	_splash_range = missionNamespace getVariable "WFBE_C_TOWNS_MORTARS_SPLASH_RANGE";
	
	{if (alive _x) then {if (alive gunner _x) then {if (local gunner _x) then {[_x, _position, _side, _splash_range] Spawn WFBE_CO_FNC_FireArtillery}}}} forEach _mortars;
};

/*
	Spawn mortars in a town.
	 Parameters:
		- Town.
		- Side.
*/
WFBE_SE_FNC_SpawnTownMortars = {
	Private ["_index", "_mortar", "_position", "_set", "_side", "_town"];

	_town = _this select 0;
	_side = _this select 1;

	_mortar = missionNamespace getVariable Format["WFBE_%1DEFENSES_MORTAR", _side];

	if (isNil '_mortar') exitWith {};
	if (count _mortar == 0) exitWith {};

	//--- Get a spawn position.
	_position = _town getVariable "wfbe_town_mortars";
	_position = _position select floor(random count _position);
	_mortar = _mortar select floor (random count _mortar);
	_direction = direction _position;

	//--- Generate a random setup depending on town SV, tbd: make better mortar base !
	_set = [];
	if ((_town getVariable "maxSupplyValue") >= 80) then {
		_set = [[_mortar,[0,0,0]], [_mortar,[-5,-5,0]], [_mortar,[5,-5,0]]];
	} else {
		_set = [[_mortar,[-3,0,0]], [_mortar,[3,0,0]]];
	};
	
	_mortars = [[],[]]; //--- First is mortar, second are statics (walls..).
	{
		_type = _x select 0;
		_worldposition = _x select 1;

		_created = createVehicle [_type, [0,0,0], [], 0, "NONE"];
		_toWorld = _position modelToWorld _worldposition;
		_toWorld set [2,0];

		_created setDir _direction;
		_created setPos _toWorld;
		_created lock true;
		
		_index = if (_type == _mortar) then {0} else {1};
		[_mortars select _index, _created] Call WFBE_CO_FNC_ArrayPush;
	} forEach _set;
	
	_town setVariable ["wfbe_mortars_spawned", _mortars];
};