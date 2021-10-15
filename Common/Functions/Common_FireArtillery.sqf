Private["_ammo","_angle","_artillery","_artillery_classes","_artillery_type","_burst","_destination","_dispersion","_direction","_distance","_FEH","_gunner","_i","_index","_minRange","_maxRange","_position","_radius","_reloadTime","_side","_type","_velocity","_watchPosition","_weapon","_xcoord","_ycoord"];

_artillery = _this select 0;
_destination = _this select 1;
_side = _this select 2;
_radius = _this select 3;

_index = [typeOf _artillery, _side] Call IsArtillery;

_gunner = gunner _artillery;
if (_index == -1) exitWith {["WARNING", Format ["Common_FireArtillery.sqf: No artillery types were found for [%1].", _artillery]] Call WFBE_CO_FNC_LogContent};
if (isNull _gunner) exitWith {["WARNING", Format ["Common_FireArtillery.sqf: Artillery [%1] gunner is null.", _artillery]] Call WFBE_CO_FNC_LogContent};
if (isPlayer _gunner) exitWith {["WARNING", Format ["Common_FireArtillery.sqf: Artillery [%1] gunner is a player", _artillery]] Call WFBE_CO_FNC_LogContent};

_minRange = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_RANGES_MIN",_side]) select _index;
_maxRange = round(((missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_RANGES_MAX",_side]) select _index) * (missionNamespace getVariable "WFBE_C_ARTILLERY"));
_weapon = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_WEAPONS",_side]) select _index;
_ammo = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_AMMOS",_side]) select _index;
_velocity = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_VELOCITIES",_side]) select _index;
_dispersion = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_DISPERSIONS",_side]) select _index;

[_artillery] Call ARTY_Prep; //--- Prepare the artillery unit to the fire mission submission.

//--- Artillery Calculations.
_position = getPos _artillery;
_xcoord = (_destination select 0) - (_position select 0);
_ycoord = (_destination select 1) - (_position select 1);
_direction =  -(((_ycoord atan2 _xcoord) + 270) % 360);
if (_direction < 0) then {_direction = _direction + 360};
_distance = sqrt ((_xcoord ^ 2) + (_ycoord ^ 2)) - _minRange;
_angle = _distance / (_maxRange - _minRange) * 100 + 15;
if (_angle > 70) then {_angle = 70};
if (_distance < 0 || _distance + _minRange > _maxRange) exitWith {};

_FEH = Call Compile Format ["_artillery addEventHandler ['Fired',{[_this select 4,_this select 6,%1,%2,%3,%4,%5,%6,%7,%8,%9] Spawn WFBE_CO_FNC_HandleArtillery}];",_ammo,_destination,_velocity,_dispersion,getPos _artillery,_distance,_radius,_maxRange,_side];

{_gunner disableAI _x} forEach ['MOVE','TARGET','AUTOTARGET'];
_watchPosition = [_destination select 0, _destination select 1, (_artillery distance _destination)/(tan(90-_angle))];

(_gunner) doWatch _watchPosition;

sleep (10 + random 4);

if !(alive _gunner) exitWith {if !(isNull _artillery) then {_artillery removeEventHandler ['Fired',_FEH]}};
if !(alive _artillery) exitWith {
	if (alive _gunner) then {{_gunner enableAI _x} forEach ['MOVE','TARGET','AUTOTARGET']};
};

_reloadTime = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_TIME_RELOAD",_side]) select _index;
_burst = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_BURST",_side]) select _index;

for '_i' from 1 to _burst do {
	sleep (_reloadTime+random 3);
	if (!alive _gunner || !alive _artillery) exitWith {};
	
	_artillery fire _weapon;
};

sleep 1;

if !(isNull _artillery) then {_artillery removeEventHandler ['Fired', _FEH]};

sleep (_reloadTime + 20);

if (alive (_gunner)) then {{_gunner enableAI _x} forEach ['MOVE','TARGET','AUTOTARGET']};

[_artillery] Call ARTY_Finish; //--- Free the artillery unit from the fire mission submission.