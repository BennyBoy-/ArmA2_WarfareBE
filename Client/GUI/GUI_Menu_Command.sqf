disableSerialization;

MenuAction = -1;
mouseButtonUp = -1;
_display = _this select 0;

//--- Alt.
_mode = 0; //--- Team properties.

_updateProperties = true;
_updateRespawn = true;
_updateTab = true;

_IDCTeam = [14009,14010,14016,14017,14018,14019,14020,14021,14022,14023,14024,14025,14026,14027,14030,14031,14901,14902];
_IDCTasks = [14017,14018,14021,14022,14030,14032];
_IDCDetails = [14030,14041,14042,14043];
{ctrlShow[_x,false]} forEach (_IDCTasks + _IDCDetails);
{ctrlShow[_x,true]} forEach _IDCTeam;
_TaskTypes = ["Assist","Attack","Defend","Destroy","Guard","Hold","Patrol","Move","Search and Destroy","Seize","Support"];
_TaskDuration = [1,2,3,4,5,6,7,8,9,10,15,20,25,30,35,40,45,50,55,60];
_TaskDurationLabel = ["1 Min","2 Min","3 Min","4 Min","5 Min","6 Min","7 Min","8 Min","9 Min","10 Min","15 Min","20 Min","25 Min","30 Min","35 Min","40 Min","45 Min","50 Min","55 Min","60 Min"];
_detailGroup = [];

ctrlSetText [14026,localize "STR_WF_COMMAND_Respawn" + ":"];

_listbox_teams = _display displayCtrl 14012;
_u = 1;
lbAdd[14012,localize "STR_WF_COMMAND_All"];
{lbAdd [14012,Format["[%1] %2",_u,name (leader _x)]];_u = _u + 1} forEach clientTeams;
lbSetCurSel [14012,1];

_radioLabel = ["All","Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu","Razor","Fatman","StarForce","Frostbite","Battlemage","Manhattan","Firefly","Swordsman","Sabre","Hammer","Reaper","Anvil","Fortune"];

