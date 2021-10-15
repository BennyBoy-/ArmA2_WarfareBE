scriptName "Client\GUI\GUI_BuyGearMenu.sqf";

//--- Register the UI.
uiNamespace setVariable ["wfbe_display_buygear", _this select 0];
if (isNil {uiNamespace getVariable 'wfbe_display_buygear_tab'}) then {uiNamespace setVariable ['wfbe_display_buygear_tab', 2]};
uiNamespace setVariable ['wfbe_display_buygear_misc', -1];uiNamespace setVariable ['wfbe_display_buygear_pool_main', -1];uiNamespace setVariable ['wfbe_display_buygear_pool_gun', -1];

_color_tab = [0.258823529, 0.713725490, 1, 1];
_idc_tabs = [503301,503302,503303,503304,503305,503306];
_lb_main = 503001;_lb_secondary = 503002;_lb_cargo = 503005;
_tabs = ["Template","All","Primary","Secondary","Pistols","Equipment"];
_funds_cli = 0;_price = 0;_tab_current_last = -1;
_target = player;
//--- Todo secure vanilla, remove not used.
_target_weapons = weapons player;
_target_magazines = magazines player;
_backpack = (_target) Call WFBE_CL_FNC_GetUnitBackpack;
if (_backpack != "") then {_target_weapons = _target_weapons + [_backpack]};
_quick_clear = false;_quick_reload = false;_template_create = false;_template_delete = false;_has_inv_changed = false;_has_veh_changed = false;_purchase = false;_remove_backpack_item = false;_target_cancarrybp = false;_update_backpack = false;_update_display = true;_update_inventory = true;_update_item = false;_update_item_mag = false;_update_magazines = true;_update_tab = true;_update_target = true;_update_vehicle = false;_update_view = false;
_gear_primary = "";_gear_secondary = "";_gear_pistol = "";_gear_backpack = "";
_gear_sel_weapons = [];_gear_sel_magazines = [];_gear_sel_backpack = [];_gear_sel_vehicle = [];_gear_backpack_content = [];_gear_items = [];_gear_refresh = [];_gear_special = [];_gear_mag_main = [];_gear_mag_pool = [];_gear_vehicle_content = [];
_view = "gear";

ctrlShow[_lb_cargo, false];
_targets = (_target) Call WFBE_CL_FNC_UI_Gear_UpdateTarget;

WFBE_MenuAction = -1;

