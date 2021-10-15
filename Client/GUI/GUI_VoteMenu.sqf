scriptName "Client\GUI\GUI_VoteMenu.sqf";

//--- Register the UI.
uiNamespace setVariable ["wfbe_display_vote", _this select 0];

_u = 1;
lnbClear 500100;
lnbAddRow[500100, ["AI Commander", "0"]];
lnbSetValue[500100, [0, 0], -1];
for '_i' from 0 to count(WFBE_Client_Teams)-1 do {
	if (isPlayer leader (WFBE_Client_Teams select _i)) then {
		lnbAddRow[500100, [name leader (WFBE_Client_Teams select _i), "0"]];
		lnbSetValue[500100, [_u, 0], _i];
		_u = _u + 1;
	};
};

WFBE_MenuAction = -1;

_update_list = -5;
_voteArray = [];

while {alive player && dialog} do {
	_voteTime = WFBE_Client_Logic getVariable "wfbe_votetime";
	
	//--- Exit when the timeout is reached.
	if (_voteTime < 0) exitWith {closeDialog 0};

	for '_i' from 0 to WFBE_Client_Teams_Count do {_voteArray set [_i , 0]};
	
	//--- The client has voted for x.
	if (WFBE_MenuAction == 1) then {
		WFBE_MenuAction = -1;
		_index = lnbValue [500100,[lnbCurSelRow 500100, 0]];
		if ((WFBE_Client_Team getVariable "wfbe_vote") != _index) then {WFBE_Client_Team setVariable ["wfbe_vote", _index, true]};
	};
	
	//--- Update the votes.
	_playerCount = 0;
	{
		if (isPlayer leader _x) then {
			_vote = (_x getVariable "wfbe_vote") + 1;
			_voteArray set [_vote, (_voteArray select _vote) + 1];
			_playerCount = _playerCount + 1;
		};
	} forEach WFBE_Client_Teams;
	
	_highestId = 0;
	for '_i' from 0 to WFBE_Client_Teams_Count do {if ((_voteArray select _i) > (_voteArray select _highestId)) then {_highestId = _i}}; //--- Get the most voted person.
	
	if (time - _update_list > 1) then { //--- Refresh the list.
		_update_list = time;
		
		_list_present = [];
		for '_i' from 1 to ((lnbSize 500100) select 0)-1 do { //--- Remove potential non-player controlled slots.
			_value = lnbValue [500100,[_i, 0]];
			_team = WFBE_Client_Teams select _value;
			if !(isPlayer leader _team) then {lnbDeleteRow [500100, _i]} else {[_list_present, _value] Call WFBE_CO_FNC_ArrayPush};
		};
		
		for '_i' from 0 to WFBE_Client_Teams_Count do { //--- Add potential new player controlled slots.
			_team = WFBE_Client_Teams select _i;
			if (isPlayer leader _team && !(_i in _list_present)) then {
				lnbAddRow[500100, [name leader _team, "0"]];
				lnbSetValue[500100, [((lnbSize 500100) select 0)-1, 0], _i];
			};
		};
	};
	
	if ((((uiNamespace getVariable "wfbe_display_vote") displayCtrl 500100) lnbText [0, 1]) != str(_voteArray select 0)) then {lnbSetText [500100, [0, 1], str(_voteArray select 0)]}; //--- AI Commander
	
	for '_i' from 1 to ((lnbSize 500100) select 0)-1 do { //--- Update the UI list properties (name / votes) for players.
		_value = lnbValue [500100,[_i, 0]];
		_team = WFBE_Client_Teams select _value;
		if ((((uiNamespace getVariable "wfbe_display_vote") displayCtrl 500100) lnbText [_i, 0]) != name leader _team) then {lnbSetText [500100, [_i, 0], name leader _team]};
		if ((((uiNamespace getVariable "wfbe_display_vote") displayCtrl 500100) lnbText [_i, 1]) != str(_voteArray select _value+1)) then {lnbSetText [500100, [_i, 1], str(_voteArray select _value+1)]};
	};
	
	//--- Update the text
	_voted_commander = if ((_voteArray select _highestId) <= (_playerCount/2) || _highestId == 0) then {localize "STR_WF_AI"} else {name leader (WFBE_Client_Teams select _highestId-1)};
	ctrlSetText [500101, _voted_commander];
	ctrlSetText [500102, Format ["%1",_voteTime]];
	
	sleep 0.05;
};

//--- Release the UI.
uiNamespace setVariable ["wfbe_display_vote", nil];