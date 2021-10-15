disableSerialization;

_display = _this select 0;
MenuAction = -1;

_currentVD = viewDistance;
_funds = Call GetPlayerFunds;

if (votePopUp) then {
	ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOffButton"];
} else {
	ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOnButton"];
};

ctrlSetText [13002, Format [localize "STR_WF_TEAM_ViewDistanceLabel",_currentVD]];
ctrlSetText [13004, Format [localize "STR_WF_TEAM_TerrainGridLabel",currentTG]];
ctrlSetText [13006, Format [localize "STR_WF_TEAM_MoneyTransfer",0]];
ctrlSetText [13010, Format [localize "STR_WF_Income",Call GetPlayerFunds,(sideJoined) Call GetIncome]];

SliderSetRange[13003, 1, missionNamespace getVariable "WFBE_C_ENVIRONMENT_MAX_VIEW"];
SliderSetRange[13005, 1, missionNamespace getVariable "WFBE_C_ENVIRONMENT_MAX_CLUTTER"];
SliderSetRange[13007,0,_funds];
SliderSetPosition[13003,_currentVD];
SliderSetPosition[13005,currentTG];
_lastvd = _currentVD;
_lasttg = currentTG;	
_timer = 0;

_i = 1;
{
	_xtra = if (isPlayer (leader _x)) then {name (leader _x)} else {"AI"};
	lbAdd[13008,Format ["[%1] %2",_i,_xtra]];
	_i = _i + 1;
} forEach clientTeams; 
lbSetCurSel[13008,0];

_units = ((units group player) Call GetLiveUnits);
_units = _units - [player];
{
	_desc = [typeOf _x, 'displayName'] Call GetConfigInfo;
	_finalNumber = (_x) Call GetAIDigit;
	_isInVehicle = "";
	if (_x != vehicle _x) then {
		_descVehi = [typeOf (vehicle _x), 'displayName'] Call GetConfigInfo;
		_isInVehicle = " [" + _descVehi + "] ";
	};
	_txt = "["+_finalNumber+"] "+ _desc + _isInVehicle;
	lbAdd[13013,_txt];
} forEach _units;
lbSetCurSel[13013,0];

{lbAdd[13018,_x]} forEach ["None","FX 1","FX 2","FX 3","FX 4","FX 5"];
lbSetCurSel[13018,currentFX];

while {alive player && dialog} do {
	sleep 0.05;
	
	if (Side player != sideJoined) exitWith {closeDialog 0};
	if (!dialog) exitWith {};
	
	_curSel = lbCurSel 13008;
	_currentVD = Floor (SliderPosition 13003);
	currentTG = Floor (SliderPosition 13005);
	_transferAmount = Floor (SliderPosition 13007);
	
	ctrlSetText [13002, Format [localize "STR_WF_TEAM_ViewDistanceLabel",_currentVD]];
	ctrlSetText [13004, Format [localize "STR_WF_TEAM_TerrainGridLabel",currentTG]];
	ctrlSetText [13006, Format [localize "STR_WF_TEAM_MoneyTransfer",_transferAmount]];
	
	if (MenuAction == 1) then {
		MenuAction = -1;
		if ((_transferAmount != 0)&&((clientTeams select _curSel) != group player)) then {
			[(clientTeams select _curSel),_transferAmount] Call ChangeTeamFunds;
			-_transferAmount Call ChangePlayerFunds;
			_funds = Call GetPlayerFunds;
			if (isPlayer leader (clientTeams select _curSel)) then {
				// if (WF_A2_Vanilla) then {
					[getPlayerUID(leader (clientTeams select _curSel)), "LocalizeMessage",['FundsTransfer',_transferAmount,name player]] Call WFBE_CO_FNC_SendToClients;
				// } else {
					// [leader (clientTeams select _curSel), "LocalizeMessage",['FundsTransfer',_transferAmount,name player]] Call WFBE_CO_FNC_SendToClient;
				// };
			};
			sliderSetRange[13007,0,_funds];
		};
	};
	
	if (MenuAction == 3) then {
		MenuAction = -1;
		_curUnitSel = lbCurSel 13013;
		if (_curUnitSel != -1) then {
			_vehicle = vehicle (_units select _curUnitSel);
			_destroy = [(_units select _curUnitSel)];
			if (_vehicle != (_units select _curUnitSel)) then {_destroy = _destroy + [_vehicle]};
			{
				if !(isPlayer _x) then {
					if (_x isKindOf 'Man') then {removeAllWeapons _x};
					_x setDammage 1;
				};
			} forEach _destroy;
			
			_units = ((units group player) Call GetLiveUnits);
			_units = _units - [leader group player];
			lbClear 13013;
			{
				_desc = [typeOf _x, 'displayName'] Call GetConfigInfo;
				_finalNumber = (_x) Call GetAIDigit;
				_isInVehicle = "";
				if (_x != vehicle _x) then {
					_descVehi = [typeOf (vehicle _x), 'displayName'] Call GetConfigInfo;
					_isInVehicle = " [" + _descVehi + "] ";
				};
				_txt = "["+_finalNumber+"] "+ _desc + _isInVehicle;
				lbAdd[13013,_txt];
			} forEach _units;
			lbSetCurSel[13013,0];
		};
	};
	
	if (MenuAction == 6) then {
		MenuAction = -1;
		currentFX = lbCurSel 13018;
		[currentFX] Spawn FX;
	};
	
	//--- Vote Pop-Up //added-MrNiceGuy
	if (MenuAction == 13) then {
		MenuAction = -1;
		if (votePopUp) then {
			votePopUp = false;
			ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOnButton"];
		} else {
			votePopUp = true;
			ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOffButton"];
		};
	};
	
	//--- WF3 Adv Funds transfers.
	if (MenuAction == 101) exitWith {
		MenuAction = -1;
		closeDialog 0;
		createDialog "WFBE_TransferMenu";
	};
	
	if (_currentVD != _lastvd) then {setViewDistance _currentVD};
	if (currentTG != _lasttg) then {setTerrainGrid currentTG};
	_lastvd = _currentVD;
	_lasttg = currentTG;
	
	if (_timer > 2) then {ctrlSetText [13010, Format [localize "STR_WF_Income",Call GetPlayerFunds,(sideJoined) Call GetIncome]];_timer = 0};
	_timer = _timer + 0.05;
	
	//--- Back Button.
	if (MenuAction == 8) exitWith { //---added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};
