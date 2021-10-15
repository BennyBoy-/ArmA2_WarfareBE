/*
	Basic check between two points.
	 Parameters:
		- Position 1
		- Position 2
		- Steps
*/

Private ["_current","_dir_to","_distance","_pos","_posa","_posb","_steps","_safe"];

_posa = _this select 0;
_posb = _this select 1;
_steps = _this select 2;
_distance = (_posa distance _posb) - _steps;
_dir_to = [_posa, _posb] Call WFBE_CO_FNC_GetDirTo;

_safe = true;
_current = _steps;
while {_current < _distance} do {
	_pos = [(_posa select 0) + _current * sin(_dir_to),(_posa select 1) + _current * cos(_dir_to), 0];
	if (surfaceIsWater(_pos)) exitWith {_safe = false};
	_current = _current + _steps;
};

_safe