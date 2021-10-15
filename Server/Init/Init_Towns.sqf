Private ['_boundaries','_camps','_eStart','_half','_initied','_limit','_minus','_near','_nearTownsE','_nearTownsW','_require','_resTowns','_total','_town','_towns','_wStart','_z'];

waitUntil {townInit};

//--- Special Towns mode.
switch (missionNamespace getVariable "WFBE_C_TOWNS_STARTING_MODE") do {
	//--- 50-50.
	case 1: {
		_half = round(count towns)/2;
		_wStart = (west Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_startpos";
		_eStart = (east Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_startpos";

		_nearTownsW = [];
		_nearTownsE = [];
		
		_near = [_wStart,towns] Call SortByDistance;
		if (count _near > 0) then {
			for [{_z = 0},{_z < _half},{_z = _z + 1}] do {_nearTownsW = _nearTownsW + [_near select _z]};
		};
		
		_nearTownsE = (towns - _nearTownsW);
		
		{
			_x setVariable ['sideID',WESTID,true];
			_camps = _x getVariable "camps";
			{_x setVariable ['sideID',WESTID,true]} forEach _camps;
		} forEach _nearTownsW;
		{
			_x setVariable ['sideID',EASTID,true];
			_camps = _x getVariable "camps";
			{_x setVariable ['sideID',EASTID,true]} forEach _camps;
		} forEach _nearTownsE;
	};
	
	//--- Nearby Towns.
	case 2: {
		_total = count towns;
		_wStart = (west Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_startpos";
		_eStart = (east Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_startpos";
		_limit = floor(_total / 6);
		_nearTownsW = [];
		_nearTownsE = [];
		
		_near = [_wStart,towns] Call SortByDistance;
		if (count _near > 0) then {
			for [{_z = 0},{_z < _limit},{_z = _z + 1}] do {_nearTownsW = _nearTownsW + [_near select _z]};
		};
		
		_near = [_eStart,(towns - _nearTownsW)] Call SortByDistance;
		if (count _near > 0) then {
			for [{_z = 0},{_z < _limit},{_z = _z + 1}] do {_nearTownsE = _nearTownsE + [_near select _z]};
		};
		
		{
			_x setVariable ['sideID',WESTID,true];
			_camps = _x getVariable "camps";
			{_x setVariable ['sideID',WESTID,true]} forEach _camps;
		} forEach _nearTownsW;
		{
			_x setVariable ['sideID',EASTID,true];
			_camps = _x getVariable "camps";
			{_x setVariable ['sideID',EASTID,true]} forEach _camps;
		} forEach _nearTownsE;
	};
	
	//--- Random Towns (25% East, 25% West, 50% Res).
	case 3: {
		_total = count towns;
		_half = round(count towns)/4;
		_minus = round(count towns)/2;
		_boundaries = missionNamespace getVariable 'WFBE_BOUNDARIESXY';
		_nearTownsW = [];
		_resTowns = [];
		_towns = +towns;
		
		//--- Use boundaries to determinate the center if possible.
		if !(isNil '_boundaries') then {
			Private ["_dis1","_dis2","_e","_posF1","_posF2","_posx","_posy","_searchArea","_size"];
			//--- Attempt to set the center of the island resistance.
			_searchArea = [(_boundaries / 2)-0.1,(_boundaries / 2)+0.1,0];
			_posx = _searchArea select 0;
			_posy = _searchArea select 0;
			_size = _boundaries/5;
			_e = sqrt((_size)^2 - (_size)^2);
			_posF1 = [_posx + (sin (90) * _e),_posy + (cos (90) * _e)];
			_posF2 = [_posx - (sin (90) * _e),_posy - (cos (90) * _e)];
			_total = 2 * _size;
			
			//--- Determinate resistance towns.
			{
				_position = getPos _x;
				
				_dis1 = _position distance _posF1;
				_dis2 = _position distance _posF2;
				if (_dis1+_dis2 < _total) then {
					_resTowns = _resTowns + [_x];
				};
				
				if (count _resTowns >= _minus) exitWith {};
			} forEach towns;
			
			//--- Update Towns.
			_towns = _towns - _resTowns;
			_e = count _towns;
			
			//--- Check if we couldn't reach 50% Res.
			if (count _resTowns < _minus) then {
				for '_z' from 0 to _e-1 do {
					_town = _towns select round(random((count _towns)-1));
					_towns = _towns - [_town];
					
					_resTowns = _resTowns + [_town];
					
					if (count _resTowns >= _minus) exitWith {};
				};
			};
			
			//--- Update Towns Again.
			_towns = _towns - _resTowns;
			_e = count _towns;
			
			//--- Assign west or east towns.
			for '_z' from 0 to totalTowns-_minus-1 do {
				_town = _towns select round(random((count _towns)-1));
				_towns = _towns - [_town];
				if (count _nearTownsW < _half) then {
					_nearTownsW = _nearTownsW + [_town];
					_town setVariable ['sideID',WESTID,true];
					_camps = _town getVariable "camps";
					{_x setVariable ['sideID',WESTID,true]} forEach _camps;
				} else {
					_town setVariable ['sideID',EASTID,true];
					_camps = _town getVariable "camps";
					{_x setVariable ['sideID',EASTID,true]} forEach _camps;
				};
			};
		} else {
			//--- No boundaries defined, we use a random system.
			for '_z' from 0 to _minus-1 do {
				_town = _towns select round(random((count _towns)-1));
				_towns = _towns - [_town];
				if (count _nearTownsW < _half) then {
					_nearTownsW = _nearTownsW + [_town];
					_town setVariable ['sideID',WESTID,true];
					_camps = _town getVariable "camps";
					{_x setVariable ['sideID',WESTID,true]} forEach _camps;
				} else {
					_town setVariable ['sideID',EASTID,true];
					_camps = _town getVariable "camps";
					{_x setVariable ['sideID',EASTID,true]} forEach _camps;
				};
			};
		};
		
		
	};
};

//--- Resistance Patrols.
if ((missionNamespace getVariable "WFBE_C_TOWNS_STARTING_MODE") != 1 && ((missionNamespace getVariable "WFBE_C_TOWNS_PATROLS") > 0)) then {
	_require = if ((missionNamespace getVariable "WFBE_C_TOWNS_PATROLS") > count towns) then {count towns} else {missionNamespace getVariable "WFBE_C_TOWNS_PATROLS"};
	_initied = 0;
	_towns = towns;
	
	//--- Don't bother with the randomizer if the amount set in RESPATROLMAX is >= count towns.
	while {_initied < _require} do {
		if (_require == count towns) then {
			// [_towns select _initied] ExecFSM "Server\FSM\respatrol.fsm";
			(_towns select _initied) setVariable ["wfbe_patrol_enabled", true];
			_initied = _initied + 1;
		} else {
			if (random 2 > 1) then {
				_town = _towns select floor (random count _towns);
				// _town = [_towns select (round(random((count _towns)-1)))] ExecFSM "Server\FSM\respatrol.fsm";
				_town setVariable ["wfbe_patrol_enabled", true];
				_towns = _towns - [_town];
				_initied = _initied + 1;
			};
		};
	};
};

townInitServer = true;

["INITIALIZATION", "Init_Server.sqf: Town starting mode is done."] Call WFBE_CO_FNC_LogContent;