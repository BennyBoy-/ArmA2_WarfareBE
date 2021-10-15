/*
	Get the available delegators.
	 Parameters:
		- Count
*/

Private ["_amount", "_count", "_delegators", "_fps", "_get", "_limit", "_unit", "_units"];

_count = _this;
_units = if (isMultiplayer) then {playableUnits} else {switchableUnits};

_limit = missionNamespace getVariable "WFBE_C_AI_DELEGATION_GROUPS_MAX";
_fps = missionNamespace getVariable "WFBE_C_AI_DELEGATION_FPS_MIN";
_delegators = [];
_amount = 1;

while {count _units != 0 && count _delegators < _count && _amount <= _limit} do {
	for '_i' from 0 to count(_units)-1 do {
		_unit = _units select _i;
		if (isPlayer _unit) then { //--- Only get players.
			_get = missionNamespace getVariable format["WFBE_AI_DELEGATION_%1", getPlayerUID _unit];
			if !(isNil '_get') then { //--- Make sure the client already communicated with the server.
				if ((_get select 0) >= _fps && (_get select 1) <= _limit) then { //--- Check that the client FPS avg is above the FPS min and that it still has room for groups.
					if ((_get select 1) < _amount) then { //--- Progressive checks to prevent client overloading.
						_delegators = _delegators + [_unit];
					};
				} else {
					_units = _units set [_i, "**NIL**"];
				};
			} else {
				_units = _units set [_i, "**NIL**"];
			};
		} else {
			_units = _units set [_i, "**NIL**"];
		};
		
		if (count _delegators >= _count) exitWith {};
	};
	
	_units = _units - ["**NIL**"];
	_amount = _amount + 1;
};

_delegators