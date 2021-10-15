/*
	AI Delegation Specific Functions.
	 Scope: Server.
*/

/*
	Delegate Town AI creation to client with failover.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
		- Groups
*/
WFBE_SE_FNC_DelegateAITown = {
	Private ["_groups", "_positions", "_side", "_teams", "_town", "_town_teams", "_town_vehicles"];

	_town = _this select 0;
	_side = _this select 1;
	_groups = +(_this select 2);
	_positions = +(_this select 3);
	_teams = +(_this select 4);

	_town_teams = [];
	_town_vehicles = [];
	
	_delegators = (count _groups) call WFBE_SE_FNC_GetDelegators; //--- Get the delegators.

	diag_log format["DEBUG DELEGATION::  DelegateAITown.sqf Delegators: %1", _delegators];

	//--- Delegate units and create units on the server if we don't have enough delegators.	
	for '_i' from 0 to count(_groups)-1 do {
		if (_i < count _delegators) then {
			Private ["_uid"];
			_uid = getPlayerUID(_delegators select _i);
			if !(WF_A2_Vanilla) then {
				[_delegators select _i, "HandleSpecial", ['delegate-townai', _town, _side, [_groups select _i], [_positions select _i], [_teams select _i]]] Call WFBE_CO_FNC_SendToClient;
			} else {
				[_uid, "HandleSpecial", ['delegate-townai', _town, _side, [_groups select _i], [_positions select _i], [_teams select _i]]] Call WFBE_CO_FNC_SendToClients;
			};
			[_uid, "increment"] Call WFBE_SE_FNC_DelegationOperate; //--- Increment the group count for that client.
			[_uid, _teams select _i] Spawn WFBE_SE_FNC_DelegationTracker; //--- Track a group until it's nullification.
			["INFORMATION", Format["Server_DelegateAITown.sqf: [%1] Town [%2] Units [%3] in group [%4] were delegated to client [%5].", _side, _town, _groups select _i, _teams select _i, name (_delegators select _i)]] Call WFBE_CO_FNC_LogContent;
			
			_groups set [_i, "**NIL**"];
			_positions set [_i, "**NIL**"];
			_teams set [_i, "**NIL**"];
		};
	};

	_groups = _groups - ["**NIL**"];
	_positions = _positions - ["**NIL**"];
	_teams = _teams - ["**NIL**"];

	if (count _groups > 0) then { //--- Some units left for the server to create?
		_retVal = [_town, _side, _groups, _positions, _teams] call WFBE_CO_FNC_CreateTownUnits;
		_town_teams = _town_teams + (_retVal select 0);
		_town_vehicles = _town_vehicles + (_retVal select 1);
	};

	[_town_teams, _town_vehicles]
};

/*
	Operate a delegator groups count.
	 Parameters:
		- Client UID.
		- Operate (increment/decrement).
*/
WFBE_SE_FNC_DelegationOperate = {
	Private ["_delegator", "_get", "_uid"];
	
	_uid = _this select 0;
	_operation = _this select 1;
	
	_get = missionNamespace getVariable format["WFBE_AI_DELEGATION_%1", _uid];
	if !(isNil '_get') then {
		switch (_operation) do { //--- Operate.
			case "increment": {_get set [1, (_get select 1) + 1]};
			case "decrement": {_get set [1, if ((_get select 1) > 0) then {(_get select 1) - 1} else {0}]};
		};
		missionNamespace setVariable [format["WFBE_AI_DELEGATION_%1", _uid], _get];
	};
};

/*
	Track the delegation of a group.
	 Parameters:
		- Client UID.
		- Group.
*/
WFBE_SE_FNC_DelegationTracker = {
	Private ["_delegator", "_group", "_uid"];
	
	_uid = _this select 0;
	_group = _this select 1;
	_id = (_uid) Call WFBE_SE_FNC_GetDelegatorID;
	
	while {!isNull _group} do {sleep 5};
	
	if (_id == (_uid Call WFBE_SE_FNC_GetDelegatorID)) then { //--- Only decrement if the session ID is the same (make sure that the player didn't disconnect in the meanwhile).
		[_uid, "decrement"] Call WFBE_SE_FNC_DelegationOperate; //--- Increment the group count for that client.
	};
};

/*
	Return the session ID of a delegator.
	 Parameters:
		- Client UID.
*/
WFBE_SE_FNC_GetDelegatorID = {
	Private ["_get", "_id", "_uid"];
	
	_uid = _this;
	
	_get = missionNamespace getVariable format["WFBE_AI_DELEGATION_%1", _uid];
	_id = if !(isNil '_get') then {_get select 2} else {-1};
	
	_id
};

/*
	Get the available delegators.
	 Parameters:
		- Count.
*/
WFBE_SE_FNC_GetDelegators = {
	Private ["_amount", "_count", "_delegators", "_fps", "_get", "_limit", "_unit", "_units"];

	_count = _this;
	_units = if (isMultiplayer) then {playableUnits} else {switchableUnits};

	_limit = missionNamespace getVariable "WFBE_C_AI_DELEGATION_GROUPS_MAX";
	_fps = missionNamespace getVariable "WFBE_C_AI_DELEGATION_FPS_MIN";
	_delegators = [];
	_amount = 1;
	
	while {count _units != 0 && count _delegators < _count && _amount <= _limit} do {
		for '_i' from 0 to (count _units)-1 do {
			_unit = _units select _i;
			if (isPlayer _unit) then { //--- Only get players.
				_get = missionNamespace getVariable format["WFBE_AI_DELEGATION_%1", getPlayerUID _unit];
				if !(isNil '_get') then { //--- Make sure the client already communicated with the server.
					if ((_get select 0) >= _fps && ((_get select 1) + ({_x == _unit} count _delegators)) <= _limit) then { //--- Check that the client FPS avg is above the FPS min and that it still has room for groups.
						if ((_get select 1) < _amount) then { //--- Progressive checks to prevent client overloading.
							_delegators = _delegators + [_unit];
						};
					} else {
						_units set [_i, "**NIL**"];
					};
				} else {
					_units set [_i, "**NIL**"];
				};
			} else {
				_units set [_i, "**NIL**"];
			};
			
			if (count _delegators >= _count) exitWith {};
		};
		
		_units = _units - ["**NIL**"];
		_amount = _amount + 1;
	};

	_delegators
};