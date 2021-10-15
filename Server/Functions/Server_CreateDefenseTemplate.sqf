Private ["_created","_current","_dir","_i","_object","_origin","_relDir","_relPos","_skip","_template","_toplace","_toWorld"];
_origin = _this select 0;
_template = _this select 1;
_existingTemplate = if (count _this > 2) then {_this select 2} else {[]};

_dir = getDir _origin;
_created = [];
_toplace = objNull;

for '_i' from 0 to count(_template)-1 do {
	_current = _template select _i;
	_object = _current select 0;
	_relPos = _current select 1;
	_relDir = _current select 2;
	
	_skip = false;
	if (_i < count(_existingTemplate)) then {
		if (alive(_existingTemplate select _i)) then {_skip = true};
	};
	
	if !(_skip) then {
		_toplace = createVehicle [_object, [0,0,0], [], 0, "NONE"];
		_toplace setVariable ["wfbe_defense", true]; //--- This is one of our defenses.
		
		_toWorld = _origin modelToWorld _relPos;
		_toWorld set [2,0];

		_toplace setDir (_dir - _relDir);
		_toplace setPos _toWorld;
	} else {
		_toplace = _existingTemplate select _i;
	};
	
	_created = _created + [_toplace];
};

_created