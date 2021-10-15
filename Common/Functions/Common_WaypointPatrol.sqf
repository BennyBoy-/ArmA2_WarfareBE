/*
	Set a team on patrol.
	 Parameters:
		- Team.
		- Destination.
		- {Radius}.
*/

Private ["_behaviours","_destination","_maxWaypoints","_pos","_radius","_rand1","_rand2","_team","_type","_wps"];
_team = _this select 0;
_destination = _this select 1;
_radius = _this select 2;
_maxWaypoints = _this select 3;
_behaviours = if (count _this > 4) then {_this select 4} else {[]};
if (typeName _destination == 'OBJECT') then {_destination = getPos _destination};

_wps = [];
for '_z' from 0 to _maxWaypoints do {
	_rand1 = random _radius - random _radius;
	_rand2 = random _radius - random _radius;
	_pos = [(_destination select 0)+_rand1,(_destination select 1)+_rand2,0];
	while {surfaceIsWater _pos} do {
		_rand1 = random _radius - random _radius;
		_rand2 = random _radius - random _radius;
		_pos = [(_destination select 0)+_rand1,(_destination select 1)+_rand2,0];
	};
	_type = if (_z != _maxWaypoints) then {'MOVE'} else {'CYCLE'};
	[_wps, [_pos,_type,35,40,[],[],_behaviours]] Call WFBE_CO_FNC_ArrayPush;
};

[_team, true, _wps] Call WFBE_CO_FNC_WaypointsAdd;