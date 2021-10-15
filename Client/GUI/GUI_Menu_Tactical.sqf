disableSerialization;

_display = _this select 0;
_lastRange = artyRange;
_lastUpdate = 0;
_listBox = 17019;

sliderSetRange[17005, 10, missionNamespace getVariable "WFBE_C_ARTILLERY_AREA_MAX"];
sliderSetPosition[17005, artyRange];

ctrlSetText [17025,localize "STR_WF_TACTICAL_ArtilleryOverview" + ":"];

_markers = [];
_FTLocations = [];
_checks = [];
_fireTime = 0;
_status = 0;
_canFT = false;
_forceReload = true;
_ft = missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL";
_ftr = missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL_RANGE";
_startPoint = objNull;

_marker = "artilleryMarker";
createMarkerLocal [_marker,artyPos];
_marker setMarkerTypeLocal "mil_destroy";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerSizeLocal [1,1];

_area = "artilleryAreaMarker";
createMarkerLocal [_area,artyPos];
_area setMarkerShapeLocal "Ellipse";
_area setMarkerColorLocal "ColorRed";
_area setMarkerSizeLocal [artyRange,artyRange];

_map = _display DisplayCtrl 17002;
_listboxControl = _display DisplayCtrl _listBox;

_pard = missionNamespace getVariable "WFBE_C_PLAYERS_SUPPORT_PARATROOPERS_DELAY";
{lbAdd[17008,_x]} forEach (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_DISPLAY_NAME",sideJoinedText]);
lbSetCurSel[17008,0];

_IDCS = [17005,17006,17007,17008];
if ((missionNamespace getVariable "WFBE_C_ARTILLERY") == 0) then {{ctrlEnable [_x,false]} forEach _IDCS};

{ctrlEnable [_x, false]} forEach [17010,17011,17012,17013,17014,17015,17017,17018,17020];

_currentValue = -1;
_currentFee = -1;
_currentSpecial = "";
_currentFee = -1;

//--- Support List.
_lastSel = -1;
_addToList = [localize 'STR_WF_TACTICAL_FastTravel',localize 'STR_WF_ICBM',localize 'STR_WF_TACTICAL_ParadropAmmo',localize 'STR_WF_TACTICAL_ParadropVehicle',localize 'STR_WF_TACTICAL_Paratroop',localize 'STR_WF_TACTICAL_UnitCam',localize 'STR_WF_TACTICAL_UAV',localize 'STR_WF_TACTICAL_UAVDestroy',localize 'STR_WF_TACTICAL_UAVRemoteControl'];
_addToListID = ["Fast_Travel","ICBM","Paradrop_Ammo","Paradrop_Vehicle","Paratroopers","Units_Camera","UAV","UAV_Destroy","UAV_Remote_Control"];
_addToListFee = [0,150000,9500,3500,8500,0,12500,0,0];
_addToListInterval = [0,1000,800,600,900,0,0,0,0];

for '_i' from 0 to count(_addToList)-1 do {
	lbAdd [_listBox,_addToList select _i];
	lbSetValue [_listBox, _i, _i];
};

lbSort _listboxControl;

//--- Artillery Mode.
_mode = missionNamespace getVariable 'WFBE_V_ARTILLERYMINMAP';
if (isNil '_mode') then {_mode = 2;missionNamespace setVariable ['WFBE_V_ARTILLERYMINMAP',_mode]};
_trackingArray = [];
_trackingArrayID = [];
_lastArtyUpdate = -60;
_minRange = 100;
_maxRange = 200;
_requestMarkerTransition = false;
_requestRangedList = true;
_startLoad = true;

//--- Startup coloration.
with uinamespace do {
	currentBEDialog = _display;
	switch (_mode) do {
		case 0: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [1,1,1,1]};
		case 1: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0,0.635294,0.909803,1]};
		case 2: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0.6,0.850980,0.917647,1]};
	};
};

lbSetCurSel[_listbox, 0];

if ((missionNamespace getVariable "WFBE_C_ARTILLERY") == 0) then {
	(_display displayCtrl 17016) ctrlSetStructuredText (parseText Format['<t align="right" color="#FF4747">%1</t>',localize 'STR_WF_Disabled']);
};

_textAnimHandler = [] spawn {};

MenuAction = -1;
mouseButtonUp = -1;

