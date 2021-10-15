/*
	Create a vehicle.
	 Parameters:
		- Classname
		- Position
		- Side ID
		- Direction
		- Locked
		- {Bounty}
		- {Global Init}
		- {PLacement}
*/

Private ["_bounty", "_direction", "_global", "_locked", "_position", "_side", "_special", "_track", "_type", "_vehicle"];

_type = _this select 0;
_position = _this select 1;
_side = _this select 2;
_direction = _this select 3;
_locked = _this select 4;
_bounty = if (count _this > 5) then {_this select 5} else {true};
_global = if (count _this > 6) then {_this select 6} else {true};
_special = if (count _this > 7) then {_this select 7} else {"FORM"};

if (typeName _position == "OBJECT") then {_position = getPos _position};
if (typeName _side == "SIDE") then {_side = (_side) Call WFBE_CO_FNC_GetSideID};

_vehicle = createVehicle [_type, _position, [], 7, _special];
if (_special != "FLY") then {
	_vehicle setVelocity [0,0,-1];
} else {
	_vehicle setVelocity [50 * (sin _direction), 50 * (cos _direction), 0];
};
_vehicle setDir _direction;

if (_locked) then {_vehicle lock _locked};
if (_bounty) then {
	_vehicle addEventHandler ["killed", Format ['[_this select 0,_this select 1,%1] Spawn WFBE_CO_FNC_OnUnitKilled', _side]];
	_vehicle addEventHandler ["hit", {_this Spawn WFBE_CO_FNC_OnUnitHit}];
};

if (_global) then {
	if (_side != WFBE_DEFENDER_ID || WFBE_ISTHREEWAY) then {
		_vehicle setVehicleInit Format["[this,%1] ExecVM 'Common\Init\Init_Unit.sqf'", _side];
		processInitCommands;
	};
};

["INFORMATION", Format ["Common_CreateVehicle.sqf: [%1] Vehicle [%2] was created at [%3].", _side Call WFBE_CO_FNC_GetSideFromID, _type, _position]] Call WFBE_CO_FNC_LogContent;

_vehicle