while {true} do {
	if (!alive player || !dialog) exitWith {closeDialog 0};
	
	_funds = Call WFBE_CL_FNC_GetClientFunds;
	if (_funds_cli != _funds) then {
		_funds_cli = _funds;
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl 503011) ctrlSetStructuredText (parseText Format ["<t size='1.1'><t color='#42b6ff' shadow='1'>My Funds: </t><t shadow='1' color='#76F563'>$%1.</t></t>", _funds]);
	};
	
	_tab_current = uiNamespace getVariable 'wfbe_display_buygear_tab';
	_click_misc = uiNamespace getVariable 'wfbe_display_buygear_misc';
	_click_pool_main = uiNamespace getVariable 'wfbe_display_buygear_pool_main';
	_click_pool_gun = uiNamespace getVariable 'wfbe_display_buygear_pool_gun';
	if (_tab_current != _tab_current_last) then {_tab_current_last = _tab_current; _update_tab = true};
	if (_click_misc != -1) then {uiNamespace setVariable ['wfbe_display_buygear_misc', -1]; if (_click_misc < count _gear_items && count _gear_items > 0) then {_gear_sel_weapons = _gear_sel_weapons - [_gear_items select _click_misc];_gear_items = _gear_items - [_gear_items select _click_misc]; _gear_refresh = ["items"]; _update_inventory = true;_has_inv_changed = true;}};
	if (_click_pool_main != -1) then {uiNamespace setVariable ['wfbe_display_buygear_pool_main', -1]; _size = (_gear_mag_main) Call WFBE_CL_FNC_GetMagazinesSize; if (_click_pool_main <= _size && _size > 0) then {_gear_mag_main = [_gear_mag_main, _click_pool_main] Call WFBE_CL_FNC_RemoveMagazineGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"];_update_inventory = true;_has_inv_changed = true;}};
	if (_click_pool_gun != -1) then {uiNamespace setVariable ['wfbe_display_buygear_pool_gun', -1]; _size = (_gear_mag_pool) Call WFBE_CL_FNC_GetMagazinesSize; if (_click_pool_gun <= _size && _size > 0) then {_gear_mag_pool = [_gear_mag_pool, _click_pool_gun] Call WFBE_CL_FNC_RemoveMagazineGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_hand"];_update_inventory = true;_has_inv_changed = true;}};
	
	if (WFBE_MenuAction == 1) then {WFBE_MenuAction = -1; _update_item = true};
	if (WFBE_MenuAction == 2) then {WFBE_MenuAction = -1; if (_tab_current != 0) then {_update_magazines = true}};
	if (WFBE_MenuAction == 3) then {WFBE_MenuAction = -1; _update_item_mag = true;};
	if (WFBE_MenuAction == 301) then {WFBE_MenuAction = -1; _update_view = true;};
	if (WFBE_MenuAction == 302) then {WFBE_MenuAction = -1; _update_target = true;};
	if (WFBE_MenuAction == 501) then {WFBE_MenuAction = -1; _purchase = true;};
	if (WFBE_MenuAction == 601) then {WFBE_MenuAction = -1; _template_create = true;};
	if (WFBE_MenuAction == 602) then {WFBE_MenuAction = -1; _template_delete = true;};
	if (WFBE_MenuAction == 701) then {WFBE_MenuAction = -1; _quick_reload = true;};
	if (WFBE_MenuAction == 702) then {WFBE_MenuAction = -1; _quick_clear = true;};
	if (WFBE_MenuAction == 901) then {WFBE_MenuAction = -1;if (_gear_primary != "") then {_gear_mag_main = [_gear_primary, "", _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_sel_weapons = _gear_sel_weapons - [_gear_primary];_gear_primary = ""; _gear_refresh = ["weapons","magazines_main"]; _update_inventory = true;_has_inv_changed = true;}};
	if (WFBE_MenuAction == 902) then {WFBE_MenuAction = -1;if (_gear_backpack != "") then {_gear_sel_weapons = _gear_sel_weapons - [_gear_backpack];_gear_backpack = "";_gear_backpack_content=[[[],[]],[[],[]]];_gear_refresh = ["weapons"];[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;_update_inventory = true;_has_inv_changed = true;};if (_gear_secondary != "") then {_gear_mag_main = [_gear_secondary, "", _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool;_gear_sel_weapons = _gear_sel_weapons - [_gear_secondary];_gear_secondary = ""; _gear_refresh = ["weapons","magazines_main"]; _update_inventory = true;_has_inv_changed = true;}};
	if (WFBE_MenuAction == 903) then {WFBE_MenuAction = -1;if (_gear_pistol != "") then {_gear_mag_pool = [_gear_pistol, "", _gear_mag_pool] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool;_gear_sel_weapons = _gear_sel_weapons - [_gear_pistol];_gear_pistol = ""; _gear_refresh = ["weapons","magazines_hand"]; _update_inventory = true;_has_inv_changed = true;}};
	if (WFBE_MenuAction == 904) then {WFBE_MenuAction = -1;if (count _gear_special > 0) then {_gear_sel_weapons = _gear_sel_weapons - [_gear_special select 0];if (count _gear_special == 1) then {_gear_special = []} else {_gear_special = [_gear_special select 1]}; _gear_refresh = ["special"]; _update_inventory = true;_has_inv_changed = true;}};
	if (WFBE_MenuAction == 905) then {WFBE_MenuAction = -1;if (count _gear_special > 1) then {_gear_sel_weapons = _gear_sel_weapons - [_gear_special select 1];_gear_special = [_gear_special select 0]; _gear_refresh = ["special"]; _update_inventory = true;_has_inv_changed = true;}};
	if (WFBE_MenuAction == 906) then {WFBE_MenuAction = -1;_remove_backpack_item = true};
	
	//--- Update the available target list.
	if (_update_target) then {
		_update_target = false;
		_target = _targets select (lbCurSel 503004);
		//todo refresh targets on click
		
		if !(alive _target) then {
			hint "the target is dead, refreshing";
			_update_target = true;
			_target = player;
			_targets = (_target) Call WFBE_CL_FNC_UI_Gear_UpdateTarget;
		};
		
		if (_target isKindOf "Man") then {
			//--- todo, remove unknown content.
			_target_weapons = [weapons _target, "weapons"] Call WFBE_CL_FNC_UI_Gear_Sanitize;
			_target_magazines = [magazines _target, "magazines"] Call WFBE_CL_FNC_UI_Gear_Sanitize;
			_target_cancarrybp = if (getNumber(configFile >> 'CfgVehicles' >> typeOf _target >> 'canCarryBackPack') == 1) then {true} else {false};
			_backpack = (_target) Call WFBE_CL_FNC_GetUnitBackpack;
			if (_backpack != "") then {_target_weapons = _target_weapons + [_backpack]};
			_returned = [_target_weapons, _target_magazines, _target] Call WFBE_CL_FNC_GetParsedGear;
			_gear_primary = _returned select 0;
			_gear_secondary = _returned select 1;
			_gear_pistol = _returned select 2;
			_gear_backpack = _returned select 3;
			_gear_special = _returned select 4;
			_gear_items = _returned select 5;
			_gear_mag_main = _returned select 6;
			_gear_mag_pool = _returned select 7;
			_gear_sel_backpack = _returned select 8;
			_gear_sel_vehicle = if (vehicle _target != _target) then {(vehicle _target) Call WFBE_CL_FNC_GetVehicleContent} else {[[[],[]],[[],[]],[[],[]]]};
			_gear_refresh = ["all"];
		} else {
			_target_weapons = [];
			_target_magazines = [];
			_target_cancarrybp = false;
			_gear_primary = "";_gear_secondary = "";_gear_pistol = "";_gear_backpack = "";
			_gear_sel_backpack = [[[],[]],[[],[]]];_gear_items = [];_gear_special = [];_gear_mag_main = [];_gear_mag_pool = [];
			_gear_sel_vehicle = (_target) Call WFBE_CL_FNC_GetVehicleContent;
		};
		[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;
		_gear_sel_weapons = +_target_weapons;
		_gear_sel_magazines = +_target_magazines;
		_gear_backpack_content = +_gear_sel_backpack;
		_gear_vehicle_content = +_gear_sel_vehicle;
		_has_veh_changed = false;
		_has_inv_changed = false;
		_update_inventory = true;
	};
	
	//--- Update the gear tab.
	if (_update_tab) then {
		_update_tab = false;
		{((uiNamespace getVariable "wfbe_display_buygear") displayCtrl _x) ctrlSetTextColor [0.7490, 0.7490, 0.7490, 0.7]} forEach _idc_tabs;
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl (_idc_tabs select _tab_current)) ctrlSetTextColor _color_tab;
		lnbClear _lb_main;
		lnbClear _lb_secondary;
		
		//todo - remember the previously chosen gun/mag etc
		switch (_tab_current) do {
			case 0: {[_lb_main, missionNamespace getVariable Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText]] Call WFBE_CL_FNC_UI_Gear_FillTemplates};
			case 1: {[_lb_main, [[(missionNamespace getVariable Format ["WFBE_%1_Primary", WFBE_Client_SideJoinedText]) + (missionNamespace getVariable Format ["WFBE_%1_Secondary", WFBE_Client_SideJoinedText]) + (missionNamespace getVariable Format ["WFBE_%1_Pistols", WFBE_Client_SideJoinedText]) + (missionNamespace getVariable Format ["WFBE_%1_Equipment", WFBE_Client_SideJoinedText])],[missionNamespace getVariable Format ["WFBE_%1_Magazines", WFBE_Client_SideJoinedText], "Mag_"]]] Call WFBE_CL_FNC_UI_Gear_FillList};
			case 2: {[_lb_main, [[missionNamespace getVariable Format ["WFBE_%1_Primary", WFBE_Client_SideJoinedText]]]] Call WFBE_CL_FNC_UI_Gear_FillList};
			case 3: {[_lb_main, [[missionNamespace getVariable Format ["WFBE_%1_Secondary", WFBE_Client_SideJoinedText]]]] Call WFBE_CL_FNC_UI_Gear_FillList};
			case 4: {[_lb_main, [[missionNamespace getVariable Format ["WFBE_%1_Pistols", WFBE_Client_SideJoinedText]]]] Call WFBE_CL_FNC_UI_Gear_FillList};
			case 5: {[_lb_main, [[(missionNamespace getVariable Format ["WFBE_%1_Equipment", WFBE_Client_SideJoinedText])],[missionNamespace getVariable Format ["WFBE_%1_Magazines", WFBE_Client_SideJoinedText], "Mag_"]]] Call WFBE_CL_FNC_UI_Gear_FillList};
		};
		
		//--- Smart Update, tbd improve per tab.
		_ui_lnb_currow = lnbCurSelRow _lb_main;
		if (_ui_lnb_currow != -1 && ((lnbSize _lb_main) select 0) > 0) then {
			lnbSetCurSelRow [_lb_main, 0];
		};
	};
	
	//--- Update the view tab.
	if (_update_view) then {
		_update_view = false;
		_view = lbData[503003, lbCurSel 503003];
		switch (_view) do {
			case "backpack": {{ctrlShow[_x, false]} forEach [503401, 503402, 503403]; for '_i' from 503501 to 503534 do {ctrlShow [_i, false]};{ctrlShow[_x, true]} forEach[_lb_cargo,503006,503007];[_lb_cargo, _gear_backpack_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;_update_backpack = true};
			case "gear": {{ctrlShow[_x, true]} forEach [503401, 503402, 503403]; for '_i' from 503501 to 503534 do {ctrlShow [_i, true]};{ctrlShow[_x, false]} forEach[_lb_cargo,503006,503007];_update_display = true;};
			case "vehicle": {{ctrlShow[_x, false]} forEach [503401, 503402, 503403]; for '_i' from 503501 to 503534 do {ctrlShow [_i, false]};{ctrlShow[_x, true]} forEach[_lb_cargo,503006,503007]; [_lb_cargo, _gear_vehicle_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList; _update_vehicle = true;/*todo update target content*/};
		};
	};
	
	//--- Quick gear reload.
	if (_quick_reload) then {
		_quick_reload = false;
		switch (_view) do {
			case "gear": {
				_get = _target getVariable "wfbe_custom_gear";
				if (isNil '_get') then {
					//--- The player may not reload it's loadout from the config.
					if (_target != player) then {
						_gear_config = (typeOf _target) Call WFBE_CO_FNC_GetUnitConfigGear;
						_gear_sel_weapons = _gear_config select 0;
						_gear_sel_magazines = _gear_config select 1;
						_gear_backpack = _gear_config select 2;
						_gear_backpack_content = _gear_config select 3;
						if (_gear_backpack != "") then {_gear_sel_weapons = _gear_sel_weapons + [_gear_backpack]; [_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView};
					} else {
						hint localize "STR_WF_GEAR_ProhibPlayerDefault";
					};
				} else {
					_gear_sel_weapons = _get select 0;
					_gear_sel_magazines = _get select 1;
					_gear_backpack = _get select 2;
					_gear_backpack_content = _get select 3;
				};
				_has_inv_changed = true;
				_update_inventory = true;
				_gear_refresh = ["all"];
			};
		};
	};
	
	//--- Quick gear removal.
	if (_quick_clear) then {
		_quick_clear = false;
		switch (_view) do {
			case "backpack": {_gear_refresh = ["all"];_gear_backpack_content = [[[],[]],[[],[]]]; _update_backpack = true; _has_inv_changed = true; [_lb_cargo, _gear_backpack_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;};
			case "gear": {_gear_refresh = ["all"];_gear_backpack = "";_gear_sel_weapons = []; _gear_sel_magazines = []; _gear_mag_main = []; _gear_mag_pool = []; _gear_backpack_content = [[[],[]],[[],[]]]; _has_inv_changed = true};			
			case "vehicle": {_gear_vehicle_content = [[[],[]],[[],[]],[[],[]]]; _update_vehicle = true; _has_veh_changed = true;[_lb_cargo, _gear_vehicle_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;};
		};
		_update_inventory = true;
	};
	
	//--- Remove an item from the backpack.
	if (_remove_backpack_item) then {
		_remove_backpack_item = false;
		_ui_lnb_currow = lnbCurSelRow _lb_cargo;
		if (_ui_lnb_currow > -1) then {
			_item_selected = lnbData[_lb_cargo,[_ui_lnb_currow, 0]];
			_get = missionNamespace getVariable _item_selected;
			
			switch (_view) do {
				case "backpack": {
					_kind = switch (true) do { case ((_get select 4) < 6): {0}; case ((_get select 4) in [100,101]): {1}; default {-1}};
					_gear_backpack_content set [_kind, [_gear_backpack_content select _kind, "substract", if (_kind == 0) then {_item_selected} else {_get select 6}] Call WFBE_CL_FNC_OperateCargoGear];
					[_lb_cargo, _gear_backpack_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;
					_has_inv_changed = true;
					_update_backpack = true;
				};
				case "vehicle": {
					_kind = switch (true) do { case ((_get select 4) < 6): {0}; case ((_get select 4) in [100,101]): {1}; case ((_get select 4) in [200,201]): {2}; default {-1}};
					_gear_vehicle_content set [_kind, [_gear_vehicle_content select _kind, "substract", if (_kind == 1) then {_get select 6} else {_item_selected}] Call WFBE_CL_FNC_OperateCargoGear];
					[_lb_cargo, _gear_vehicle_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;
					_has_veh_changed = true;
					_update_vehicle = true;
				};
			};
			
			_update_inventory = true;
		};
	};
	
	//--- Add an item
	if (_update_item) then {
		_update_item = false;
		_ui_lnb_currow = lnbCurSelRow _lb_main;
		if (_ui_lnb_currow > -1) then {
			if (_tab_current != 0) then {
				_item_selected = lnbData[_lb_main,[_ui_lnb_currow, 0]];
				_get = missionNamespace getVariable _item_selected;
				_belong = _get select 4;
				if !(isNil '_get') then {
					switch (_view) do {
						case "gear": {
							switch (_belong) do {
								case 0: {_gear_refresh = [];if (_gear_primary != "") then {_gear_mag_main = [_gear_primary, _item_selected, _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]}; _gear_sel_weapons = _gear_sel_weapons - [_gear_primary];_gear_primary = _item_selected; _gear_sel_weapons = _gear_sel_weapons + [_gear_primary]; _gear_refresh = _gear_refresh + ["weapons"];_update_inventory = true;_has_inv_changed = true;};// todo update mags
								case 1: {_gear_refresh = [];if (_gear_pistol != "") then {_gear_mag_pool = [_gear_pistol, _item_selected, _gear_mag_pool] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_hand"]};_gear_sel_weapons = _gear_sel_weapons - [_gear_pistol];_gear_pistol = _item_selected; _gear_sel_weapons = _gear_sel_weapons + [_gear_pistol]; _gear_refresh = _gear_refresh + ["weapons"];_update_inventory = true;_has_inv_changed = true;};
								case 2: {_add = true;if (_gear_primary != "") then {if ((missionNamespace getVariable _gear_primary) select 4 == 3) then {_add = false}};if (_add) then {_gear_refresh = [];if (_gear_backpack != "") then {_gear_sel_weapons = _gear_sel_weapons - [_gear_backpack];_gear_backpack_content = [[[],[]],[[],[]]];_gear_backpack = "";[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;};if (_gear_secondary != "") then {_gear_mag_main = [_gear_secondary, _item_selected, _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]};_gear_sel_weapons = _gear_sel_weapons - [_gear_secondary];_gear_secondary = _item_selected; _gear_sel_weapons = _gear_sel_weapons + [_gear_secondary]; _gear_refresh = _gear_refresh + ["weapons"];_update_inventory = true;_has_inv_changed = true;}};
								case 3: {_gear_refresh = [];if (_gear_backpack != "") then {_gear_sel_weapons = _gear_sel_weapons - [_gear_backpack];_gear_backpack_content = [[[],[]],[[],[]]];_gear_backpack = "";[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;};if (_gear_primary != "") then {if (_gear_secondary != "") then {_gear_mag_main = [_gear_secondary, "", _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear};_gear_mag_main = [_gear_primary, _item_selected, _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]};_gear_sel_weapons = _gear_sel_weapons - [_gear_primary, _gear_secondary];_gear_primary = _item_selected; _gear_sel_weapons = _gear_sel_weapons + [_gear_primary]; _gear_secondary = ""; _gear_refresh = _gear_refresh + ["weapons"];_update_inventory = true;_has_inv_changed = true;};
								case 4: {if (!(_item_selected in _gear_special) && count _gear_special < 2) then {_gear_special = _gear_special + [_item_selected]; _gear_sel_weapons = _gear_sel_weapons + [_item_selected]; _gear_refresh = ["special"];_update_inventory = true;_has_inv_changed = true;}};
								case 5: {if !(_item_selected in _gear_items) then {_gear_items = _gear_items + [_item_selected]; _gear_sel_weapons = _gear_sel_weapons + [_item_selected]; _gear_refresh = ["items"];_update_inventory = true;_has_inv_changed = true;}};
								case 100: {_mag_size = _get select 5; _size = (_gear_mag_pool) Call WFBE_CL_FNC_GetMagazinesSize; if (_mag_size + _size <= 8) then {_gear_mag_pool = _gear_mag_pool + [_get select 6];_gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_hand"]; _has_inv_changed = true; _update_inventory = true;}};
								case 101: {_mag_size = _get select 5; _size = (_gear_mag_main) Call WFBE_CL_FNC_GetMagazinesSize; if (_mag_size + _size <= 12) then {_gear_mag_main = _gear_mag_main + [_get select 6];_gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]; _has_inv_changed = true; _update_inventory = true;}};							
								case 200: {_add = true;if !(_target_cancarrybp) then {_add = false; hint "The target cannot carry a backpack!"};if (_gear_primary != "") then {if ((missionNamespace getVariable _gear_primary) select 4 == 3) then {_add = false}};if (_add) then {_gear_refresh = [];_gear_backpack_content = _get select 5;if (_gear_secondary != "") then {_gear_mag_main = [_gear_secondary, "", _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]; _gear_sel_weapons = _gear_sel_weapons - [_gear_secondary]};_gear_sel_weapons = _gear_sel_weapons - [_gear_backpack];_gear_backpack = _item_selected; _gear_sel_weapons = _gear_sel_weapons + [_gear_backpack]; _gear_refresh = _gear_refresh + ["weapons"];[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;_update_inventory = true;_has_inv_changed = true;}};
								case 201: {_add = true;if !(_target_cancarrybp) then {_add = false; hint "The target cannot carry a backpack!"};if (_gear_primary != "") then {if ((missionNamespace getVariable _gear_primary) select 4 == 3) then {_add = false}};if (_add) then {_gear_refresh = [];_gear_backpack_content = [[[],[]],[[],[]]];if (_gear_secondary != "") then {_gear_mag_main = [_gear_secondary, "", _gear_mag_main] Call WFBE_CL_FNC_ReplaceMagazinesGear; _gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]; _gear_sel_weapons = _gear_sel_weapons - [_gear_secondary]};_gear_sel_weapons = _gear_sel_weapons - [_gear_backpack];_gear_backpack = _item_selected; _gear_sel_weapons = _gear_sel_weapons + [_gear_backpack]; _gear_refresh = _gear_refresh + ["weapons"];[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;_update_inventory = true;_has_inv_changed = true;}};
							};
						};
						case "backpack": {
							_kind = switch (true) do { case (_belong < 6): {0}; case (_belong in [100,101]): {1}; default {-1}};
							if (_kind == -1) exitWith {};
							_returned = [_gear_backpack, _gear_backpack_content] Call WFBE_CL_FNC_GetGearCargoSize;
							_add = false;
							if (_belong < 4 && _returned select 2 && ((_returned select 0) >= (_get select 5))) then {_add = true};
							if (_belong > 3 && _returned select 1 && ((_returned select 0) >= (_get select 5))) then {_add = true};
							if (_add) then {
								_gear_backpack_content set [_kind, [_gear_backpack_content select _kind, "add", if (_kind == 0) then {_item_selected} else {_get select 6}] Call WFBE_CL_FNC_OperateCargoGear];
								[_lb_cargo, _gear_backpack_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;
								_has_inv_changed = true;
								_update_inventory = true;
								_update_backpack = true;
							};
						};
						case "vehicle": {
							_kind = switch (true) do { case (_belong < 6): {0}; case (_belong in [100,101]): {1}; case (_belong in [200,201]): {2}; default {-1}};
							if (_kind == -1) exitWith {};
							_returned = [typeOf (vehicle _target), _gear_vehicle_content] Call WFBE_CL_FNC_GetVehicleCargoSize;
							_add = false;
							switch (true) do {
								case (_belong < 4 && (_returned select 0) > 0): {_add = true};
								case (_belong in [4,5,100,101] && (_returned select 1) > 0): {_add = true};
								case (_belong in [200,201] && (_returned select 2) > 0): {_add = true};
							};
							if (_add) then {
								_gear_vehicle_content set [_kind, [_gear_vehicle_content select _kind, "add", if (_kind == 1) then {_get select 6} else {_item_selected}] Call WFBE_CL_FNC_OperateCargoGear];
								[_lb_cargo, _gear_vehicle_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;
								_has_veh_changed = true;
								_update_inventory = true;
								_update_vehicle = true;
							};
						};
					};
				};
			} else {
				//--- Templates
				if (_view == "gear") then {
					_item_selected = lnbValue[_lb_main,[_ui_lnb_currow, 0]];
					_template = (missionNamespace getVariable Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText]) select _item_selected;
					
					_weapons = _template select 4;
					_magazines = _template select 5;
					_backpack_content = _template select 6;
					
					if (count _backpack_content == 0) then {_backpack_content = [[[],[]],[[],[]]]};
					_magazines = (_magazines) Call WFBE_CL_FNC_UI_Gear_ParseTemplateContent;
					
					_returned = [_weapons, _magazines] Call WFBE_CL_FNC_GetParsedGear;
					_gear_primary = _returned select 0;
					_gear_secondary = _returned select 1;
					_gear_pistol = _returned select 2;
					_gear_backpack = _returned select 3;
					_gear_special = _returned select 4;
					_gear_items = _returned select 5;
					_gear_mag_main = _returned select 6;
					_gear_mag_pool = _returned select 7;
					_gear_refresh = ["all"];
					
					//--- If the target is unable to carry a backpack or a tripod, we remove it from the template.
					if !(_target_cancarrybp) then {
						if (_gear_backpack != "") then {_gear_secondary = ""; _weapons = _weapons - [_gear_backpack]};
						_gear_backpack = ""; 
						_gear_sel_backpack = [[[],[]],[[],[]]];
					};
					
					[_gear_backpack,_target] Call WFBE_CL_FNC_UI_Gear_UpdateView;
					_gear_sel_weapons = +_weapons;
					_gear_sel_magazines = +_magazines;
					_gear_backpack_content = +_backpack_content;
					_has_inv_changed = true;
					_update_inventory = true;
				};
			};
		};
	};
	
	//--- Add a magazine
	if (_update_item_mag) then {
		_update_item_mag = false;
		_ui_lnb_currow = lnbCurSelRow _lb_secondary;
		if (_ui_lnb_currow > -1) then {
			_item_selected = lnbData[_lb_secondary,[_ui_lnb_currow, 0]];
			_get = missionNamespace getVariable _item_selected;
			if !(isNil '_get') then {
				switch (_view) do {
					case "gear": {
						switch (_get select 4) do {
							case 100: {_mag_size = _get select 5; _size = (_gear_mag_pool) Call WFBE_CL_FNC_GetMagazinesSize; if (_mag_size + _size <= 8) then {_gear_mag_pool = _gear_mag_pool + [_get select 6];_gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_hand"]; _update_inventory = true;_has_inv_changed = true;}};
							case 101: {_mag_size = _get select 5; _size = (_gear_mag_main) Call WFBE_CL_FNC_GetMagazinesSize; if (_mag_size + _size <= 12) then {_gear_mag_main = _gear_mag_main + [_get select 6];_gear_sel_magazines = _gear_mag_main + _gear_mag_pool; _gear_refresh = ["magazines_main"]; _update_inventory = true;_has_inv_changed = true;}};
						};
					};
					case "backpack": {
						_returned = [_gear_backpack, _gear_backpack_content] Call WFBE_CL_FNC_GetGearCargoSize;
						if (_returned select 1 && ((_returned select 0) >= (_get select 5))) then {
							_gear_backpack_content set [1, [_gear_backpack_content select 1, "add", _get select 6] Call WFBE_CL_FNC_OperateCargoGear];
							[_lb_cargo, _gear_backpack_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;
							_has_inv_changed = true;
							_update_inventory = true;
							_update_backpack = true;
						};
					};
					case "vehicle": {
						_returned = [typeOf (vehicle _target), _gear_vehicle_content] Call WFBE_CL_FNC_GetVehicleCargoSize;
						if ((_returned select 1) > 0) then {
							_gear_vehicle_content set [1, [_gear_vehicle_content select 1, "add", _get select 6] Call WFBE_CL_FNC_OperateCargoGear];
							[_lb_cargo, _gear_vehicle_content, true] Call WFBE_CL_FNC_UI_Gear_FillCargoList;
							_has_veh_changed = true;
							_update_inventory = true;
							_update_vehicle = true;
						};
					};
				};
			};
		};
	};
	
	//--- Update the backpack view
	if (_update_backpack) then {
		_update_backpack = false;
		_returned = [_gear_backpack, _gear_backpack_content] Call WFBE_CL_FNC_GetGearCargoSize;
		_html = Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Capacity:</t><br /><br /><t color='#42b6ff' shadow='1'>Weapons: </t><t shadow='1'>%1/%2 (Size: %3)</t><br /><t color='#42b6ff' shadow='1'>Magazines: </t><t shadow='1'>%4/%5</t><br /><t color='#42b6ff' shadow='1'>Overall: </t><t shadow='1' color='#FF6242'>%6/%7</t>",_returned select 5, getNumber(configFile >> 'CfgVehicles' >> _gear_backpack >> 'transportMaxWeapons'),_returned select 3,_returned select 4,getNumber(configFile >> 'CfgVehicles' >> _gear_backpack >> 'transportMaxMagazines'),(_returned select 3)+(_returned select 4),getNumber(configFile >> 'CfgVehicles' >> _gear_backpack >> 'transportMaxMagazines')];
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl 503006) ctrlSetStructuredText (parseText _html);
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl 503007) ctrlSetStructuredText (parseText Format["<img size='5' image='%1' align='right'/>",(missionNamespace getVariable _gear_backpack) select 0]);
	};
	
	//--- Update the vehicles view
	if (_update_vehicle) then {
		_update_vehicle = false;
		_returned = [typeOf (vehicle _target), _gear_vehicle_content] Call WFBE_CL_FNC_GetVehicleCargoSize;
		_html = Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Capacity:</t><br /><br /><t color='#42b6ff' shadow='1'>Weapons: </t><t shadow='1'>%1/%2</t><br /><t color='#42b6ff' shadow='1'>Magazines: </t><t shadow='1'>%3/%4</t><br /><t color='#42b6ff' shadow='1'>Backpacks: </t><t shadow='1'>%5/%6</t><br />",_returned select 3,getNumber(configFile >> 'CfgVehicles' >> typeOf (vehicle _target) >> 'transportMaxWeapons'),_returned select 4,getNumber(configFile >> 'CfgVehicles' >> typeOf (vehicle _target) >> 'transportMaxMagazines'),_returned select 5,getNumber(configFile >> 'CfgVehicles' >> typeOf (vehicle _target) >> 'transportMaxBackpacks')];
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl 503006) ctrlSetStructuredText (parseText _html);
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl 503007) ctrlSetStructuredText (parseText Format["<img size='5' image='%1' align='right'/>",getText(configFile >> 'CfgVehicles' >> typeOf (vehicle _target) >> 'picture')]);
	};
	
	//--- Update the magazines view
	if (_update_magazines) then {
		_update_magazines = false;
		_ui_lnb_currow = lnbCurSelRow _lb_main;
		if (_ui_lnb_currow > -1) then {
			_item_selected = lnbData[_lb_main,[_ui_lnb_currow, 0]];
			_get = missionNamespace getVariable _item_selected;
			if ((_get select 4) in [0,1,2,3,4]) then {
				lnbClear _lb_secondary;
				[_lb_secondary, [[_get select 6, "Mag_"]]] Call WFBE_CL_FNC_UI_Gear_FillList;
			};
		};
	};
	
	//--- Purchase
	if (_purchase) then {
		_purchase = false;
		if ((Call WFBE_CL_FNC_GetClientFunds) >= _price) then {
			_target_weapons = +_gear_sel_weapons;
			_target_magazines = +_gear_sel_magazines;
			_gear_sel_backpack = +_gear_backpack_content;
			_gear_sel_vehicle = +_gear_vehicle_content;
			_msg = "";
			if (_target isKindOf "Man" && _has_inv_changed) then {
				_msg = _msg + Format["<t color='#B6F563'>%1</t>",[configFile >> 'CfgVehicles' >> typeOf _target, "displayName"] Call WFBE_CO_FNC_GetConfigEntry];
				[_target, _target_weapons - [_gear_backpack], _target_magazines, [_gear_primary,_gear_pistol,_gear_secondary], _gear_backpack, _gear_sel_backpack] Call WFBE_CO_FNC_EquipUnit;
				//--- Store the gear over the unit for rearms.
				_target setVariable ["wfbe_custom_gear", [_target_weapons - [_gear_backpack], _target_magazines, _gear_backpack, _gear_sel_backpack, [_gear_primary,_gear_pistol,_gear_secondary]]];
				//--- Set the gear cost on the unit.
				_gear_cost = [[[],_target_weapons],[[],_target_magazines],[[], _gear_sel_backpack],[[], []]] Call WFBE_CL_FNC_UI_Gear_UpdatePrice;
				_target setVariable ["wfbe_custom_gear_cost", _gear_cost select 0];
			};
			if (_has_veh_changed) then {
				if (_msg != "") then {_msg = _msg + " ,"};
				_msg = _msg + Format["<t color='#B6F563'>%1</t>", [configFile >> 'CfgVehicles' >> typeOf _target, "displayName"] Call WFBE_CO_FNC_GetConfigEntry];
				[vehicle _target, _gear_sel_vehicle] Call WFBE_CO_FNC_EquipVehicle;
			};
			-(_price) Call WFBE_CL_FNC_ChangeClientFunds;
			if (_has_inv_changed || _has_veh_changed) then {hint parseText Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>Purchased Equipement to %1 for $<t color='#F5D363'>%2</t>.</t>",_msg,_price];_price = 0;} else {hint parseText("<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>The gear was not purchased since nothing has changed.</t>");};
			_has_inv_changed = false;
			_has_veh_changed = false;
			_update_inventory = true;
		} else {
			hint parseText Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t><t color='#F56363'>Cannot</t> purchase equipment, missing $<t color='#F5D363'>%1</t>.</t>",_price - (Call WFBE_CL_FNC_GetClientFunds)];
		};
	};
	
	//--- Create a template
	if (_template_create) then {
		_template_create = false;
		[_gear_sel_weapons, _gear_sel_magazines, _gear_backpack_content] Call WFBE_CL_FNC_UI_Gear_AddTemplate;
		if (_tab_current == 0) then {_update_tab = true};
	};
	
	//--- Delete a template
	if (_template_delete) then {
		_template_delete = false;
		_ui_lnb_currow = lnbCurSelRow _lb_main;
		if (_ui_lnb_currow > -1 && _tab_current == 0 && _view == "gear") then {
			_item_selected = lnbValue[_lb_main,[_ui_lnb_currow, 0]];
			(_item_selected) Call WFBE_CL_FNC_UI_Gear_DeleteTemplate;
			if (_tab_current == 0) then {_update_tab = true};
		} else {
			hint "A template may only be removed from the template tab in the gear view.";
		};
	};
	
	//--- Update the target eta
	if !(alive _target) then {
		//--- Get a living target
		hint "the target is dead, refreshing";
		_update_target = true;
		_target = player;
		_targets = (_target) Call WFBE_CL_FNC_UI_Gear_UpdateTarget;
	};
	
	//--- Update the gear view
	if (_update_inventory) then {
		//todo later, template for veh / bp
		_update_inventory = false;
		_update_display = true;
		_prices = [[_target_weapons,_gear_sel_weapons],[_target_magazines,_gear_sel_magazines],[_gear_sel_backpack, _gear_backpack_content],[_gear_sel_vehicle, _gear_vehicle_content]] Call WFBE_CL_FNC_UI_Gear_UpdatePrice;
		_price = _prices select 0;
		((uiNamespace getVariable "wfbe_display_buygear") displayCtrl 503008) ctrlSetStructuredText (parseText Format["<t size='1.1'><t color='#42b6ff' shadow='1'>Gear Cost: </t><t shadow='1' color='%1'>$%2.</t></t>",if (_price > 0) then {'#F56363'} else {'#76F563'},_price]);
	};
	
	//--- Update the inventory
	if (_update_display) then {
		_update_display = false;
		if (_view == "gear") then {[_gear_sel_weapons, _gear_sel_magazines, _gear_refresh] Call WFBE_CL_FNC_UI_Gear_DisplayInventory};
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
{uiNamespace setVariable [_x, nil]} forEach ["wfbe_display_buygear","wfbe_display_buygear_misc","wfbe_display_buygear_pool_main","wfbe_display_buygear_pool_gun"];