while {alive player && dialog} do {
	if (side player != sideJoined) exitWith {deleteMarkerLocal _marker;deleteMarkerLocal _area;{deleteMarkerLocal _x} forEach _markers;closeDialog 0};
	if (!dialog) exitWith {deleteMarkerLocal _marker;deleteMarkerLocal _area;{deleteMarkerLocal _x} forEach _markers};
	
	_currentUpgrades = (sideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
	
	if (_ft > 0) then {
		//--- TODO: Travel fee, mod parameter > FT free or pay, do a clt fct.
		_currentLevel = _currentUpgrades select WFBE_UP_FASTTRAVEL;
		if (time - _lastUpdate > 15 && _currentLevel > 0) then {
			{deleteMarkerLocal _x} forEach _markers;
			_markers = [];
			_FTLocations = [];
			_canFT = false;
			_startPoint = objNull;
			_lastUpdate = time;
			_base = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
			_isDeployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
			if (player distance _base < _ftr && alive _base && vehicle player != _base && _isDeployed) then {
				_canFT = true;
				_startPoint = _base;
			} else {
				_closest = [player,towns] Call WFBE_CO_FNC_GetClosestEntity;
				_sideID = _closest getVariable "sideID";
				_camps = [_closest,sideJoined] Call GetFriendlyCamps;
				_allCamps = _closest getVariable "camps";
				if (_sideID == sideID && player distance _closest < _ftr && (count _camps == count _allCamps)) then {_canFT = true;_startPoint = _closest} else {
					_buildings = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;
					_checks = [sideJoined,missionNamespace getVariable Format ["WFBE_%1COMMANDCENTERTYPE",sideJoinedText],_buildings] Call GetFactories;
					if (count _checks > 0) then {
						_closest = [player,_checks] Call WFBE_CO_FNC_GetClosestEntity;
						if (player distance _closest < _ftr) then {
							_canFT = true;
							_startPoint = _closest;
						};
					};
				};
			};
			if (!canMove (vehicle player)) then {_canFT = false};
			if (_canFT) then {
				_buildings = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;
				_checks = [sideJoined,missionNamespace getVariable Format ["WFBE_%1COMMANDCENTERTYPE",sideJoinedText],_buildings] Call GetFactories;
				_locations = towns + _checks;
				if (alive _base && _isDeployed) then {_locations = _locations + [_base]};
				_i = 0;
				_fee = 0;
				_funds = if (_ft == 2) then {Call GetPlayerFunds} else {0};
				{
					if (_x distance player <= (missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL_RANGE_MAX") && _x distance player > _ftr) then {
						_skip = false;
						if (_x in towns) then {
							_sideID = _x getVariable "sideID";
							_camps = [_x,sideJoined] Call GetFriendlyCamps;
							_allCamps = _x getVariable "camps";
							if (_sideID != sideID || (count _camps != count _allCamps)) then {_skip = true};
							if (_ft == 2) then {
								_fee = round(((_x distance player)/1000) * (missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL_PRICE_KM"));
								if (_funds < _fee) then {_skip = true};
							};
						};
						if !(_skip) then {
							_FTLocations = _FTLocations + [_x];
							_markerName = Format ["FTMarker%1",_i];
							_markers = _markers + [_markerName];
							createMarkerLocal [_markerName,getPos _x];
							_markerName setMarkerTypeLocal "mil_circle";
							_markerName setMarkerColorLocal "ColorYellow";
							_markerName setMarkerSizeLocal [1,1];
							//--- Fee, Cheap marker stuff, TBD: Add prompt or something.
							if (_ft == 2) then {
								_markerName = Format ["FTMarker%1%1",_i];
								_markers = _markers + [_markerName];
								createMarkerLocal [_markerName,[(getPos _x select 0)-5,(getPos _x select 1)+75]];
								_markerName setMarkerTypeLocal "mil_circle";
								_markerName setMarkerColorLocal "ColorYellow";
								_markerName setMarkerSizeLocal [0,0];
								_markerName setMarkerTextLocal Format ["$%1",_fee];
							};
							_i = _i + 1;
						};
					};
				} forEach _locations;
			};
		};
	};
	
	_currentSel = lbCurSel(_listBox);
	
	//--- Special changed or a reload is requested.
	if (_currentSel != _lastSel || _forceReload) then {
		_currentValue = lbValue[_listBox, _currentSel];
		
		_currentSpecial = _addToListID select _currentValue;
		_currentFee = _addToListFee select _currentValue;
		_currentInterval = _addToListInterval select _currentValue;
		
		_forceReload = false;
		_controlEnable = false;
		
		_funds = Call GetPlayerFunds;
		
		//ctrlSetText[17021,Format ["%1: $%2",localize 'STR_WF_Price',_currentFee]]; //---old
		ctrlSetText[17021,Format ["$%1",_currentFee]]; //---added-MrNiceGuy
		
		//--- Enabled or disabled?
		switch (_currentSpecial) do {
			case "Fast_Travel": {
				if (_ft > 0) then {
					_currentLevel = _currentUpgrades select WFBE_UP_FASTTRAVEL;
					_controlEnable = if (count _FTLocations > 0 && _currentLevel > 0) then {true} else {false};
				};
			};
			case "ICBM": {
				if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_ICBM") > 0) then {
					_commander = false;
					if (!isNull(commanderTeam)) then {
						if (commanderTeam == group player) then {_commander = true};
					};
					_currentLevel = _currentUpgrades select WFBE_UP_ICBM;
					_controlEnable = if (_currentLevel > 0 && _commander && _funds >= _currentFee) then {true} else {false};
				};
			};
			case "Paratroopers": {
				_currentLevel = _currentUpgrades select WFBE_UP_PARATROOPERS;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && time - lastParaCall > _currentInterval) then {true} else {false};
			};
			case "Paradrop_Ammo": {
				_currentLevel = _currentUpgrades select WFBE_UP_SUPPLYPARADROP;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && time - lastSupplyCall > _currentInterval) then {true} else {false};
			};
			case "Paradrop_Vehicle": {
				_currentLevel = _currentUpgrades select WFBE_UP_SUPPLYPARADROP;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && time - lastSupplyCall > _currentInterval) then {true} else {false};
			};
			case "UAV": {
				_currentLevel = _currentUpgrades select WFBE_UP_UAV;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && !(alive playerUAV)) then {true} else {false};
			};
			case "UAV_Destroy": {
				_controlEnable = if (alive playerUAV) then {true} else {false};
			};
			case "UAV_Remote_Control": {
				_controlEnable = if (alive playerUAV) then {true} else {false};
			};
			case "Units_Camera": {
				_controlEnable = commandInRange;
			};
		};
		
		ctrlEnable[17020, _controlEnable];
		MenuAction = -1;
	};
	
	//--- Request Asset.
	if (MenuAction == 20) then {
		MenuAction = -1;
		
		//--- Output.
		switch (_currentSpecial) do {
			case "Fast_Travel": {
				MenuAction = 7;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn SetControlFadeAnim;
			};
			case "ICBM": {
				MenuAction = 8;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn SetControlFadeAnim;
			};
			case "Paratroopers": {
				MenuAction = 3;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn SetControlFadeAnim;
			};
			case "Paradrop_Ammo": {
				MenuAction = 10;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn SetControlFadeAnim;
			};
			case "Paradrop_Vehicle": {
				MenuAction = 9;
				
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn SetControlFadeAnim;
			};
			case "UAV": {
				closeDialog 0;
				ExecVM "Client\Module\UAV\uav.sqf";
			};
			case "UAV_Destroy": {
				if !(isNull playerUAV) then {
					{_x setDammage 1} forEach (crew playerUAV);
					playerUAV setDammage 1;
					playerUAV = objNull;
				};
			};
			case "UAV_Remote_Control": {
				closeDialog 0;
				ExecVM "Client\Module\UAV\uav.sqf";
			};
			case "Units_Camera": {
				closeDialog 0;
				createDialog "RscMenu_UnitCamera";
			};
		};
		
		// _forceReload = true;
	};
	
	artyRange = floor (sliderPosition 17005);
	if (_lastRange != artyRange) then {_area setMarkerSizeLocal [artyRange,artyRange];};
	
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		//--- Set Artillery Marker on map.
		if (MenuAction == 1) then {
			MenuAction = -1;
			artyPos = _map posScreenToWorld[mouseX,mouseY];
			_marker setMarkerPosLocal artyPos;
			_area setMarkerPosLocal artyPos;
			_requestRangedList = true;
		};
		//--- Paratroops.
		if (MenuAction == 3) then {
			MenuAction = -1;
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call SetControlFadeAnimStop;
			_callPos = _map posScreenToWorld[mouseX,mouseY];
			if (!surfaceIsWater _callPos) then {
				lastParaCall = time;
				-(_currentFee) Call ChangePlayerFunds;
				["RequestSpecial", ["Paratroops",sideJoined,_callPos,clientTeam]] Call WFBE_CO_FNC_SendToServer;
				
				hint (localize "STR_WF_INFO_Paratroop_Info");
			};
		};
		//--- Fast Travel.
		if (MenuAction == 7) then {
			MenuAction = -1;
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call SetControlFadeAnimStop;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			_destination = [_callPos,_FTLocations] Call WFBE_CO_FNC_GetClosestEntity;
			if (_callPos distance _destination < 500) then {
				closeDialog 0;
				deleteMarkerLocal _marker;
				deleteMarkerLocal _area;
				
				//--- Remove Markers.
				{
					_track = (_x select 0);
					_vehicle = (_x select 1);
					
					_vehicle setVariable ['WFBE_A_Tracked', nil];

					deleteMarkerLocal Format ["WFBE_A_Large%1",_track];
					deleteMarkerLocal Format ["WFBE_A_Small%1",_track];
				} forEach _trackingArrayID;
				_mode = -1;

				if (_ft == 2) then {
					_fee = round(((player distance _destination)/1000) * (missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL_PRICE_KM"));
					-(_fee) Call ChangePlayerFunds;
				};
				
				_travelingWith = [];
				{if (_x distance _startPoint < _ftr && !(_x in _travelingWith) && canMove _x && !(vehicle _x isKindOf "StaticWeapon") && !stopped _x && !((currentCommand _x) in ["WAIT","STOP"])) then {_travelingWith = _travelingWith + [vehicle _x]}} forEach units (group player);
				
				ForceMap true;
				_compass = shownCompass;
				_GPS = shownGPS;
				_pad = shownPad;
				_radio = shownRadio;
				_watch = shownWatch;

				showCompass false;
				showGPS false;
				showPad false;
				showRadio false;
				showWatch false;

				mapAnimClear;
				mapAnimCommit;

				_locationPosition = getPos _destination;
				_camera = "camera" camCreate _locationPosition;
				_camera camSetDir 0;
				_camera camSetFov 1;
				_camera cameraEffect["Internal","TOP"];

				_camera camSetTarget _locationPosition;
				_camera camSetPos [_locationPosition select 0,(_locationPosition select 1) + 2,100];
				_camera camCommit 0;
				
				mapAnimAdd [0,0.05,GetPos _startPoint];
				mapAnimCommit;
				
				_delay = ((_startPoint distance _destination) / 50) * (missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL_TIME_COEF");
				mapAnimAdd [_delay,.18,getPos _destination];
				mapAnimCommit;
				
				waitUntil {mapAnimDone || !alive player};
				_skip = false;
				if (!alive player) then {_skip = true};
				if (!_skip) then {
					{[_x,_locationPosition,120] Call PlaceSafe} forEach _travelingWith;
				};
				sleep 1;
				
				ForceMap false;
				showCompass _compass;
				showGPS _GPS;
				showPad _pad;
				showRadio _radio;
				showWatch _watch;
				
				_camera cameraEffect["TERMINATE","BACK"];
				camDestroy _camera;
			};
		};
		//--- ICBM Strike.
		if (MenuAction == 8) then {
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call SetControlFadeAnimStop;
			MenuAction = -1;
			-_currentFee Call ChangePlayerFunds;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			_obj = "HeliHEmpty" createVehicle _callPos;
			_nukeMarker = createMarkerLocal ["icbmstrike", position _obj];
			_nukeMarker setMarkerTypeLocal "mil_warning";
			_nukeMarker setMarkerTextLocal "ICBM";
			_nukeMarker setMarkerColorLocal "ColorRed";
			[_obj,_nukeMarker] Spawn NukeIncomming;
		};
		//--- Vehicle Paradrop.
		if (MenuAction == 9) then {
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call SetControlFadeAnimStop;
			MenuAction = -1;
			lastSupplyCall = time;
			-_currentFee Call ChangePlayerFunds;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			["RequestSpecial", ["ParaVehi",sideJoined,_callPos,clientTeam]] Call WFBE_CO_FNC_SendToServer;
		};
		//--- Ammo Paradrop.
		if (MenuAction == 10) then {
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call SetControlFadeAnimStop;
			MenuAction = -1;
			lastSupplyCall = time;
			-_currentFee Call ChangePlayerFunds;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			["RequestSpecial", ["ParaAmmo",sideJoined,_callPos,clientTeam]] Call WFBE_CO_FNC_SendToServer;
		};
	};
	
	//--- Update the Artillery Status.
	if ((missionNamespace getVariable "WFBE_C_ARTILLERY") > 0) then {
		_fireTime = (missionNamespace getVariable "WFBE_C_ARTILLERY_INTERVALS") select (_currentUpgrades select WFBE_UP_ARTYTIMEOUT);
		_status = round(_fireTime - (time - fireMissionTime));
		_txt = if (time - fireMissionTime > _fireTime) then {Format['<t align="left" color="#73FF47">%1</t>',localize 'STR_WF_TACTICAL_Available']} else {Format ['<t align="left" color="#4782FF">%1 %2</t>',_status,localize 'STR_WF_Seconds']};
		(_display displayCtrl 17016) ctrlSetStructuredText (parseText _txt);
		_enable = if (_status > 0) then {false} else {true};
		ctrlEnable [17007,_enable];
	};
	
	//--- Request Fire Mission.
	if (MenuAction == 2) then {
		MenuAction = -1;
		_units = [Group player,false,lbCurSel(17008),sideJoinedText] Call GetTeamArtillery;
		if (Count _units > 0) then {
			fireMissionTime = time;
			[GetMarkerPos "artilleryMarker",lbCurSel(17008)] Spawn RequestFireMission;
		} else {
			hint (localize "STR_WF_INFO_NoArty");
		};			
	};
	
	//--- Arty Combo Change or Script init.
	if (MenuAction == 200 || _startLoad) then {
		MenuAction = -1;
		
		_index = lbCurSel(17008);
		_minRange = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_RANGES_MIN",sideJoined]) select _index;
		_maxRange = round(((missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_RANGES_MAX",sideJoined]) select _index) / (missionNamespace getVariable "WFBE_C_ARTILLERY"));

		_trackingArray = [group player,true,lbCurSel(17008),sideJoined] Call GetTeamArtillery;
		
		_requestMarkerTransition = true;
		_requestRangedList = true;
		_startLoad = false;
	};
	
	//--- Focus on an artillery cannon.
	if (MenuAction == 60) then {
		MenuAction = -1;
		
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [1,.475,getPos(_trackingArray select (lnbCurSelRow 17024))];
		ctrlMapAnimCommit _map;
	};
	
	//--- Flush on change.
	if (_requestMarkerTransition) then {
		_requestMarkerTransition = false;
		
		{
			_track = (_x select 0);
			_vehicle = (_x select 1);

			_vehicle setVariable ['WFBE_A_Tracked', nil];
			deleteMarkerLocal Format ["WFBE_A_Large%1",_track];
			deleteMarkerLocal Format ["WFBE_A_Small%1",_track];
		} forEach _trackingArrayID;
		_trackingArrayID = [];
	};
	
	//--- Artillery List.
	if ((missionNamespace getVariable "WFBE_C_ARTILLERY") > 0 && (_requestRangedList || time - _lastArtyUpdate > 3)) then {
		_requestRangedList = false;
		
		//--- No need to update the list all the time.
		if (time - _lastArtyUpdate > 5) then {
			_lastArtyUpdate = time;
			_trackingArray = [group player,true,lbCurSel(17008),sideJoined] Call GetTeamArtillery;
		};
		
		//--- Clear & Fill;
		lnbClear 17024;
		_i = 0;
		{
			_distance = _x distance (getMarkerPos _marker);
			_color = [0, 0.875, 0, 0.8];
			_text = localize 'STR_WF_TACTICAL_ArtilleryInRange'; 																		//---changed-MrNiceGuy //"In Range";
			if (_distance > _maxRange) then {_color = [0.875, 0, 0, 0.8];_text = localize 'STR_WF_TACTICAL_ArtilleryOutOfRange'}; 		 //---changed-MrNiceGuy //"Out of Range"};
			if (_distance <= _minRange) then {_color = [0.875, 0.5, 0, 0.8];_text = localize 'STR_WF_TACTICAL_ArtilleryRangeTooClose'}; //---changed-MrNiceGuy //"Too close"};
			lnbAddRow [17024,[[typeOf _x, 'displayName'] Call GetConfigInfo,_text]];
			lnbSetPicture [17024,[_i,0],[typeOf _x, 'picture'] Call GetConfigInfo];
			
			lnbSetColor [17024,[_i,0],_color];
			lnbSetColor [17024,[_i,1],_color];
			
			_i = _i + 1;
		} forEach _trackingArray;
	};
	
	//--- Artillery map toggle.
	if (MenuAction == 40) then {
		MenuAction = -1;
		if (_mode == -1) then {_mode = 0};
		_mode = if (_mode == 2) then {0} else {_mode + 1};
		with uinamespace do {
			switch (_mode) do {
				case 0: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [1,1,1,1]};
				case 1: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0,0.635294,0.909803,1]};
				case 2: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0.6,0.850980,0.917647,1]};
			};
		};
		
		if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
		_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ArtilleryMinimapInfo',7,"ff9900"] spawn SetControlFadeAnim;
		
		missionNamespace setVariable ['WFBE_V_ARTILLERYMINMAP',_mode];
		
		_requestMarkerTransition = true;
	};
	
	//--- Update artillery display.
	if (_mode != -1) then {
	
		//--- Nothing.
		if (_mode == 0) then {
			_requestMarkerTransition = true;
			_mode = -1;
		};
			
		//--- Filled Content.
		if (_mode == 1 || _mode == 2) then {
			//--- Remove if dead or null or sel changed.
			{
				_track = (_x select 0);
				_vehicle = (_x select 1);
				
				if !(alive _vehicle) then {
					deleteMarkerLocal Format ["WFBE_A_Large%1",_track];
					deleteMarkerLocal Format ["WFBE_A_Small%1",_track];
				};
			} forEach _trackingArrayID;
			
			//--- No need to update the marker all the time.
			if (time - _lastArtyUpdate > 5) then {
				_lastArtyUpdate = time;
				_trackingArray = [group player,true,lbCurSel(17008),sideJoined] Call GetTeamArtillery;
			};
			
			//--- Live Feed.
			_trackingArrayID = [];
			{
				_track = _x getVariable 'WFBE_A_Tracked';
				if (isNil '_track') then {
					_track = buildingMarker;
					buildingMarker = buildingMarker + 1;
					_x setVariable ['WFBE_A_Tracked', _track];
					_dmarker = Format ["WFBE_A_Large%1",_track];
					createMarkerLocal [_dmarker, getPos _x];
					_dmarker setMarkerColorLocal "ColorBlue";
					_dmarker setMarkerShapeLocal "ELLIPSE";
					_brush = "SOLID";
					if (_mode == 1) then {_brush = "SOLID"};
					if (_mode == 2) then {_brush = "BORDER"};
					_dmarker setMarkerBrushLocal _brush;
					_dmarker setMarkerAlphaLocal 0.4;
					_dmarker setMarkerSizeLocal [_maxRange,_maxRange];
					_dmarker = Format ["WFBE_A_Small%1",_track];
					createMarkerLocal [_dmarker, getPos _x];
					_dmarker setMarkerColorLocal "ColorBlack";
					_dmarker setMarkerShapeLocal "ELLIPSE";
					_dmarker setMarkerBrushLocal "SOLID";
					_dmarker setMarkerAlphaLocal 0.4;
					_dmarker setMarkerSizeLocal [_minRange,_minRange];
				} else {
					_dmarker = Format ["WFBE_A_Large%1",_track];
					_dmarker setMarkerPosLocal (getPos _x);
					_dmarker = Format ["WFBE_A_Small%1",_track];
					_dmarker setMarkerPosLocal (getPos _x);
				};
				_trackingArrayID = _trackingArrayID + [[_track,_x]];
			} forEach _trackingArray;
		};
	};
	
	_lastRange = artyRange;
	_lastSel = lbCurSel(_listbox);
	sleep 0.1;
	
	//--- Back Button.
	if (MenuAction == 30) exitWith { //---added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};

deleteMarkerLocal _marker;
deleteMarkerLocal _area;
{deleteMarkerLocal _x} forEach _markers;

if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
//--- Remove Markers.
{
	_track = (_x select 0);
	_vehicle = (_x select 1);
	
	_vehicle setVariable ['WFBE_A_Tracked', nil];

	deleteMarkerLocal Format ["WFBE_A_Large%1",_track];
	deleteMarkerLocal Format ["WFBE_A_Small%1",_track];
} forEach _trackingArrayID;