Private ["_building","_built","_config","_crew","_direction","_dir","_distance","_factoryPosition","_factoryType","_id","_index","_isVehicle","_longest","_position","_queu","_queu2","_ret","_side","_sideID","_sideText","_soldier","_team","_turrets","_type","_unitType","_vehicle","_waitTime"];
_id = _this select 0;
_building = _this select 1;
_unitType = _this select 2;
_side = _this select 3;
_sideID = (_side) Call GetSideID;
_team = _this select 4;
_isVehicle = _this select 5;

_sideText = str _side;

if !(alive _building) exitWith {["INFORMATION", Format ["Server_AlliesBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};

diag_log Format["[WFBE (INFORMATION)][frameno:%3 | ticktime:%4] Server_AlliesBuyUnit: AI Team %1 has purchased a '%2'",_team,_unitType,diag_frameno,diag_tickTime];
["INFORMATION", Format ["Server_AlliesBuyUnit.sqf: [%1] Team has purchased a [%1] unit.",_team, _unitType]] Call WFBE_CO_FNC_LogContent;

_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu = _queu + [_id select 0];
_building setVariable ["queu",_queu];

_type = typeOf _building;
if (_type == "CDF_WarfareBBarracks" || _type == "Ins_WarfareBBarracks") then {_type = Call Compile Format ["%1BAR",str _side]};
if (_type == "CDF_WarfareBLightFactory" || _type == "Ins_WarfareBLightFactory") then {_type = Call Compile Format ["%1LVF",str _side]};
if (_type == "CDF_WarfareBHeavyFactory" || _type == "Ins_WarfareBHeavyFactory") then {_type = Call Compile Format ["%1HEAVY",str _side]};
if (_type == "CDF_WarfareBAircraftFactory" || _type == "Ins_WarfareBAircraftFactory") then {_type = Call Compile Format ["%1AIR",str _side]};

_index = (missionNamespace getVariable Format ["WFBE_%1STRUCTURENAMES",_sideText]) find _type;
_distance = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDISTANCES",_sideText]) select _index;
_direction = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDIRECTIONS",_sideText]) select _index;
_factoryType = (missionNamespace getVariable Format ["WFBE_%1STRUCTURES",_sideText]) select _index;

_waitTime = (missionNamespace getVariable _unitType) select QUERYUNITTIME;
_position = [getPos _building,_distance,getDir _building + _direction] Call GetPositionFrom;
_longest = missionNamespace getVariable Format ["WFBE_LONGEST%1BUILDTIME",_factoryType];

_ret = 0;
_queu2 = [0];

if (count _queu > 0) then {
	_queu2 = _building getVariable "queu";
};

while {_id select 0 != _queu select 0} do {
	sleep 4;
	_ret = _ret + 4;
	_queu = _building getVariable "queu";
	
	if (!(alive _building)||(isNull _building)) exitWith {
		_queu = _building getVariable "queu";
		_queu = _queu - [_queu select 0];
		_building setVariable ["queu",_queu];
		["INFORMATION", Format ["Server_AlliesBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent;
	};
	
	if (_queu select 0 == _queu2 select 0) then {
		if (_ret > _longest) then {
			if (count _queu > 0) then {
				_queu = _building getVariable "queu";
				_queu = _queu - [_queu select 0];
				_building setVariable ["queu",_queu];
			};	
		};
	};
	if (count _queu != count _queu2) then {
		_ret = 0;
		_queu2 = _building getVariable "queu";
	};
};

sleep _waitTime;

_queu = _building getVariable "queu";
_queu = _queu - [_id select 0];
_building setVariable ["queu",_queu];

if !(alive _building) exitWith {["INFORMATION", Format ["Server_AlliesBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};

if (_unitType isKindOf "Man") then {
	_soldier = [_unitType,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
	[_sideText,'UnitsCreated',1] Call UpdateStatistics;
	
	//--- Infantry can use the team vehicles as cargo.
	_vehicle = [_team,true] Call GetTeamVehicles;
	{_team addVehicle _x} forEach _vehicle;
} else {
	_crew = missionNamespace getVariable Format["WFBE_%1ALLIESSOLDIER",_sideText];
	_factoryPosition = getPos _building;
	_dir = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);
	if (_unitType isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["WFBE_%1ALLIESCREW",_sideText]};
	if (_unitType isKindOf "Air") then {_crew = missionNamespace getVariable Format ["WFBE_%1ALLIESPILOT",_sideText]};
	
	_special = if (_unitType isKindOf "Plane") then {"FLY"} else {"NONE"};
	_vehicle = [_unitType, _position, _sideID, _dir, true, true, true, _special] Call WFBE_CO_FNC_CreateVehicle;
	
	/* Clear the vehicle */
	(_vehicle) call WFBE_CO_FNC_ClearVehicleCargo;
	
	emptyQueu = emptyQueu + [_vehicle];
	_vehicle Spawn HandleEmptyVehicle;
	_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
	[_soldier] allowGetIn true;
	[_soldier] orderGetIn true;
	_soldier assignAsDriver _vehicle;
	_soldier moveInDriver _vehicle;
	
	[_sideText,'VehiclesCreated',1] Call UpdateStatistics;
	_built = 1;
	if (_isVehicle select 1) then {
		_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		[_soldier] orderGetIn true;
		_soldier assignAsGunner _vehicle;
		_soldier moveInGunner _vehicle;
		_built = _built + 1;
	};
	if (_isVehicle select 2) then {
		_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		[_soldier] orderGetIn true;
		_soldier assignAsCommander _vehicle;
		_soldier moveInCommander _vehicle;
		_built = _built + 1;
	};
	if (_isVehicle select 3) then {
		Private ["_get","_turrets"];
		_get = missionNamespace getVariable _unitType;
		_turrets = _get select QUERYUNITTURRETS;
		
		{
			if (isNull (_vehicle turretUnit _x)) then {
				_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
				[_soldier] allowGetIn true;
				_soldier moveInTurret [_vehicle, _x];
				_built = _built + 1;
			};
		} forEach _turrets;
	};
	[_sideText,'UnitsCreated',_built] Call UpdateStatistics;
};