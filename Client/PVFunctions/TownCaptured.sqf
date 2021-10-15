/*
	Triggered everytime a capture is done (town captured or lost).
	 Parameters:
		- Town
		- Old side ID.
		- New side ID.
*/

Private ["_color","_town","_townMarker","_town_side_value","_town_side_value_new"];

_town = _this select 0;
_town_side_value = _this select 1;
_town_side_value_new = _this select 2;

//--- Make sure that the client is concerned by the capture either by capturing or having a town captured.
if !(WFBE_Client_SideID in [_town_side_value,_town_side_value_new]) exitWith {};

_side_captured = (_town_side_value_new) Call WFBE_CO_FNC_GetSideFromID;

//--- Color the town depending on the side which captured.
_color = missionNamespace getVariable (Format ["WFBE_C_%1_COLOR", _side_captured]);
_townMarker = Format ["WFBE_%1_CityMarker", _town];
_townMarker setMarkerColorLocal _color;

//--- Display a title message.
_side_label = switch (_side_captured) do {case west: {localize "STR_WF_PARAMETER_Side_West"}; case east: {localize "STR_WF_PARAMETER_Side_East"}; case resistance: {localize "STR_WF_Side_Resistance"};	default {"Civilian"}};
[Format[Localize "STR_WF_CHAT_Town_Captured", _town getVariable "name", _side_label]] Call TitleTextMessage;

//--- Task.
_task = _town getVariable 'taskLink';
_ptask = currentTask player;
if (isNil '_task') then {_task = objNull};

//--- Taskman
["TownUpdate", _town] Spawn TaskSystem;

//--- Client side capture.
if (_town_side_value_new == WFBE_Client_SideID) then {
	//--- Retrieve the closest unit of the town.
	_closest = [_town, (units group player) Call WFBE_CO_FNC_GetLiveUnits] Call WFBE_CO_FNC_GetClosestEntity;
	
	//--- Client reward.
	if !(isNull _closest) then {
		//--- Check if the closest unit of the town in in range.
		_distance = _closest distance _town;
		
		_bonus = -1;
		_score = -1;
		if (_distance <= (missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_RANGE")) then {
			//--- Capture
			_bonus = if (_task == _ptask) then {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION"} else {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE"};
			_score = missionNamespace getVariable "WFBE_C_PLAYERS_SCORE_CAPTURE";
		} else {
			//--- Is it an assist?.
			if (_distance <= (missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_ASSIST")) then {
				//--- Assist.
				_bonus = if (_task == _ptask) then {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION_ASSIST"} else {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE_ASSIST"};
				_score = missionNamespace getVariable "WFBE_C_PLAYERS_SCORE_CAPTURE_ASSIST";
			};
		};
		
		//--- Update the funds if necessary.
		if (_bonus != -1) then {
			(_bonus) Call WFBE_CL_FNC_ChangeClientFunds;
			Format[Localize "STR_WF_CHAT_Town_Bounty_Full", _town getVariable "name", _bonus] Call CommandChatMessage;
		};
		
		//--- Update the score necessary.
		if (_score != -1) then {["RequestChangeScore", [player,score player + _score]] Call WFBE_CO_FNC_SendToServer};
	};
	
	//--- Commander reward (if the player is the commander)
	if !(isNull commanderTeam) then {
		if (commanderTeam == group player) then {
			_bonus = (_town getVariable "startingSupplyValue") * (missionNamespace getVariable "WFBE_C_PLAYERS_COMMANDER_BOUNTY_CAPTURE_COEF");
			(_bonus) Call WFBE_CL_FNC_ChangeClientFunds;
			["RequestChangeScore", [player,score player + (missionNamespace getVariable "WFBE_C_PLAYERS_COMMANDER_SCORE_CAPTURE")]] Call WFBE_CO_FNC_SendToServer;
			Format[Localize "STR_WF_CHAT_Commander_Bounty_Town", _bonus, _town getVariable "name"] Call CommandChatMessage;
		};
	};
	
	//--- Taskman
	if !(isNull _task) then {
		if (_ptask == _task) then {
			["TownAssignClosest"] Spawn TaskSystem;
		};
	};
};