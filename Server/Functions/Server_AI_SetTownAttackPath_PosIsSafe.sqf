/*
	Define whether a location is safe or not for the ai to move on.
	 Parameters:
		- Position.
		- Side ID.
		- Town.
*/

Private ["_hostile","_safe","_sid","_town","_towns","_wp_sel_pos"];

_wp_sel_pos = _this select 0;
_sid = _this select 1;
_town = _this select 2;

_safe = false;
if !(surfaceIsWater _wp_sel_pos) then {
	_towns = (_wp_sel_pos nearEntities [["LocationLogicCity"], 550]) - [_town];
	if (count _towns == 0) then {
		_safe = true
	} else {
		_hostile = {(_x getVariable "sideID") != _sid} count _towns;
		if (_hostile == 0) then {_safe = true};
	};
};

_safe