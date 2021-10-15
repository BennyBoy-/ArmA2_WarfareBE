Private ['_canCreate','_commander','_crews','_driver','_firstDone','_global','_gunner','_list','_lockVehicles','_position','_probability','_side','_sideID','_team','_type','_unit','_units','_vehicle','_vehicles'];

_list = _this select 0;
_position = _this select 1;
_side = _this select 2;
_sideID = (_side) Call GetSideID;
_lockVehicles = _this select 3;
_team = _this select 4;
_global = if (count _this > 5) then {_this select 5} else {true};
_probability = if (count _this > 6) then {_this select 6} else {-1};
_units = [];
_vehicles = [];
_crews = [];
_firstDone = false;

if (isNull _team) then {_team = createGroup _side}; //--- Create a group if none are given as a parameter.

//--- Create.
{
	_canCreate = true;
	if (_probability != -1) then {
		if (random 100 > _probability && _firstDone) then {_canCreate = false};
		_firstDone = true;
	};

	if (_canCreate) then {
		if (_x isKindOf 'Man') then {
			_unit = [_x,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
			_units = _units + [_unit];
		} else {
			_vehicle = [_x, _position, _sideID, 0, _lockVehicles, true, _global, "FORM"] Call WFBE_CO_FNC_CreateVehicle;
			_type = if (_vehicle isKindOf 'Man') then {missionNamespace getVariable Format ['WFBE_%1SOLDIER',_side]} else {if (_vehicle isKindOf 'Air') then {missionNamespace getVariable Format ['WFBE_%1PILOT',_side]} else {missionNamespace getVariable Format ['WFBE_%1CREW',_side]}};
			if (_vehicle emptyPositions 'driver' > 0) then {_driver = [_type,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;_driver moveInDriver _vehicle;_crews = _crews + [_driver]};
			if (_vehicle emptyPositions 'gunner' > 0) then {_gunner = [_type,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;_gunner moveInGunner _vehicle;_crews = _crews + [_gunner]};
			if (_vehicle emptyPositions 'commander' > 0) then {_commander = [_type,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;_commander moveInCommander _vehicle;_crews = _crews + [_commander]};
			_vehicles = _vehicles + [_vehicle];
		};
	};
} forEach _list;

{_team addVehicle _x} forEach _vehicles; //--- Add vehicles.

[_units,_vehicles,_team,_crews]