Private ['_abtimer','_exit','_skip','_timer','_trash','_vehicle'];

_vehicle = _this;

_exit = false;
_timer = 0;
_abtimer = missionNamespace getVariable "WFBE_C_UNITS_EMPTY_TIMEOUT";

while {!_exit} do {
	sleep 20;
	_skip = false;
	if (!(alive _vehicle) && !(isNull _vehicle)) then {
		_skip = true;
		_exit = true;
		if (isNil {_vehicle getVariable "wfbe_trashed"}) then {
			_vehicle setVariable ["wfbe_trashed", true];
			_vehicle spawn TrashObject;
		};
	};
	if (!(isNull _vehicle) && !_skip) then {
		if (({alive _x} count (crew _vehicle)) > 0) then {_timer = 0};
		if (_timer > _abtimer) then {
			_exit = true;
			if (someAmmo _vehicle) then {_vehicle setVehicleAmmo 0};
			_vehicle setDammage 1;
			sleep 2;
			if (isNil {_vehicle getVariable "wfbe_trashed"}) then {
				_vehicle setVariable ["wfbe_trashed", true];
				(_vehicle) spawn TrashObject;
			};
		};
		_timer = _timer + 20;
	} else {_exit = true};
};

emptyQueu = emptyQueu - [_vehicle];