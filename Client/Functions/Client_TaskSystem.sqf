Private ["_i","_location","_locations","_next","_sideID","_sorted","_task","_type"];
_type = _this select 0;
_location = if (count _this > 1) then {_this select 1} else {objNull};

switch (_type) do {
	//--- Complete Towns set initialization.
	case "TownAddComplete": {
		//--- Todo: improve the sort by with other digits instead of the first one.
		sleep 4;
		Private ["_addOrder","_returned","_town","_towns","_townsLabel"];
		_townsLabel = [];
		{_townsLabel = _townsLabel + [_x getVariable 'name']} forEach towns;
		_towns = ([_townsLabel,true,towns] Call CIPHER_SortArray) select 1;
		
		for '_i' from 0 to count(_towns)-1 do {
			_town = _towns select _i;
			waitUntil {_sideID = _town getVariable 'sideID';!isNil '_sideID'};
			_sideID = _town getVariable "sideID";
			_task = player createSimpleTask [Format["TakeTowns_%1",str _town]];
			if (_sideID != sideID) then {
				_task setSimpleTaskDescription [Format[localize "STR_WF_TaskTown",_town getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_town getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_town getVariable "name"]];
			} else {
				_task setSimpleTaskDescription [Format[localize "STR_WF_TaskTown_Complete",_town getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_town getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_town getVariable "name"]];
				_task setTaskState "Succeeded";
			};
			_task setSimpleTaskDestination (getPos _town);
			_town setVariable ['taskLink',_task];
		};
		
		["TownAssignClosest"] Spawn TaskSystem;
	};
	
	//--- Assign the closest town to the player.
	case "TownAssignClosest": {
		sleep 4;
		_next = [player,sideJoined] Call GetClosestLocationBySide;
		if !(isNull _next) then {
			["TownHintNew",_next] Spawn TaskSystem;
			_task = (_next getVariable 'taskLink');
			/* Keep the commander order ! */
			if (!isNull comTask) then {
				if (taskState comTask == "Succeeded") then {player setCurrentTask _task};
			} else {
				player setCurrentTask _task;
			};
		};
	};

	//--- Update a town's value.
	case "TownUpdate": {
		_task = _location getVariable 'taskLink';
		_sideID = _location getVariable "sideID";
		if !(isNil '_task') then {
			if (_sideID == sideID) then {
				_task setTaskState "Succeeded";
				_task setSimpleTaskDescription [Format[localize "STR_WF_TaskTown_Complete",_location getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_location getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_location getVariable "name"]];
			} else {
				_task setTaskState "Created";
				_task setSimpleTaskDescription [Format[localize "STR_WF_TaskTown",_location getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_location getVariable "name"], Format [localize "STR_WF_CHAT_TaskTown_Display",_location getVariable "name"]];
			};
		}
	};

	//--- Hint for a new town task.
	case "TownHintNew": {taskHint [format [localize "str_taskNew" + "\n%1",Format [localize "STR_WF_CHAT_TaskTown_Display",_location getVariable "name"]], [1,1,1,1], "taskNew"]};
	
	//--- Hint for a completed town task.
	case "TownHintDone": {taskHint [format [localize "str_taskAccomplished" + "\n%1",Format [localize "STR_WF_CHAT_TaskTown_Display",_location getVariable "name"]], [1,1,1,1], "taskDone"]};
};