_templates = missionNamespace getVariable Format["WFBE_%1AITEAMTEMPLATEDESCRIPTIONS",sideJoinedText];
_templates_upgrades = missionNamespace getVariable Format["WFBE_%1AITEAMUPGRADES",sideJoinedText];
_upgrades = (sideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
_u = 0;
_i = 0;
{
	_temp_upgr = _templates_upgrades select _i;
	
	_canAdd = true;
	for '_k' from 0 to 3 do {
		if ((_temp_upgr select _k) > (_upgrades select _k)) exitWith {_canAdd = false};
	};
	
	if (_canAdd) then {
		lbAdd [14010,_x];
		lbSetValue [14010, _u, _i];
		_u = _u + 1;
	};
	_i = _i + 1;
} forEach _templates;
lbSort (_display displayCtrl 14010);

_curSel = lbCurSel 14012;
_teams = [];
_team = if (_curSel != 0) then {clientTeams select (_curSel - 1)} else {clientTeams select (_curSel + 1)};
_team_old = _team;

_index = (_team) Call GetTeamType;
if (_index == -1) then {_index = 1};
lbSetCurSel [14010,[14010,_index] Call UIFindLBValue];

_txt = (_team) Call GetTeamMoveMode;
if (_txt == "" || _txt == "towns") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_TakeTowns"};
if (_txt == "move") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_Move"};
if (_txt == "patrol") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_Patrol"};
if (_txt == "defense") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_Defense"};
ctrlSetText [14013,_txt];

_map = _display displayCtrl 14002;
//_map ctrlMapAnimAdd [1,.075,getPos (leader(clientTeams select 0))];
//ctrlMapAnimCommit _map;

ctrlEnable [14015,false];
ctrlEnable [14014,false];

//--- Set the combo properties.
_behaviors = ["AWARE","CARELESS","COMBAT","SAFE","STEALTH"];
_combatModes = ["BLUE","GREEN","RED","WHITE","YELLOW"];
_formations = ["COLUMN","DIAMOND","ECH LEFT","ECH  RIGHT","FILE","LINE","STAG COLUMN","VEE","WEDGE"];
_speeds = ["LIMITED","FULL","NORMAL"];

{lbAdd [14017, _x]} forEach _behaviors;
{lbAdd [14018, _x]} forEach _combatModes;
{lbAdd [14019, _x]} forEach _formations;
{lbAdd [14020, _x]} forEach _speeds;

_structures = [""];
_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
if (alive _hq) then {_structures = _structures + [_hq]};
_structures = _structures + ((sideJoined) Call WFBE_CO_FNC_GetSideStructures);
_structuresLbl = ["Default"];
lbAdd[14025,"Default"];

{
	if (typeName _x == "OBJECT") then {
		_nearTown = ([_x,towns] Call WFBE_CO_FNC_GetClosestEntity) getVariable 'name';
		_type = [typeOf _x, 'displayName'] Call GetConfigInfo;
		_lbl = _type + ' ' + _nearTown + ' ' + str (round(player distance _x)) + 'M';
		_structuresLbl = _structuresLbl + [_lbl];
		lbAdd[14025,_lbl];
	};
} forEach _structures;

while {alive player && dialog} do {
	if (side player != sideJoined) exitWith {activeAnimMarker = false;closeDialog 0};
	if (!dialog) exitWith {activeAnimMarker = false};

	if (MenuAction == 601) then {if (_mode != 0) then {_updateTab = true};_mode = 0};//--- Team properties.
	if (MenuAction == 602) then {if (_mode != 1) then {_updateTab = true};_mode = 1};//--- Task.
	if (MenuAction == 603) then {if (_mode != 2) then {_updateTab = true};_mode = 2};//--- Task.
	
	_curSel = lbCurSel 14012;
	_isAll = if (_curSel == 0 || (0 in _teams)) then {true} else {false};
	_team = if !(_isAll) then {clientTeams select (_curSel - 1)} else {clientTeams select (_curSel + 1)};
	_teams = lbSelection _listbox_teams;
	
	if (_team_old != _team) then {MenuAction = 1};
	
	if (_updateTab) then {
		_currentIDC = 0;
		switch (_mode) do {
			case 0: {
				{ctrlShow[_x,false]} forEach (_IDCDetails + _IDCTasks);
				{ctrlShow[_x,true]} forEach _IDCTeam;
				ctrlSetText[14021,localize "STR_WF_COMMAND_Behavior"];
				ctrlSetText[14022,localize "STR_WF_COMMAND_CombatMode"];
				ctrlSetText[14030,localize "STR_WF_COMMAND_SquadSettingsLabel"];
				lbClear 14017;
				lbClear 14018;
				{lbAdd [14017, _x]} forEach _behaviors;
				{lbAdd [14018, _x]} forEach _combatModes;
				_updateProperties = true;
				_currentIDC = 14500;
			};
			case 1: {
				{ctrlShow[_x,false]} forEach (_IDCDetails + _IDCTeam);
				{ctrlShow[_x,true]} forEach _IDCTasks;
				lbClear 14017;
				lbClear 14018;
				{lbAdd [14017, _x]} forEach _TaskTypes;
				{lbAdd [14018, _x]} forEach _TaskDurationLabel;
				ctrlSetText[14021,localize "STR_WF_COMMAND_TaskTO_Do" + ":"];
				ctrlSetText[14022,localize "STR_WF_COMMAND_TaskTO_Time" + ":"];
				ctrlSetText[14030,localize "STR_WF_COMMAND_Tasks"];
				lbSetCurSel[14017,0];
				lbSetCurSel[14018,0];
				_currentIDC = 14501;
			};
			case 2: {
				{ctrlShow[_x,false]} forEach (_IDCTasks + _IDCTeam);
				{ctrlShow[_x,true]} forEach _IDCDetails;
				ctrlSetText[14030,localize "STR_WF_COMMAND_SquadManagmentLabel"];
				_detailGroup = if (!_isAll) then {(units(clientTeams select (_curSel - 1))) Call GetLiveUnits} else {[]};
				[_detailGroup,14041] Call UIFillListTeamOrders;
				_enable = if !(isPlayer leader _team) then {true} else {false};
				ctrlEnable [14043,_enable];
				_enable = if !(isPlayer (vehicle leader _team) && vehicle leader _team != leader _team) then {true} else {false};
				ctrlEnable [14042,_enable];
				_currentIDC = 14502;
			};
		};
		_hidc = [14500,14502,14501];
		_hidc = _hidc - [_currentIDC];
		_con = _display DisplayCtrl _currentIDC;
		_con ctrlSetTextColor [1, 1, 1, 1];
		{_con = _display DisplayCtrl _x;_con ctrlSetTextColor [0.4, 0.4, 0.4, 1]} forEach _hidc;
		_updateTab = false;
	};
	
	_txt = (_team) Call GetTeamMoveMode;
	if (_txt == "" || _txt == "towns") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_TakeTowns"};
	if (_txt == "move") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_Move"};
	if (_txt == "patrol") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_Patrol"};
	if (_txt == "defense") then {_txt = localize "STR_WF_COMMAND_Mission" + ": " + localize "STR_WF_COMMAND_Defense"};
	ctrlSetText [14013,_txt];
	
	//--- Team Funds.
	ctrlSetText [14028,Format [localize 'STR_WF_COMMAND_Cash',str ((_team) Call GetTeamFunds)]];
	
	if (MenuAction == 1) then {
		MenuAction = -1;
		activeAnimMarker = false;

		_index = (_team) Call GetTeamType;
		_currentCoord = (_team) Call GetTeamMovePos;
		_currentMission = (_team) Call GetTeamMoveMode;
		if (typeName _currentCoord == "ARRAY") then {
			if (count _currentCoord > 0) then {
				_position = _currentCoord;
				if (_currentMission == "move") then {["TempAnim",_position,"selector_selectedMission",1,"ColorOrange",1,1.2] Spawn MarkerAnim};
				if (_currentMission == "patrol") then {["TempAnim",_position,"selector_selectedMission",1,"ColorYellow",1,1.2,"areaPatrol"] Spawn MarkerAnim};
				if (_currentMission == "defense") then {["TempAnim",_position,"selector_selectedMission",1,"ColorRed",1,1.2] Spawn MarkerAnim};
			};
		};
		if (typeName _currentCoord == "OBJECT") then {
			if (_currentMission == "towns") then {["TempAnim",getPos _currentCoord,"selector_selectedMission",1,"ColorBlue",1,1.2] Spawn MarkerAnim};
		};
		
		_enable = if (isPlayer(leader _team)) then {false} else {true};
		_special = if (_isAll) then {false} else {if !(isPlayer(leader _team)) then {true} else {false}};
		ctrlEnable [14011,_special];
		ctrlEnable [14014,_enable];
		ctrlEnable [14015,_enable];
		
		if (_enable) then {
			_isDisabled = (_team) Call GetTeamAutonomous;
			if (_isDisabled) then {
				ctrlEnable [14014,true];
				ctrlEnable [14015,false];
			} else {
				ctrlEnable [14015,true];
				ctrlEnable [14014,false];
			};
		};
		if (_index == -1) then {_index = 1};
		lbSetCurSel [14010,[14010,_index] Call UIFindLBValue];
		if (_mode == 0) then {
			_updateProperties = true;
			_updateRespawn = true;
		};
		if (_mode == 2) then {
			_detailGroup = if !(_isAll) then {(units(clientTeams select (_curSel - 1))) Call GetLiveUnits} else {[]};
			[_detailGroup,14041] Call UIFillListTeamOrders;
			_enable = if !(isPlayer leader _team) then {true} else {false};
			ctrlEnable [14043,_enable];
		};
	};
	
	//--- Focus.
	if (MenuAction == 2) then {
		MenuAction = -1;
		
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [2,.075,getPos(leader _team)];
		ctrlMapAnimCommit _map;
	};
	
	//--- Focus (AI Sub).
	if (MenuAction == 3) then {
		MenuAction = -1;
		_iddx = lnbCurSelRow 14041;
		if (_iddx != -1) then {
			_map ctrlMapAnimAdd [1,.095,getPos (_detailGroup select _iddx)];
			ctrlMapAnimCommit _map;
		};
	};
	
	//--- Take Towns.
	if (MenuAction == 101) then {
		MenuAction = -1;
		if (!_isAll) then {
			[_team,'towns'] Call SetTeamMoveMode;
		} else {
			{[_x,'towns'] Call SetTeamMoveMode} forEach clientTeams;
		};
		activeAnimMarker = false;
	};
	
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		//--- Move | Patrol | Defend.
		if (MenuAction == 102 || MenuAction == 103 || MenuAction == 104) then {
			_color = "";
			_order = "";
			_isAdded = "";
			switch (MenuAction) do {
				case 102: {_color = "ColorOrange";_order = "MOVE"};
				case 103: {_color = "ColorYellow";_order = "PATROL";_isAdded = "areaPatrol"};
				case 104: {_color = "ColorRed";_order = "DEFENSE"};
			};
			MenuAction = -1;
			_position = _map posScreenToWorld[mouseX,mouseY];
			
			[_curSel,_position,_order,_isAll,_teams] Spawn {
				Private ["_curSel","_isAll","_order","_position","_radio","_radioLabel","_sideTeam","_teams"];
				_curSel = _this select 0;
				_position = _this select 1;
				_order = _this select 2;
				_isAll = _this select 3;
				_teams = _this select 4;
				//_radio = ["all","alpha","bravo","charlie","delta","echo","foxtrot","golf","hotel","india","juliet","kilo","lima","mike","november","oscar","papa","quebec","romeo","sierra","tango","uniform","victor","whiskey","xray","yankee","zulu"];
				_radioLabel = ["All","Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu","Razor","Fatman","StarForce","Frostbite","Battlemage","Manhattan","Firefly","Swordsman","Sabre","Hammer","Reaper","Anvil","Fortune"];
				
				if (!_isAll) then {
					_sideTeam = "Team ";
					for '_i' from 0 to count _teams-1 do {
						_selected = clientTeams select ((_teams select _i) - 1);
						_sideTeam = _sideTeam + (_radioLabel select (_teams select _i));
						if (_i != count _teams -1) then {_sideTeam = _sideTeam + ", "} else {_sideTeam = _sideTeam + " "};
					};
				
					player kbTell [sideHQ, WFBE_V_HQTopicSide, "OrderSent",["1","",_sideTeam,[if (sideJoined == west) then {"blueTeam"} else {"redTeam"}]],["2","","moving to position",["HC_MovingToPosition"]],["3","","over.",["Over1"]],true];
					{
						_selected = clientTeams select (_x - 1);
						[_selected,_position] Call SetTeamMovePos;
						[_selected,_order] Call SetTeamMoveMode;
					} forEach _teams;
				} else {
					player kbTell [sideHQ, WFBE_V_HQTopicSide, "OrderSentAll",["1","","All",["all"]],["2","","moving to position",["HC_MovingToPosition"]],["3","","over.",["Over1"]],true];
					{
						[_x,_position] Call SetTeamMovePos;
						[_x,_order] Call SetTeamMoveMode;
					} forEach clientTeams;			
				};
			};

			activeAnimMarker = false;
			_array = if (_isAdded == "") then {["TempAnim",_position,"selector_selectedMission",1,_color,1,1.2]} else {["TempAnim",_position,"selector_selectedMission",1,_color,1,1.2,_isAdded]};
			_array Spawn MarkerAnim;
		};

		//--- Set a Task.
		if (MenuAction == 306) then {
			MenuAction = -1;
			_taskType = _TaskTypes select (lbCurSel  14017);
			_taskTime = _TaskDuration select (lbCurSel  14018);
			_taskTimeLabel = _TaskDurationLabel select (lbCurSel  14018);
			_position = _map posScreenToWorld[mouseX,mouseY];
			if (!_isAll) then {
				_sideTeam = "Team ";
				for '_i' from 0 to count _teams-1 do {
					_selected = clientTeams select ((_teams select _i) - 1);
					_sideTeam = _sideTeam + (_radioLabel select (_teams select _i));
					if (_i != count _teams -1) then {_sideTeam = _sideTeam + ", "} else {_sideTeam = _sideTeam + " "};
				};
				player kbTell [sideHQ, WFBE_V_HQTopicSide, "OrderSent",["1","",_sideTeam,[if (sideJoined == west) then {"blueTeam"} else {"redTeam"}]],["2","","moving to position",["HC_MovingToPosition"]],["3","","over.",["Over1"]],true];
				
				{
					_selected = clientTeams select (_x - 1);
					if (alive (leader _selected) && isPlayer(leader _selected)) then {
						// if (WF_A2_Vanilla) then {
							[getPlayerUID(leader _selected), "SetTask", [_taskType,_taskTime,_taskTimeLabel,_position]] Call WFBE_CO_FNC_SendToClients;
						// } else {
							// [leader _selected, "SetTask", [_taskType,_taskTime,_taskTimeLabel,_position]] Call WFBE_CO_FNC_SendToClient;
						// };
					};
				} forEach _teams;
			} else {
				player kbTell [sideHQ, WFBE_V_HQTopicSide, "OrderSentAll",["1","","All",["all"]],["2","","moving to position",["HC_MovingToPosition"]],["3","","over.",["Over1"]],true];
				[sideJoined, "SetTask", [_taskType,_taskTime,_taskTimeLabel,_position]] Call WFBE_CO_FNC_SendToClients;
			};
		};
	};
	
	//--- Respawn.
	if (MenuAction == 201) then {
		MenuAction = -1;
		[_team] Spawn {
			Private ["_team"];
			_team = _this select 0;
			_units = Units _team;
			if ((missionNamespace getVariable "WFBE_C_RESPAWN_MOBILE") > 0 || ((missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_MODE") > 0)) then {//--- Make sure that the unit won't spawn back at a camp/ambu.
				[_team,"forceRespawn"] Call SetTeamRespawn;
				sleep 2;
			};
			_units = _units + ([_team,false] Call GetTeamVehicles);
			{_x setDammage 1} forEach _units;
		};
	};
	
	//--- Auto AI.
	if (MenuAction == 301) then {
		MenuAction = -1;
		_isDisabled = (_team) Call GetTeamAutonomous;
		if (_isDisabled) then {
			ctrlEnable [14015,true];
			ctrlEnable [14014,false];
			if (!_isAll) then {
				{
					_selected = clientTeams select (_x - 1);
					[_selected,false] Call SetTeamAutonomous;
				} forEach _teams;
			} else {
				{[_x,false] Call SetTeamAutonomous} forEach clientTeams;
			};
		} else {
			ctrlEnable [14014,true];
			ctrlEnable [14015,false];
			if (!_isAll) then {
				{
					_selected = clientTeams select (_x - 1);
					[_selected,true] Call SetTeamAutonomous;
				} forEach _teams;
			} else {
				{[_x,true] Call SetTeamAutonomous} forEach clientTeams;
			};
		};		
	};
	
	//--- Set buy Type
	if (MenuAction == 302) then {
		MenuAction = -1;
		_curType = lbValue [14010, lbCurSel(14010)];
		if (!_isAll) then {
			{
				_selected = clientTeams select (_x - 1);
				[_selected,_curType] Call SetTeamType;
			} forEach _teams;
		} else {
			{[_x,_curType] Call SetTeamType} forEach clientTeams;
		};
	};	
	
	//--- Set property to team.
	if (MenuAction == 303) then {
		MenuAction = -1;
		_behavior = _behaviors select (lbCurSel(14017));
		_combat = _combatModes select (lbCurSel(14018));
		_formation = _formations select (lbCurSel(14019));
		_speed = _speeds select (lbCurSel(14020));
		
		//--- Locality, process on server.
		_to = sideJoined;
		if (!_isAll) then {
			_to = [];
			{
				_selected = clientTeams select (_x - 1);
				_to = _to + [_selected];
			} foreach _teams;
		};
		
		// WFBE_RequestTeamUpdate = ['SRVFNCREQUESTTEAMUPDATE',[_to,_behavior,_combat,_formation,_speed]];
		// publicVariable 'WFBE_RequestTeamUpdate';
		// if (isHostedServer) then {['SRVFNCREQUESTTEAMUPDATE',[_to,_behavior,_combat,_formation,_speed]] Spawn HandleSPVF};
		["RequestTeamUpdate", [_to,_behavior,_combat,_formation,_speed]] Call WFBE_CO_FNC_SendToServer;
	};	
	
	//--- Set respawn.
	if (MenuAction == 304) then {
		MenuAction = -1;
		_curSel = lbCurSel 14025;
		if (_curSel == -1) then {_curSel = 0};
		if (!_isAll) then {
			{
				_selected = clientTeams select (_x - 1);
				[_selected,(_structures select _curSel)] Call SetTeamRespawn;
			} forEach _teams;
		} else {
			{[_x,(_structures select _curSel)] Call SetTeamRespawn} forEach clientTeams;
		};
	};
	
	//--- Update the respawn info.
	if (_updateRespawn) then {
		_updateRespawn = false;
		_respawn = (_team) Call GetTeamRespawn;
		_id = _structures find _respawn;
		if (_id != -1) then {lbSetCurSel [14025,_id]} else {lbSetCurSel[14025,0]};
	};
	
	//--- Minimap update (Only refresh when the combo is selected).
	if (MenuAction == 305 && _updateProperties) then {MenuAction = -1};
	if (MenuAction == 305) then {
		MenuAction = -1;
		_curSel = lbCurSel 14025;
		if (_curSel == -1) then {_curSel = 0};
		if (typeName (_structures select _curSel) == "OBJECT") then {
			_map ctrlMapAnimAdd [1,.095,getPos (_structures select _curSel)];
			ctrlMapAnimCommit _map;
		};
	};
	
	//--- Units Details.
	if (MenuAction == 401) then {
		MenuAction = -1;
		_iddx = lnbCurSelRow 14041;
		if (_iddx != -1) then {
			_unit = _detailGroup select _iddx;
			_enable = if (!(isPlayer (vehicle _unit)) && vehicle _unit != _unit) then {true} else {false};
			ctrlEnable [14042,_enable];
		};
	};
	
	//--- Units Details (Unflip)
	if (MenuAction == 402) then {
		MenuAction = -1;
		_iddx = lnbCurSelRow 14041;
		if (_iddx != -1) then {
			_unit = _detailGroup select _iddx;
			if ((getPos _unit select 2) < 5) then {
				_unit setPos [getPos _unit select 0,getpos _unit select 1,0.5];
				_unit setVelocity [0,0,-1];
				_detailGroup = if (!_isAll) then {(units(clientTeams select (_curSel - 1))) Call GetLiveUnits} else {[]};
				[_detailGroup,14041] Call UIFillListTeamOrders;
			};
		};
	};
		
	//--- Units Details (Disband)
	if (MenuAction == 403) then {
		MenuAction = -1;
		_iddx = lnbCurSelRow 14041;
		if (_iddx != -1) then {
			_unit = _detailGroup select _iddx;
			_unit setDamage 1;
			_detailGroup = if (!_isAll) then {(units(clientTeams select (_curSel - 1))) Call GetLiveUnits} else {[]};
			[_detailGroup,14041] Call UIFillListTeamOrders;
		};
	};
	
	//--- Update team properties.
	if (_updateProperties) then {
		_updateProperties = false;
		_behavior = behaviour (leader _team);
		_combat = combatMode (leader _team);
		_formation = formation (leader _team);
		_speed = speedMode (leader _team);
		
		//--- Behavior.
		_id =_behaviors find _behavior;
		if (_id != -1) then {lbSetCurSel [14017,_id]};		
		//--- Combat Mode.
		_id =_combatModes find _combat;
		if (_id != -1) then {lbSetCurSel [14018,_id]};		
		//--- Formation.
		_id =_formations find _formation;
		if (_id != -1) then {lbSetCurSel [14019,_id]};		
		//--- Speed.
		_id =_speeds find _speed;
		if (_id != -1) then {lbSetCurSel [14020,_id]};
	};

	//--- Back Button.
	if (MenuAction == 4) exitWith { //---added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
	
	_team_old = _team;
	sleep 0.1;
};

activeAnimMarker = false;
