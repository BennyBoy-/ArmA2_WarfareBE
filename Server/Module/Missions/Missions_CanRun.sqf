/*
	Check whether a mission can run or not.
	 Parameters:
		- Mission
*/

Private ["_canrun","_mission", "_sides"];

_mission = _this;

_canrun = true;

//--- Side(s) to run.
_sides = [];
switch (_mission select 4) do {
	case "all": {
		if (call (_mission select 6)) then {_sides = _mission select 5} else {_canrun = false};
	};
	case "one": {
		Private ["_condition_perside", "_index", "_selected", "_sides_check"];
		
		_condition_perside = if (typeName(_mission select 6) == "ARRAY") then {true} else {false};
		_sides_check = +(_mission select 5);
		_selected = [];
		
		//--- Check randomly who can run the mission.
		while {count _sides_check > 0 && count _sides == 0} do {
			_selected = _sides_check select floor(random count _sides_check);
			if (_condition_perside) then {
				_index = (_mission select 5) find _selected;
				if (call ((_mission select 6) select _index) && (missionNamespace getVariable Format["_WFBE_M_RUNNINGMISSIONS_%1", _selected]) < (missionNamespace getVariable Format["WFBE_MISSIONSMAXIMUM_%1", _selected])) then {_sides = [_selected]};
			} else {
				if (call (_mission select 6) && (missionNamespace getVariable Format["_WFBE_M_RUNNINGMISSIONS_%1", _selected]) < (missionNamespace getVariable Format["WFBE_MISSIONSMAXIMUM_%1", _selected])) then {_sides = [_selected]};
			};
			
			_sides_check = _sides_check - [_selected];
		};
		
		if (count _sides == 0) then {_canrun = false};
	};
	default {_canrun = false};
};

//--- Make sure that still have some mission room left for the present side(s).
if (_canrun) then {
	Private ["_islandHeader"];
	{
		if ((missionNamespace getVariable Format["_WFBE_M_RUNNINGMISSIONS_%1", _x]) >= (missionNamespace getVariable Format["WFBE_MISSIONSMAXIMUM_%1", _x])) exitWith {_canrun = false};
	} forEach _sides;

	//--- Check the islands to run upon.
	if (_canrun) then {
		_islandHeader = (_mission select 0) select 0;
		if (_islandHeader != '*') then {
			if (_islandHeader == '!') then {
				//--- If island not in.
				_canrun = if !(worldName in (_mission select 0)) then {true} else {false};
			} else {
				//--- If island in.
				_canrun = if (worldName in (_mission select 0)) then {true} else {false};
			};
		};
	};
};

[_canrun, _sides]