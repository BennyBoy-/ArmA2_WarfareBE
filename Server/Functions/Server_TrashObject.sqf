/*
	Trash an entity.
	 Parameters:
		- Object.
*/

Private ["_group","_isMan","_object"];

_object = _this;

if !(isNull _object) then {
	_group = [];
	_isMan = if (_object isKindOf "Man") then {true} else {false};
	
	if (_isMan) then {_group = group _object};
	if !(_isMan) then {_object removeAllEventHandlers "hit"};
	_object removeAllEventHandlers "killed";
	
	sleep (missionNamespace getVariable "WFBE_C_UNITS_CLEAN_TIMEOUT");
	
	if (_isMan) then {hideBody _object; sleep 6};
	
	deleteVehicle _object;
	
	if (_isMan) then {
		if !(isNull _group) then {
			if (isNil {_group getVariable "wfbe_persistent"}) then {if (count (units _group) <= 0) then {deleteGroup _group}};
		};
	};
};