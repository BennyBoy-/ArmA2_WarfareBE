scriptName "Client\GUI\GUI_GroupsMenu.sqf";

//--- Register the UI.
uiNamespace setVariable ["wfbe_display_groups", _this select 0];

{_leader = if !(isNull leader _x) then {name leader _x} else {"No leader"}; lnbAddRow[508001, [Format["%1",_x],_leader]];} forEach WFBE_Client_Teams;
lnbSetCurSelRow[508001, 0];

((uiNamespace getVariable "wfbe_display_groups") displayCtrl 508004) ctrlSetStructuredText (parseText "<t align='left' color='#42b6ff' size='1.2' underline='1' shadow='1'>Group Members:</t>");
((uiNamespace getVariable "wfbe_display_groups") displayCtrl 508005) ctrlSetStructuredText (parseText "<t align='left' color='#42b6ff' size='1.2' underline='1' shadow='1'>Groups:</t>");
((uiNamespace getVariable "wfbe_display_groups") displayCtrl 508006) ctrlSetStructuredText (parseText "<t align='left' color='#42b6ff' size='1.2' underline='1' shadow='1'>Requests:</t>");
_join_group = false;_update_group = true;_accept_request = false;_deny_request = false;_kick_member = false;
_update_list = time;
_update_requests = -500;
_group_units = [];

WFBE_MenuAction = -1;

while {alive player && dialog} do {
	if (WFBE_MenuAction == 1) then {WFBE_MenuAction = -1; _join_group = true};
	if (WFBE_MenuAction == 2) then {WFBE_MenuAction = -1; _update_group = true};
	if (WFBE_MenuAction == 3) then {WFBE_MenuAction = -1; _accept_request = true};
	if (WFBE_MenuAction == 4) then {WFBE_MenuAction = -1; _deny_request = true};
	if (WFBE_MenuAction == 5) then {WFBE_MenuAction = -1; _kick_member = true};
	
	if (time - _update_list > 2) then {
		_update_list = time;
		for '_i' from 0 to WFBE_Client_Teams_Count do {
			_leader = if !(isNull leader (WFBE_Client_Teams select _i)) then {name leader (WFBE_Client_Teams select _i)} else {"No leader"};
			if ((((uiNamespace getVariable "wfbe_display_groups") displayCtrl 508001) lnbText [_i, 1]) != _leader) then {lnbSetText [508001, [_i, 1], _leader]};
		};
	};
	
	if (_accept_request) then {
		_accept_request = false;
		_ui_lnb_sel = lnbCurSelRow(508007);
		if (_ui_lnb_sel != -1) then {Call WFBE_CL_FNC_UI_Groups_RequestAccept};
	};
	
	if (_deny_request) then {
		_deny_request = false;
		_ui_lnb_sel = lnbCurSelRow(508007);
		if (_ui_lnb_sel != -1) then {Call WFBE_CL_FNC_UI_Groups_RequestDeny};
	};
	
	if (_kick_member) then {
		_kick_member = false;
		_ui_lnb_sel = lnbCurSelRow(508007);
		if (group player == WFBE_Client_Team && _ui_lnb_sel != -1) then {Call WFBE_CL_FNC_UI_Groups_Kick};
	};
	
	if (time - _update_requests > 2) then {
		_update_requests = time;
		
		//--- Current request present in the client variable.
		_uids_clients = [];
		{[_uids_clients, _x select 0] Call WFBE_CO_FNC_ArrayPush} forEach WFBE_Client_PendingRequests;
		
		//--- Remove the request that are no long there or timed out.
		_uids_presents = [];
		for '_i' from 0 to ((lnbSize 508007) select 0)-1 do {
			_data = lnbData[508007,[_i, 1]];
			if !(_data in _uids_clients) then {
				lnbDeleteRow [508007, _i];
			} else {
				if (_data in _uids_presents) then {
					lnbDeleteRow [508007, _i];
				} else {
					[_uids_presents, _data] Call WFBE_CO_FNC_ArrayPush;
				};
			};
		};
		
		//--- Add potential skipped requests.
		{
			if !((_x select 0) in _uids_presents) then {
				lnbAddRow[508007, ["Join", _x select 1]];
				lnbSetData[508007, [((lnbSize 508007) select 0)-1, 0], "Join"];
				lnbSetData[508007, [((lnbSize 508007) select 0)-1, 1], _x select 0];
			};
		} forEach WFBE_Client_PendingRequests;
	};
	
	if (_update_group) then {
		_update_group = false;
		_ui_lnb_sel = lnbCurSelRow(508001);
		if (_ui_lnb_sel != -1) then {
			_group = WFBE_Client_Teams select _ui_lnb_sel;
			_units = (units _group) Call WFBE_CO_FNC_GetLiveUnits;
			_players = {isPlayer _x} count _units;
			_ai = (count _units) - _players;
			_group_units = _units;
			
			((uiNamespace getVariable "wfbe_display_groups") displayCtrl 508002) ctrlSetStructuredText (parseText Format["<t align='left' color='#42b6ff' size='1.2' underline='1' shadow='1'>Group Properties:</t><br /><br /><t color='#42b6ff' align='left' >Players:</t> <t align='right'><t color='#F5D363'>%1</t>/<t color='#F56363'>%2</t></t><br /><t color='#42b6ff' align='left'>AI Units:</t> <t color='#F5D363' align='right'>%3</t>",_players,missionNamespace getVariable "WFBE_C_PLAYERS_SQUADS_MAX_PLAYERS",_ai]);
			
			//--- Update the units aswell.
			lnbClear 508003;
			[_units, 508003] Call WFBE_CL_FNC_UI_Groups_FillUnits;
		};
	};
	
	if (_join_group) then {
		_join_group = false;
		_ui_lnb_sel = lnbCurSelRow(508001);
		if (_ui_lnb_sel != -1) then {(WFBE_Client_Teams select _ui_lnb_sel) Call WFBE_CL_FNC_UI_Groups_Join};
	};
	
	//--- Go back to the main menu.
	if (WFBE_MenuAction == 1000) exitWith {
		WFBE_MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
	
	sleep .01;
};

//--- Release the UI.
uiNamespace setVariable ["wfbe_display_groups", nil];