_logic = _this select 3;
_startPos = _this select 4;
_source = _this select 5;

if !(alive _source) exitWith {};

//--- Area limits.
_root = "REPAIR";
_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
if (_source == _hq) then {_root = "HQ"};

_tooFar = false;
if ((missionNamespace getVariable "WFBE_C_BASE_AREA") > 0) then {
	if (_source == _hq) then {
		if (count(WFBE_Client_Logic getVariable "wfbe_basearea") >= (missionNamespace getVariable "WFBE_C_BASE_AREA")) then {
			_startpos = [_startPos,WFBE_Client_Logic getVariable "wfbe_basearea"] Call WFBE_CO_FNC_GetClosestEntity;
			if (_source distance _startpos > (missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE")) exitWith {_tooFar = true};
		};
	};
};

if (isNil 'WFBE_COIN_Root') then {WFBE_COIN_Root = ""};
if (WFBE_COIN_Root != _root) then {lastBuilt = []};
WFBE_COIN_Root = _root;

if (_tooFar) exitWith {hint  (localize 'STR_WF_INFO_BaseArea_Reached')};//--- Base area reached.

//--- Call in the construction interface.
112200 cutrsc ["WFBE_ConstructionInterface","plain"]; //---added-MrNiceGuy
uiNamespace setVariable ["COIN_displayMain",finddisplay 46];

//--- Terminate of system is already running
if !(isNil {player getVariable "bis_coin_logic"}) exitWith {};
player setVariable ["bis_coin_logic",_logic];
bis_coin_player = player;

//--- Convert the startpos to array if needed (base area).
if (typeName _startPos == "OBJECT") then {_startPos = getPos _startPos};

_camera = BIS_CONTROL_CAM;
if (isNil "BIS_CONTROL_CAM") then {
	_camera = "camconstruct" camCreate [position player select 0,position player select 1,15];
	_camera cameraEffect ["internal","back"];
	_camera camPrepareFov 0.900;
	_camera camPrepareFocus [-1,-1];
	_camera camCommitPrepared 0;
	cameraEffectEnableHUD true;
	_camera setdir direction player;
	[_camera,-30,0] call BIS_fnc_setPitchBank;
	_camera camConstuctionSetParams ([_startPos] + (_logic getVariable "BIS_COIN_areasize"));
};
BIS_CONTROL_CAM = _camera;
BIS_CONTROL_CAM_LMB = false;
BIS_CONTROL_CAM_RMB = false;

1122 cutrsc ["constructioninterface","plain"];

//--- Prevent uikey override for other mods.
WF_COIN_DEH1 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["KeyDown",		"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['keydown',_this,commandingMenu] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
WF_COIN_DEH2 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["KeyUp",		"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['keyup',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
WF_COIN_DEH3 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["MouseButtonDown",	"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mousedown',_this,commandingMenu] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil; BIS_CONTROL_CAM_onMouseButtonDown = _this; if (_this select 1 == 1) then {BIS_CONTROL_CAM_RMB = true}; if (_this select 1 == 0) then {BIS_CONTROL_CAM_LMB = true};}"];
WF_COIN_DEH4 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["MouseButtonUp",	"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_CONTROL_CAM_RMB = false; BIS_CONTROL_CAM_LMB = false;}"];

BIS_CONTROL_CAM_keys = [];

if (isNil "BIS_CONTROL_CAM_ASL") then {
	createCenter sideLogic;
	_logicGrp = createGroup sidelogic;
	_logicASL = _logicGrp createUnit ["Logic",position player,[],0,"none"];
	BIS_CONTROL_CAM_ASL = _logicASL;
};

_logic setVariable ["BIS_COIN_selected",objNull];
_logic setVariable ["BIS_COIN_params",[]];
_logic setVariable ["BIS_COIN_tooltip",""];
_logic setVariable ["BIS_COIN_menu","#USER:BIS_Coin_categories_0"];
_logic setVariable ["BIS_COIN_restart",true];
_logic setVariable ["WF_RequestUpdate",false];
_get = _logic getVariable 'WF_NVGPersistent';
_nvgstate = true;
if (isNil '_get') then {
	_nvgstate = if (daytime > 18.5 || daytime < 5.5) then {true} else {false};
	_logic setVariable ['WF_NVGPersistent',_nvgstate];
} else {
	_nvgstate = _logic getVariable 'WF_NVGPersistent';
};
camUseNVG _nvgstate;
_logic setVariable ["BIS_COIN_nvg",_nvgstate];

_bns = missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",sideJoinedText];
_greenList = missionNamespace getVariable "COIN_UseHelper";
//--- Building Limit Init.
_buildingsNames = _bns;
_buildingsNames = _buildingsNames - [_buildingsNames select 0];
_buildingsType = missionNamespace getVariable Format["WFBE_%1STRUCTURES",sideJoinedText];
_buildingsType = _buildingsType - [_buildingsType select 0];

//--- Open menu
_logic spawn {
	_logic = _this;
	waitUntil {!isNil {_this getVariable "BIS_COIN_fundsOld"}};
	while {!isNil "BIS_CONTROL_CAM"} do {
		waitUntil {
			_params = _logic getVariable "BIS_COIN_params";
			if (isNil "_params") then {_params = []};
			(commandingMenu == "" && count _params == 0 && !BIS_CONTROL_CAM_RMB) || isNil "BIS_CONTROL_CAM"
		};
		if (isNil "BIS_CONTROL_CAM") exitWith {};
		showCommandingMenu "#USER:BIS_Coin_categories_0";
		sleep 0.01;
	};
};

//--- Border - temporary solution //TODO: move border if position of logic changes (eg. by placing hq)
_createBorder = {
	Private ["_logic","_startpos"];
	_logic = _this select 0;
	_startpos = _this select 1;
	_oldBorder = missionNamespace getVariable "BIS_COIN_border";
	if (!isNil "_oldBorder") then {
		{deleteVehicle _x} forEach _oldBorder;
	};
	missionNamespace setVariable ["BIS_COIN_border",nil];
	
	_border = [];
	_center = _startpos;
	_size = (_logic getVariable "BIS_COIN_areasize") select 0;
	_width = 9.998; //200/126
	_width = 9.996; //150/96
	_width = 9.992; //100/64
	_width = 9.967; //50/32
	_width = 9.917; //30/20
	_width = 9.83; //20/14
	_width = 9.48; //10/8
	_width = 10 - (0.1/(_size * 0.2));
	_width = 10;

	_pi = 3.14159265358979323846;
	_perimeter = (_size * _pi);
	_perimeter = _perimeter + _width - (_perimeter % _width);
	_size = (_perimeter / _pi);
	_wallcount = _perimeter / _width * 2;
	_total = _wallcount;

	for "_i" from 1 to _total do {
		_dir = (360 / _total) * _i;
		_xpos = (_center select 0) + (sin _dir * _size);
		_ypos = (_center select 1) + (cos _dir * _size);
		_zpos = (_center select 2);

		_a = "transparentwall" createVehicleLocal [_xpos,_ypos,_zpos];
		_a setposasl [_xpos,_ypos,0];
		_a setdir (_dir + 90);
		_border = _border + [_a];
	};
	missionNamespace setVariable ["BIS_COIN_border",_border];
};
_createBorderScope = [_logic,_startpos] spawn _createBorder;

//--- This block is pretty important
if !(isNil "BIS_CONTROL_CAM_Handler") exitWith {endLoadingScreen};

BIS_CONTROL_CAM_Handler = {
	_mode = _this select 0;
	_input = _this select 1;
	_camera = BIS_CONTROL_CAM;
	_logic = bis_coin_player getVariable "bis_coin_logic";
	_terminate = false;
  
  	if (isNil "_logic") exitWith {};

	_areasize = (_logic getVariable "BIS_COIN_areasize");
	_limitH = _areasize select 0;
	_limitV = _areasize select 1;

	_keysCancel	= actionKeys "MenuBack";

	_keysBanned	= [1];
	_keyNightVision		= actionKeys "NightVision";

	//--- Mouse DOWN
	if (_mode == "mousedown") then {
		_key = _input select 1;
		if (_key == 1 && 65665 in (actionkeys "MenuBack")) then {_terminate = true};
	};

	//--- Key DOWN
	if (_mode == "keydown") then {

		_key = _input select 1;
		_ctrl = _input select 3;
		if !(_key in (BIS_CONTROL_CAM_keys + _keysBanned)) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys + [_key]};

		//--- Terminate CoIn
		if (_key in _keysCancel && isNil "BIS_Coin_noExit") then {_terminate = true};

		//--- Start NVG
		if (_key in _keyNightVision) then {
			_NVGstate = !(_logic getVariable "BIS_COIN_nvg");
			_logic setVariable ["BIS_COIN_nvg",_NVGstate];
			_logic setVariable ['WF_NVGPersistent',_NVGstate];
			camUseNVG _NVGstate;
		};
		
		//--- Last Built Defense (Custom Action #1).
		if ((_key in (actionKeys "User15")) && count lastBuilt > 0) then {
			_deployed = true;
			if (WFBE_COIN_Root == "HQ") then {_deployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus};
			_currentCash = Call GetPlayerFunds;
			if (_currentCash > (lastBuilt select 2) select 1 && _deployed) then {
				showCommandingMenu '';
				_logic setVariable ["BIS_COIN_params",lastBuilt];
			};
		};
		
		//--- Manning Defense (Custom Action #2).
		if ((_key in (actionKeys "User16")) && ((missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MAX_AI") > 0)) then {
			if (manningDefense) then {manningDefense = false} else {manningDefense = true};
			_status = if (manningDefense) then {localize "STR_WF_On"} else {localize "STR_WF_Off"};
			_logic setVariable ["WF_RequestUpdate",true];
		};
		
		//--- Sell Defense. (Commander only) (Custom Action #3).
		if ((_key in (actionKeys "User17")) && !isNull(commanderTeam)) then {
			if(commanderTeam == clientTeam) then {
				_preview = _logic getVariable "BIS_COIN_preview";
				if (isNil "_preview") then {//--- Proceed when there is no preview.
					_targeting = screenToWorld [0.5,0.5];
					_near = nearestObjects [_targeting,missionNamespace getVariable Format["WFBE_%1DEFENSENAMES",sideJoinedText],25];
					if (count _near > 0) then {
						_closest = _near select 0;
						//--- Abort if too far.
						if ((player distance _closest) > ((_logic getVariable "BIS_COIN_areasize") select 0)) exitWith {};
						_sold = _closest getVariable 'sold';
						_closestType = typeOf (_closest);
						_get = missionNamespace getVariable _closestType;
						if (!isNil '_get' && isNil '_sold') then {
							_closest setVariable ['sold',true];
							_price = _get select QUERYUNITPRICE;
							round(_price/2) Call ChangePlayerFunds;
							deleteVehicle _closest;
						};
					};
				};
			};
		};
	};
	//--- Key UP
	if (_mode == "keyup") then {
		_key = _input select 1;
		if (_key in BIS_CONTROL_CAM_keys) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys - [_key]};
	};

	//--- Deselect or Close
	if (_terminate) then {
		_menu = _this select 2;

		//--- Close
		if (isNil "BIS_Coin_noExit") then {
			if (_menu == "#USER:BIS_Coin_categories_0") then {
				BIS_CONTROL_CAM cameraEffect ["terminate","back"];
				camDestroy BIS_CONTROL_CAM;
				BIS_CONTROL_CAM = nil;
			} else {
				_preview = _logic getVariable "BIS_COIN_preview";
				if !(isNil "_preview") then {deleteVehicle _preview};
				_logic setVariable ["BIS_COIN_preview",nil];
				_logic setVariable ["BIS_COIN_params",[]];
				_get = _logic getVariable 'WFBE_Helper';
				if !(isNil '_get') then {
					deleteVehicle _get;
					_logic setVariable ['WFBE_Helper',nil];
				};
			};
		};
	};

	//--- Camera no longer exists - terminate and start cleanup	
	if (isNil "BIS_CONTROL_CAM" || player != bis_coin_player || !isNil "BIS_COIN_QUIT") exitWith {
		if !(isNil "BIS_CONTROL_CAM") then {BIS_CONTROL_CAM cameraEffect ["terminate","back"];camDestroy BIS_CONTROL_CAM;};
		BIS_CONTROL_CAM = nil;
		BIS_CONTROL_CAM_Handler = nil;
		1122 cuttext ["","plain"];
		_player = bis_coin_player;
		_player setVariable ["bis_coin_logic",nil];
		bis_coin_player = objNull;
		_preview = _logic getVariable "BIS_COIN_preview";
		if !(isNil "_preview") then {deleteVehicle _preview};
		_logic setVariable ["BIS_COIN_preview",nil];
		_get = _logic getVariable 'WFBE_Helper';
		if !(isNil '_get') then {
			deleteVehicle _get;
			_logic setVariable ['WFBE_Helper',nil];
		};
		_logic setVariable ["BIS_COIN_selected",nil];
		_logic setVariable ["BIS_COIN_params",nil];
		_logic setVariable ["BIS_COIN_lastdir",nil];
		_logic setVariable ["BIS_COIN_tooltip",nil];
		_logic setVariable ["BIS_COIN_fundsOld",nil];
		_logic setVariable ["BIS_COIN_restart",nil];
		_logic setVariable ["BIS_COIN_nvg",nil];
		_logic setVariable ["WF_RequestUpdate",nil];
		showCommandingMenu "";

		//_display = finddisplay 46;
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",WF_COIN_DEH1];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",WF_COIN_DEH2];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",WF_COIN_DEH3];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp",WF_COIN_DEH4];

		//--- Behold the placeholders
		BIS_COIN_QUIT = nil;
		_border = missionNamespace getVariable "BIS_COIN_border";
		{deleteVehicle _x} forEach _border;
		missionNamespace setVariable ["BIS_COIN_border",nil];
	};
};

waitUntil {scriptDone _createBorderScope};
endLoadingScreen;


///*** LOOOP ****
_canAffordCount = 0;
_canAffordCountOld = 0;
_oldMenu = commandingMenu;
_limitHOld = -1;
_limitVOld = -1;
_loaded = false;
_localtime = time;

while {!isNil "BIS_CONTROL_CAM"} do {
	//if (isnull (uiNamespace getVariable 'BIS_CONTROL_CAM_DISPLAY') && !_loaded) then {
	if (isnull (uiNamespace getVariable 'wfbe_title_coin') && !_loaded) then { //---TEST MrNiceGuy
		cameraEffectEnableHUD true;
		1122 cutrsc ["constructioninterface","plain"];
		_loaded = true;
		_logic setVariable ["BIS_COIN_restart",true];
		_localtime = time;
	};
	if ((time - _localtime) >= 1 && _loaded) then {_loaded = false};
	_logic = bis_coin_player getVariable "bis_coin_logic";

	_mode = "mousemoving";
	_camera = BIS_CONTROL_CAM;
  
  	if (isNil "_logic") exitWith {};
	
	//--- Player dies on construction mode or the source die.
	if (!alive player || !alive _source) exitWith {
		startLoadingScreen [localize "str_coin_exit" + " " + localize "str_coin_name","RscDisplayLoadMission"];

		if !(isNil "BIS_CONTROL_CAM") then {BIS_CONTROL_CAM cameraEffect ["terminate","back"];camDestroy BIS_CONTROL_CAM;};
		BIS_CONTROL_CAM = nil;
		BIS_CONTROL_CAM_Handler = nil;
		1122 cuttext ["","plain"];
		_player = bis_coin_player;
		_player setVariable ["bis_coin_logic",nil];
		bis_coin_player = objNull;
		_preview = _logic getVariable "BIS_COIN_preview";
		if !(isNil "_preview") then {deleteVehicle _preview};
		_logic setVariable ["BIS_COIN_preview",nil];
		_get = _logic getVariable 'WFBE_Helper';
		if !(isNil '_get') then {
			deleteVehicle _get;
			_logic setVariable ['WFBE_Helper',nil];
		};
		_logic setVariable ["BIS_COIN_selected",nil];
		_logic setVariable ["BIS_COIN_params",nil];
		_logic setVariable ["BIS_COIN_lastdir",nil];
		_logic setVariable ["BIS_COIN_tooltip",nil];
		_logic setVariable ["BIS_COIN_fundsOld",nil];
		_logic setVariable ["BIS_COIN_restart",nil];
		_logic setVariable ["BIS_COIN_nvg",nil];
		_logic setVariable ["WF_RequestUpdate",nil];
		showCommandingMenu "";

		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",WF_COIN_DEH1];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",WF_COIN_DEH2];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",WF_COIN_DEH3];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp",WF_COIN_DEH4];

		//--- Behold the placeholders
		BIS_COIN_QUIT = nil;
		WF_COIN_DEH1 = nil;
		WF_COIN_DEH2 = nil;
		WF_COIN_DEH3 = nil;
		WF_COIN_DEH4 = nil;
		_border = missionNamespace getVariable "BIS_COIN_border";
		{deleteVehicle _x} forEach _border;
		missionNamespace setVariable ["BIS_COIN_border",nil];

		endLoadingScreen;
	};

	_areasize = (_logic getVariable "BIS_COIN_areasize");
	_limitH = _areasize select 0;
	_limitV = _areasize select 1;

	if (_limitH != _limitHOld || _limitV != _limitVOld) then {
		[_logic,_startpos] spawn _createBorder;
		BIS_CONTROL_CAM camConstuctionSetParams ([_startPos] + (_logic getVariable "BIS_COIN_areasize"));
	};
	_limitHOld = _limitH;
	_limitVOld = _limitV;

	_keysCancel		= actionKeys "MenuBack";
	_keysBanned		= [1];

	//--- Mouse moving or holding
	if (_mode in ["mousemoving","mouseholding"]) then {
		//--- Check pressed keys
		_keys = BIS_CONTROL_CAM_keys;
		_ctrl = (29 in _keys) || (157 in _keys);
		_shift = (42 in _keys) || (54 in _keys);
		_alt = (56 in _keys);

		//--- Construction or Selection
		_params = _logic getVariable "BIS_COIN_params";
		_tooltip = "empty";
		_tooltipType = "empty";
		_selected = objNull;
		if (count _params > 0) then {
			//--- Basic colors
			_colorGreen = "#(argb,8,8,3)color(0,1,0,0.3,ca)";
			_colorRed = "#(argb,8,8,3)color(1,0,0,0.3,ca)";
			_colorGray = "#(argb,8,8,3)color(1,1,1,0.1,ca)";
			_colorGray = "#(argb,8,8,3)color(0,0,0,0.25,ca)";
			_color = _colorGreen;

			//--- Class, Category, Cost, (preview class), (display name)
			_itemclass = _params select 0;
			_itemcategory = _params select 1;
			_itemcost = _params select 2;
			_itemcash = 0;
			if (typename _itemcost == "ARRAY") then {_itemcash = _itemcost select 0; _itemcost = _itemcost select 1};
			_funds = _logic getVariable "BIS_COIN_funds";
			if (typename _funds == "ARRAY") then {
				_a = (sideJoined) Call GetSideSupply;
				_b = Call GetPlayerFunds;
				_funds = [_a]+[_b];
			} else {
				_funds = [Call GetPlayerFunds];
			};
			_itemFunds = _funds select _itemcash;
			_itemname = if (count _params > 3) then {_params select 3} else {getText (configFile >> "CfgVehicles" >> _itemclass >> "displayName")};
			_itemclass_preview = getText (configFile >> "CfgVehicles" >> _itemclass >> "ghostpreview");
			if (_itemclass_preview == "") then {_itemclass_preview = _itemclass};

			//--- Preview building
			_preview = camtarget BIS_CONTROL_CAM;
			_new = false;
			if (typeof _preview != _itemclass_preview) then {
				//--- No preview
				deleteVehicle _preview;
				if !(isNil {_logic getVariable "BIS_COIN_preview"}) then {deleteVehicle (_logic getVariable "BIS_COIN_preview")}; //--- Serialization hack
				_get = _logic getVariable 'WFBE_Helper';
				if !(isNil '_get') then {
					deleteVehicle _get;
					_logic setVariable ['WFBE_Helper',nil];
				};
				_hqDeployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
				_index = _bns find _itemclass;
				if (_index == 0 && _hqDeployed) exitWith {
					_mhq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
					(_mhq) Spawn HandleHQAction;

					// WFBE_RequestStructure = ['SRVFNCREQUESTSTRUCTURE',[sideJoined,_itemclass,[0,0,0],0]];
					// publicVariable 'WFBE_RequestStructure';
					// if (isHostedServer) then {['SRVFNCREQUESTSTRUCTURE',[sideJoined,_itemclass,[0,0,0],0]] Spawn HandleSPVF};
					["RequestStructure", [sideJoined,_itemclass,[0,0,0],0]] Call WFBE_CO_FNC_SendToServer;

					[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
					
					_structuresCosts = missionNamespace getVariable Format["WFBE_%1STRUCTURECOSTS",sideJoinedText];
					if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {
						[sideJoined,-(_structuresCosts select _index)] Call ChangeSideSupply;
					} else {
						-(_structuresCosts select _index) Call ChangePlayerFunds;
					};
					
					//////////////////////////////////////////////////
					startLoadingScreen [localize "str_coin_exit" + " " + localize "str_coin_name","RscDisplayLoadMission"];
					//////////////////////////////////////////////////

					if !(isNil "BIS_CONTROL_CAM") then {BIS_CONTROL_CAM cameraEffect ["terminate","back"];camDestroy BIS_CONTROL_CAM;};
					BIS_CONTROL_CAM = nil;
					BIS_CONTROL_CAM_Handler = nil;
					1122 cuttext ["","plain"];
					_player = bis_coin_player;
					_player setVariable ["bis_coin_logic",nil];
					bis_coin_player = objNull;
					_preview = _logic getVariable "BIS_COIN_preview";
					if !(isNil "_preview") then {deleteVehicle _preview};
					_logic setVariable ["BIS_COIN_preview",nil];
					_logic setVariable ["BIS_COIN_selected",nil];
					_logic setVariable ["BIS_COIN_params",nil];
					_logic setVariable ["BIS_COIN_lastdir",nil];
					_logic setVariable ["BIS_COIN_tooltip",nil];
					_logic setVariable ["BIS_COIN_fundsOld",nil];
					_logic setVariable ["BIS_COIN_restart",nil];
					_logic setVariable ["BIS_COIN_nvg",nil];
					_logic setVariable ["WF_RequestUpdate",nil];
					showCommandingMenu "";

					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",WF_COIN_DEH1];
					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",WF_COIN_DEH2];
					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",WF_COIN_DEH2];
					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp",WF_COIN_DEH3];

					//--- Behold the placeholders
					BIS_COIN_QUIT = nil;
					WF_COIN_DEH1 = nil;
					WF_COIN_DEH2 = nil;
					WF_COIN_DEH3 = nil;
					WF_COIN_DEH4 = nil;
					_border = missionNamespace getVariable "BIS_COIN_border";
					{deleteVehicle _x} forEach _border;
					missionNamespace setVariable ["BIS_COIN_border",nil];
					
					[] Spawn {
						_start = time;
						waitUntil {!((sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus) || time - _start > 15};
						if (time - _start < 15) then {
							sleep 2;
							_mhq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
							if (alive _mhq) then {
								_mhq addAction [localize "STR_WF_Unlock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && locked _target'];
								_mhq addAction [localize "STR_WF_Lock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && !(locked _target)'];
							};
						};
					};
					
					endLoadingScreen;
				};
				
				_preview = _itemclass_preview createVehicleLocal (screenToWorld [0.5,0.5]);
				_gdir = _logic getVariable 'BIS_COIN_lastdir';
				if !(isNil '_gdir') then {_preview setDir _gdir};
				BIS_CONTROL_CAM camSetTarget _preview;
				BIS_CONTROL_CAM camCommit 0;
				_logic setVariable ["BIS_COIN_preview",_preview];
				_new = true;
				
				//--- Preview Helper.
				if (_itemclass in _greenList && _index != -1) then {
					_distance = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDISTANCES",sideJoinedText]) select _index;
					_direction = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDIRECTIONS",sideJoinedText]) select _index;
					_npos = [getPos _preview,_distance,getDir _preview + _direction] Call GetPositionFrom;
					_helper = "Sign_Danger" createVehicleLocal _npos;
					_helper setPos _npos;
					_helper setDir (_direction+65);
					
					_array = _preview worldToModel (getPos _helper);
					_array set [2,0];
					_helper attachTo [_preview,_array]; 
					
					_logic setVariable ['WFBE_Helper',_helper];
				};

				_preview setObjectTexture [0,_colorGray];
				_preview setVariable ["BIS_COIN_color",_colorGray];

				//--- Exception - preview not created
				if (isnull _preview) then {
					deleteVehicle _preview;
					_logic setVariable ["BIS_COIN_preview",nil];
					_logic setVariable ["BIS_COIN_params",[]];
					_get = _logic getVariable 'WFBE_Helper';
					if !(isNil '_get') then {
						deleteVehicle _get;
						_logic setVariable ['WFBE_Helper',nil];
					};
				};

			} else {
				//--- Check zone
				if (
					([position _preview,_startPos] call BIS_fnc_distance2D) > _limitH
				) then {
					_color = _colorGray
				} else {
					//--- No money
					_funds = 0;
					call compile format ["_funds = %1;",_itemFunds];
					_fundsRemaining = _funds - _itemcost;
					if (_fundsRemaining < 0) then {_color = _colorRed};
					
					_color = [_itemcategory, _preview, _color] Call (missionNamespace getVariable "WFBE_C_STRUCTURES_PLACEMENT_METHOD");
				};
				_preview setObjectTexture [0,_color];
				_preview setVariable ["BIS_COIN_color",_color];

				_tooltip = _itemclass;
				_tooltipType = "preview";

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				if (_color == _colorGreen) then {_colorGUI = [0.3,1,0.3,0.3]};
				if (_color == _colorRed) then {_colorGUI = [1,0.2,0.2,0.4]};

				((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112201) ctrlSetTextColor _colorGUI;
				((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112201) ctrlCommit 0;
			};

			//--- Place
			if (!_new && !isnull _preview && ((BIS_CONTROL_CAM_LMB && 65536 in (actionKeys "DefaultAction")) || {_x in (actionKeys "DefaultAction")} count BIS_CONTROL_CAM_keys > 0) && _color == _colorGreen) then {
				_pos = position _preview;
				_dir = direction _preview;
				deleteVehicle _preview;
				_logic setVariable ["BIS_COIN_preview",nil];
				_logic setVariable ["BIS_COIN_params",[]];
				_get = _logic getVariable 'WFBE_Helper';
				if !(isNil '_get') then {
					deleteVehicle _get;
					_logic setVariable ['WFBE_Helper',nil];
				};

				//--- Remove funds
				//call compile format ["%1 = %1 - _itemcost;",_itemFunds];

				//--- Execute designer defined code
				[_logic,_itemclass,_pos,_dir,_params] spawn {
					_logic = _this select 0;
					_itemclass = _this select 1;
					_pos = _this select 2;
					_dir = _this select 3;
					_par = _this select 4;
					
					//--- Define the last direction used.
					_logic setVariable ["BIS_COIN_lastdir",_dir];

					//--- On Purchase.
					[_logic,_itemclass] call {
						Private["_cash","_class","_costs","_index","_logic","_price"];
						_logic = _this select 0;
						_class = _this select 1;
						_structures = missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",sideJoinedText];
						_defenses = missionNamespace getVariable Format["WFBE_%1DEFENSENAMES",sideJoinedText];
						_costs = missionNamespace getVariable Format["WFBE_%1STRUCTURECOSTS",sideJoinedText];

						//--- Structures.
						_index = _structures find _class;
						if (_index != -1) then {
							_price = _costs select _index;
							if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {
								[sideJoined, -_price] Call ChangeSideSupply;
							} else {
								-(_price) Call ChangePlayerFunds;
							};
							if (_index == 0) then {
								_hqDeployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
								if (_hqDeployed) then {
									[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
								} else {
									[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_DEPLOYED",true,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
								};
								_logic setVariable ["BIS_COIN_restart",true];
							} else {
								["RequestChangeScore", [player,score player + (missionNamespace getVariable "WFBE_C_PLAYERS_COMMANDER_SCORE_BUILD")]] Call WFBE_CO_FNC_SendToServer;
							};
						};
						
						//--- Defense.
						_get = missionNamespace getVariable _class;
						if !(isNil '_get') then {
							_price = _get select QUERYUNITPRICE;
							-(_price) Call ChangePlayerFunds;
						};
					};

					//--- Execute designer defined code On Construct
					[_logic,_itemclass,_pos,_dir,_par] call {    
						private ["_class","_defenses","_deployed","_dir",'_find',"_logic","_par","_pos","_structures"];
						_logic = _this select 0;
						_class = _this select 1;
						_pos = _this select 2;
						_dir = _this select 3;
						_par = _this select 4;
						_deployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
						_structures = missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",sideJoinedText];
						_defenses = missionNamespace getVariable Format["WFBE_%1DEFENSENAMES",sideJoinedText];
						
						_find = _structures find _class;
						if (_find != -1) then {
							//--- Increment the buildings.
							if ((_find - 1) > -1) then {
								_current = WFBE_Client_Logic getVariable "wfbe_structures_live";
								_current set [_find - 1, (_current select (_find-1)) + 1];
								WFBE_Client_Logic setVariable ["wfbe_structures_live", _current, true];
							};
							
							// WFBE_RequestStructure = ['SRVFNCREQUESTSTRUCTURE',[sideJoined,_class,_pos,_dir]];
							// publicVariable 'WFBE_RequestStructure';
							// if (isHostedServer) then {['SRVFNCREQUESTSTRUCTURE',[sideJoined,_class,_pos,_dir]] Spawn HandleSPVF};
							["RequestStructure", [sideJoined,_class,_pos,_dir]] Call WFBE_CO_FNC_SendToServer;
						};
						
						if (_class in _defenses) then {
							// WFBE_RequestDefense = ['SRVFNCREQUESTDEFENSE',[sideJoined,_class,_pos,_dir,manningDefense]];
							// publicVariable 'WFBE_RequestDefense';
							// if (isHostedServer) then {['SRVFNCREQUESTDEFENSE',[sideJoined,_class,_pos,_dir,manningDefense]] Spawn HandleSPVF};
							["RequestDefense", [sideJoined,_class,_pos,_dir,manningDefense]] Call WFBE_CO_FNC_SendToServer;
							lastBuilt = _par;
						};
					};
				};

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112201) ctrlSetTextColor _colorGUI;
				((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112201) ctrlCommit 0;
			};
		} else {
			_colorGUI = [1,1,1,0.1];
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112201) ctrlSetTextColor _colorGUI;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112201) ctrlCommit 0;
		};

		_oldTooltip = _logic getVariable "BIS_COIN_tooltip";
		if ((_tooltipType + _tooltip) != _oldTooltip || commandingMenu != _oldMenu || _logic getVariable "WF_RequestUpdate") then {
			_logic setVariable ["WF_RequestUpdate",false];
			
			//--- Description
			_type = _tooltip;

			//--- Header & preview picture
			_textHeader = "<t size='1.2'><br /></t>";
			_textPicture = "<t size='2.8'><br /></t><br /><br />";
			_fileIcon = getText (configFile >> "cfgvehicles" >> _type >> "icon");
			if (str(configFile >> "CfgVehicleIcons" >> _fileIcon) != "") then {_fileIcon = getText (configFile >> "CfgVehicleIcons" >> _fileIcon)};
			_filePicture = getText (configFile >> "cfgvehicles" >> _type >> "picture");
			if (str(configFile >> "CfgVehicleIcons" >> _filePicture) != "") then {_filePicture = getText (configFile >> "CfgVehicleIcons" >> _filePicture)};

			if (_tooltipType != "empty") then {
				_textHeader = format ["<t color='#42b6ff' shadow='1' align='center' size='1.8'> %1 </t><br />",
					getText (configFile >> "cfgvehicles" >> _type >> "displayname"),
					if (isnull _selected) then {""} else {str round ((1 - damage _selected) * 100) + "%"}
				];
				_textPicture = format ["<t color='#42b6ff' shadow='2' align='left' size='2.8'><img image='%1'/></t> ",_filePicture];
			};

			_text1 = if (count _params > 0) then {"<t color='#42b6ff' shadow='2'>" + localize "str_coin_rotate" + "<t align='right'>" + call compile (keyname 29) + "</t></t><br />"} else {"<br />"};
			
			_status = if (manningDefense) then {localize "STR_WF_On"} else {localize "STR_WF_Off"};
			_text2 = if (count _params > 0) then {"<t color='#42b6ff' shadow='2'>" + localize "str_coin_build" + "<t align='right'>" + call compile (actionKeysNames ["DefaultAction",1]) + "</t></t><br />"} else {"<t color='#42b6ff' shadow='2'>" + localize "STR_WF_AutoDefense" + ":<t align='right'>" + _status + "</t></t><br />"};

			_text3 = if (commandingMenu != "#USER:BIS_Coin_categories_0") then {
				//--- Back hint
				if (isNil "BIS_Coin_noExit") then {
					"<t color='#eee544' shadow='2'>" + localize "str_coin_back" + "<t align='right'>" + call compile (actionKeysNames ["MenuBack",1]) + "</t></t>";
				} else {""};
			} else {
				//--- Exit hint
				if (isNil "BIS_Coin_noExit") then {
					"<t color='#eee544' shadow='2'>" + localize "str_coin_exit" + "<t align='right'>" + call compile (actionKeysNames ["MenuBack",1]) + "</t></t>";
				} else {""};
			};

			//--- Compose text
			_textHint = (
			 	_textPicture + 
				_textHeader + 
				""
			);

			_textControls = (
				_text1 + 
				_text2 + 
				_text3 + 
				""
			);

			//--- Set box
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112211) ctrlShow true;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112211) ctrlCommit 0;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112214) ctrlSetStructuredText (parseText _textHint);
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112214) ctrlShow true;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112214) ctrlCommit 0;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112215) ctrlSetStructuredText (parseText _textControls);
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112215) ctrlShow true;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112215) ctrlCommit 0;
		};

		//--- Amount of funds changed
		_funds = _logic getVariable "BIS_COIN_funds";
		if (typename _funds == "ARRAY") then {
			_a = (sideJoined) Call GetSideSupply;
			_b = Call GetPlayerFunds;
			_funds = [_a]+[_b];
		} else {
			_funds = [Call GetPlayerFunds];
		};
		_fundsDescription = _logic getVariable "BIS_COIN_fundsDescription";
		_cashValues = [];
		{_cashValues = _cashValues + [_x]} forEach _funds;
		_cashValuesOld = _logic getVariable "BIS_COIN_fundsOld";
		if (isNil "_cashValuesOld") then {_cashValuesOld = []; _cashValuesOld set [count _cashValues - 1,-1]};
		_restart = _logic getVariable "BIS_COIN_restart";
		if (!([_cashValues,_cashValuesOld] call bis_fnc_arraycompare) || _restart) then {
			_cashValuesCount = count _cashValues;
			_cashSize = if (_cashValuesCount <= 1) then {2} else {2.8 / _cashValuesCount};
			_cashText = format ["<t color='#56db33' shadow='2' size='%1' align='left' valign='middle'>",_cashSize];
			_cashLines = 0;
			for "_i" from 0 to (count _funds - 1) do {
				_cashValue = _cashValues select _i;
				_cashDescription = if (count _fundsDescription > _i) then {_fundsDescription select _i} else {"?"};
				_cashText = _cashText + format ["%1 %2<br />",_cashDescription,round _cashValue];
				_cashLines = _cashLines + 0.05;
			};
			_cashText = _cashText + "</t>";
			_cashPos = ctrlPosition ((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112224);
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112224) ctrlSetStructuredText (parseText _cashText);
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112224) ctrlSetPosition [_cashPos select 0,_cashPos select 1,_cashPos select 2,(_cashPos select 3)/*0.1*/ + _cashLines];
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112224) ctrlShow true;
			((uiNamespace getVariable "wfbe_title_coin") displayCtrl 112224) ctrlCommit 0;

			//--- Categories menu
			_categories = +(_logic getVariable "BIS_COIN_categories");
			_categoriesMenu = [];
			//--- Ammo Upgrade.
			_upgrades = (sideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
			if (_upgrades select WFBE_UP_AMMOCOIN < 1) then {_categories = _categories - [localize 'STR_WF_Ammo']}; 
			
			for "_i" from 0 to (count _categories - 1) do {
				_categoriesMenu = _categoriesMenu + [_i];
			};

			[["Categories",true],"BIS_Coin_categories",[_categoriesMenu,_categories],"#USER:BIS_Coin_%1_items_0","",""] call BIS_fnc_createmenu;

			//--- Items menu
			_items = _logic getVariable "BIS_COIN_items";
			_canAffordCountOld = _canAffordCount;
			_canAffordCount = 0;
			for "_i" from 0 to (count _categories - 1) do {
				_category = _categories select _i;
				_arrayNames = [];
				_arrayNamesLong = [];
				_arrayEnable = [];
				_arrayParams = [];
				{
					_itemclass = _x select 0;
					_itemcategory = _x select 1;
					if (typename _itemcategory == typename "") then {//--- Backward compatibility
						_itemcategory = _categories find _itemcategory;
					} else {100};

					if (_itemcategory < count _categories) then {
						_itemcost = _x select 2;
						_itemcash = 0;
						if (typename _itemcost == "ARRAY") then {_itemcash = _itemcost select 0; _itemcost = _itemcost select 1};
						_cashValue = _cashValues select _itemcash;
						_cashDescription = if (count _fundsDescription > _itemcash) then {_fundsDescription select _itemcash} else {"?"};
						_itemname = if (count _x > 3) then {_x select 3} else {getText (configFile >> "CfgVehicles" >> _itemclass >> "displayName")};
						//--- Build Limit reached?
						_buildLimit = false;
						_find = _buildingsNames find _itemclass;
						if (_find != -1) then {
							_current = WFBE_Client_Logic getVariable "wfbe_structures_live";
							_limit = missionNamespace getVariable (Format['WFBE_C_STRUCTURES_MAX_%1',(_buildingsType select _find)]);
							if (isNil '_limit') then {_limit = 4}; //--- Default.
							if ((_current select _find) >= _limit) then {_buildLimit = true};
						};
						if (_itemcategory == _i/*_category*/) then {
							_canAfford = if (_cashValue - _itemcost >= 0 && !_buildLimit) then {1} else {0};
							_canAffordCount = _canAffordCount + _canAfford;
							// _text = _itemname + " - " + _cashDescription + str _itemcost;
							// _arrayNamesLong = _arrayNamesLong + [_text + "                   "];
							_text = parseText(Format ['%1 <t align="right"><t color="#ffc342">%2</t> <t color="#efff42">%3</t></t>',_itemname,_cashDescription,_itemcost] + "          ");
							_arrayNames = _arrayNames + [_text];
							_arrayNamesLong = _arrayNamesLong + [_text];
							_arrayEnable = _arrayEnable + [_canAfford];
							_arrayParams = _arrayParams + [[_logic getVariable "BIS_COIN_ID"] + [_x,_i]];
						};  
					};
				} forEach _items;
				
				[[_category,true],format ["BIS_Coin_%1_items",_i],[_arrayNames,_arrayNamesLong,_arrayEnable],"","
					BIS_CONTROL_CAM_LMB = false;
					scopename 'main';
					_item = '%1';
					_id = %2;
					_array = (call compile '%3') select _id;
					_logic = call compile ('BIS_COIN_'+ str (_array select 0));

					_params = _array select 1;
					_logic setVariable ['BIS_COIN_params',_params];
					_logic setVariable ['BIS_COIN_menu',commandingMenu];
					showCommandingMenu '';

				",_arrayParams] call BIS_fnc_createmenu;	
			};

			if (_canAffordCount != _canAffordCountOld) then {showCommandingMenu (commandingMenu)}; //<-- Open menu again to show disabled items
		};
		_logic setVariable ["BIS_COIN_fundsOld",_cashValues];
		_logic setVariable ["BIS_COIN_tooltip",_tooltipType + _tooltip];

		if (_restart) then {
			_logic setVariable ["BIS_COIN_restart",false];
		};
	};
	_oldMenu = commandingMenu;
	sleep 0.01;
};
112200 cuttext ["","plain"]; //---added-MrNiceGuy
showCommandingMenu '';
