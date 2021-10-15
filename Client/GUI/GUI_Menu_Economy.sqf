disableSerialization;

_display = _this select 0;
_map = _display DisplayCtrl 23002;

_hqDeployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
if (!_hqDeployed || (missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 0) then {ctrlEnable [23004, false];ctrlEnable [23006, false]};
if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 0) then {ctrlSetText[23005, localize 'STR_WF_Disabled']};

MenuAction = -1;

_maxWorkers = missionNamespace getVariable "WFBE_C_STRUCTURES_WORKERS_MAX";
_workerPrice = missionNamespace getVariable "WFBE_C_STRUCTURES_WORKERS_PRICE";
_incomeSystem = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM";
_incomeDividision = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_DIVIDED";
_supplySystem = missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM";
_aliveWorkers = [];
_workers = [];
_lastWorkersUpdate = -10;
_lastComboUpdate = -30;
_lastPurchase = -5;
_income = 0;
_updateComboWorker = true;
_hasStarted = true;

_lastUse = 0;
ctrlEnable [23016,false];
if (_supplySystem != 0) then {ctrlShow [23016, false]};

if (_incomeSystem in [3,4]) then {
	sliderSetRange[23010,0,missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_PERCENT_MAX"];
	_income = WFBE_Client_Logic getVariable "wfbe_commander_percent";
	sliderSetPosition[23010, _income];
} else {
	ctrlEnable [23012, false];
};

//--- Disable the selling function if the HQ is dead.
if !(alive ((sideJoined) Call WFBE_CO_FNC_GetSideHQ)) then {
	ctrlEnable [23015, false];
};

while {alive player && dialog} do {	
	if (side player != sideJoined) exitWith {closeDialog 0};
	if !(dialog) exitWith {};
	
	_funds = Call GetPlayerFunds;
	
	//--- Income System.
	if (_incomeSystem in [3,4]) then {
		ctrlSetText[23011, Format["%1%2",_income,"%"]];
		_currentPercent = WFBE_Client_Logic getVariable "wfbe_commander_percent";
		
		_income = floor(sliderPosition 23010);
		
		sliderSetPosition[23010, _income];
		
		_calInc = (sideJoined) Call GetTownsIncome;
		
		if (_currentPercent != _income || _hasStarted) then {
			if (_hasStarted) then {_hasStarted = false};
			
			_income_players = 0;
			_income_commander = 0;
			switch (_incomeSystem) do {
				case 3: {
					_income_players = round(_calInc * (((100 - _income)/100)/WFBE_Client_Teams_Count));
					_income_commander = round((_calInc * (_income/100)) / _incomeDividision) + _income_players;
				};
				case 4: {
					_income_players = round(_calInc * (100 - _income) / 100);
					_income_commander = round((_calInc - _income_players)*WFBE_Client_Teams_Count) + _income_players;
				};
			};
			
			ctrlSetText [23013, localize 'STR_WF_ECONOMY_Income_Sys_Com' + ": $" + str(_income_commander)];
			ctrlSetText [23014, localize 'STR_WF_ECONOMY_Income_Sys_Ply' + ": $" + str(_income_players)];
		};
		
		if (MenuAction == 3) then {
			MenuAction = -1;
			
			if (_currentPercent != _income) then {
				WFBE_Client_Logic setVariable ["wfbe_commander_percent", _income, true];
			};
		};
	};
	
	//--- Workers System.
	if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 1) then {
		if (time - _lastComboUpdate > 5) then {
			_updateComboWorker = true;
			_lastComboUpdate = time;
		};
	
		_workers = WFBE_Client_Logic getVariable "wfbe_workers";
		if (time - _lastWorkersUpdate > 5) then {_aliveWorkers = (_workers) Call GetLiveUnits;_lastWorkersUpdate = time};
		_hqDeployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
		
		if (!_hqDeployed || time - _lastPurchase < 3 || count _aliveWorkers >= _maxWorkers || _funds < _workerPrice) then {ctrlEnable [23004, false]} else {ctrlEnable [23004, true]};
		
		//--- Workers tracker.
		if (_updateComboWorker) then {
			_updateComboWorker = false;
			lbClear 23007;
			
			for '_i' from 0 to count(_aliveWorkers)-1 do {
				lbAdd [23007, localize "STR_WF_ECONOMY_Workers" + " " + str(_i+1)];
			};
		};
		
		ctrlSetText [23005, Format ["$%1 (%2/%3)",_workerPrice,count _aliveWorkers,_maxWorkers]];
	};
	
	//--- Hire Workers.
	if (MenuAction == 1) then {
		MenuAction = -1;
		
		//--- Which index.
		_index = 0;
		for '_i' from 0 to count(_workers)-1 do {
			if (isNull (_workers select _i)) exitWith {_index = _i};
		};
		
		if (_index == 0 && count(_workers) > 0) then {_index = count _workers};
		
		if (count _aliveWorkers <= _maxWorkers && _hqDeployed) then {
			-(_workerPrice) Call ChangePlayerFunds;
		
			// WFBE_RequestWorker = ['SRVFNCREQUESTWORKER',[sideJoined,(sideJoined) Call GetSideHQ,_index]];
			// publicVariable 'WFBE_RequestWorker';
			// if (isHostedServer) then {['SRVFNCREQUESTWORKER',[sideJoined,(sideJoined) Call GetSideHQ,_index]] Spawn HandleSPVF};
			["RequestWorker", [sideJoined,(sideJoined) Call WFBE_CO_FNC_GetSideHQ, _index]] Call WFBE_CO_FNC_SendToServer;
			
			_workers set [_index, WF_Logic];
			WFBE_Client_Logic setVariable ["wfbe_workers", _workers, true];
			
			_lastPurchase = time;
			_lastWorkersUpdate = -10;
			_updateComboWorker = true;
		};
	};
	
	//--- Disband Worker.
	if (MenuAction == 2) then {
		MenuAction = -1;
		
		_value = lbCurSel 23007;
		
		if (_value != -1) then {
			(_aliveWorkers select _value) setDammage 1;
			_lastWorkersUpdate = -10;
			_updateComboWorker = true;
		};
	};
	
	//--- ST Handler.
	if (_supplySystem == 0) then {
		_isCommander = false;
		if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_isCommander = true}};
		ctrlEnable [23016,if (time - _lastUse > 5 && _isCommander) then {true} else {false}];
	};
	
	//--- Respawn Supply Trucks.
	if (MenuAction == 4) then {
		MenuAction = -1;
		// WFBE_RequestSpecial = ['SRVFNCREQUESTSPECIAL',["RespawnST",sideJoined]];
		// publicVariable 'WFBE_RequestSpecial';
		// if (isHostedServer) then {['SRVFNCREQUESTSPECIAL',["RespawnST",sideJoined]] Spawn HandleSPVF};
		["RequestSpecial", ["RespawnST",sideJoined]] Call WFBE_CO_FNC_SendToServer;
		_lastUse = time;
	};
	
	//--- Minimap update.
	if (MenuAction == 100) then {
		MenuAction = -1;
		_value = lbCurSel 23007;
		
		if (_value != -1) then {
			ctrlMapAnimClear _map;
			_map ctrlMapAnimAdd [1,.175,getPos(_aliveWorkers select _value)];
			ctrlMapAnimCommit _map;
		};
	};
	
	//added-MrNiceGuy
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		
		//--- Sell Building.
		if (MenuAction == 105) then {
			MenuAction = -1;
			_isCommander = false;
			if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_isCommander = true}};
			if !(_isCommander) exitWith {};
			_position = _map posScreenToWorld[mouseX,mouseY];
			_structures = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;
			_closest = [_position,_structures] Call WFBE_CO_FNC_GetClosestEntity;
			if (!isNull _closest) then {
				//--- 100 meters close only.
				if (_closest distance _position < 100 && isNil {_closest getVariable "WFBE_SOLD"}) then {
					//--- Spawn a sell thread.
					(_closest) Spawn {
						Private ["_closest","_delay","_id","_supplyB","_type"];
						_closest = _this;
						_closest setVariable ["WFBE_SOLD", true];
						_delay = missionNamespace getVariable "WFBE_C_STRUCTURES_SALE_DELAY";
						_type = typeOf _closest;
						
						//--- Inform the side (before).
						// WFBE_LocalizeMessage = [sideJoined,'CLTFNCLOCALIZEMESSAGE',['StructureSell',_type,_delay]];
						// publicVariable 'WFBE_LocalizeMessage';
						[sideJoined, "LocalizeMessage", ['StructureSell',_type,_delay]] Call WFBE_CO_FNC_SendToClients;
						['StructureSell',_type,_delay] Spawn CLTFNCLocalizeMessage;
						
						sleep _delay;
						
						if !(alive _closest) exitWith {};
						
						_id = (missionNamespace getVariable Format ["WFBE_%1STRUCTURENAMES",sideJoinedText]) find _type;
						
						//--- TODO: Change the find system with a getvar system.
						if (_id > 0) then {
							_supplyB = (missionNamespace getVariable Format ["WFBE_%1STRUCTURECOSTS",sideJoinedText]) select _id;
							_supplyB = round((_supplyB * (missionNamespace getVariable "WFBE_C_STRUCTURES_SALE_PERCENT")) / 100);
						
							if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {[sideJoined, _supplyB] Call ChangeSideSupply} else {(_supplyB) Call ChangePlayerFunds};
						};
						
						//--- Inform the side.
						// WFBE_LocalizeMessage = [sideJoined,'CLTFNCLOCALIZEMESSAGE',['StructureSold',_type]];
						// publicVariable 'WFBE_LocalizeMessage';
						[sideJoined, "LocalizeMessage",['StructureSold',_type]] Call WFBE_CO_FNC_SendToClients;
						['StructureSold',_type] Spawn CLTFNCLocalizeMessage;
						if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 1) then {_closest setVariable ["sold",true,true]};
						_closest setDammage 1;
					};
				};
			};
		};
	};
	
	sleep 0.1;
	
	//--- Back Button.
	if (MenuAction == 5) exitWith { //---added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};