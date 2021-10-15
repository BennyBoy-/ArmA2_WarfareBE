/*
	Add a template to the gear templates.
	 Parameters:
		- Weapons
		- Magazines
		- Backpack Content
*/

Private ["_backpack_content","_counts","_counts_b","_emplacement","_flag_cannotadd","_get","_index","_items","_mags","_magazines","_prefix","_process","_side_equipment","_template","_upgrades","_u_backpack","_u_belong","_u_label","_u_labels","_u_picture","_u_pictures","_u_price","_u_upgrade","_weapons"];

_weapons = +(_this select 0);
_magazines = +(_this select 1);
_backpack_content = +(_this select 2);

_u_upgrade = 0;
_u_price = 0;
_u_label = "";
_u_labels = ["","",""];
_u_picture = "";
_u_pictures = ["",""];
_u_backpack = "";
_set = [];
_mags = [];
_counts = [];

_side_equipment = missionNamespace getVariable Format ["WFBE_%1_All", WFBE_Client_SideJoinedText];
_flag_cannotadd = false;

//--- Weapons
for '_i' from 0 to count(_weapons)-1 do {
	_get = missionNamespace getVariable (_weapons select _i);
	if !(isNil '_get') then {
		_process = true;
		if !(WFBE_Allow_HostileGearSaving) then {if !((_weapons select _i) in _side_equipment) then {_weapons set [_i, false]; _process = false; _flag_cannotadd = true; ["INFORMATION", Format["Client_UI_Gear_AddTemplate.sqf : [%1] Weapon [%2] is not known by the player's side.",WFBE_Client_SideJoinedText,(_weapons select _i)]] Call WFBE_CO_FNC_LogContent}};
		if (_process) then {
			_u_belong = _get select 4;
			if ((_get select 3) > _u_upgrade) then {_u_upgrade = (_get select 3)};
			_u_price = _u_price + (_get select 2);
			if (_u_belong in [0,3]) then {_u_labels set [0, _get select 1];_u_pictures set [0, _get select 0]};
			if (_u_belong == 1) then {_u_labels set [2, _get select 1]};
			if (_u_belong == 2) then {_u_labels set [1, _get select 1];_u_pictures set [1, _get select 0]};
			switch (true) do {
				case (_u_belong < 4): {
					if (_u_picture == "") then {_u_picture = (_get select 0)};
				};
				case (_u_belong == 200): {_u_backpack = _weapons select _i};
			};
		};
	} else {
		["WARNING", Format["Client_UI_Gear_AddTemplate.sqf : [%1] Item [%2] is not a defined within any Gear files",WFBE_Client_SideJoinedText,(_weapons select _i)]] Call WFBE_CO_FNC_LogContent;
		_weapons set [_i, false];
	};
};

//--- Attempt to set the best picture.
if (_u_picture != "") then {
	{if (_x != "") exitWith {_u_picture = _x}} forEach _u_pictures;
};

//--- Attempt to set the best desc.
{
	if (_x != "") then {
		if (_u_label != "") then {_u_label = Format ["%1 | %2",_u_label, _x]} else {_u_label = _x};
	};
} forEach _u_labels;

_weapons = _weapons - [false];
//--- Magazines
if (count _magazines > 0) then {
	{
		_get = missionNamespace getVariable Format["Mag_%1",_x];
		if !(isNil '_get') then {
			_process = true;
			if !(WFBE_Allow_HostileGearSaving) then {if !(_x in _side_equipment) then {_process = false; _flag_cannotadd = true; ["INFORMATION", Format["Client_UI_Gear_AddTemplate.sqf : [%1] Magazine [%2] is not known by the player's side.",WFBE_Client_SideJoinedText,_x]] Call WFBE_CO_FNC_LogContent}};
			if (_process) then {
				_index = _mags find _x;
				if (_index != -1) then {
					_counts set [_index, (_counts select _index)+1];
				} else {
					[_mags, _x] Call WFBE_CO_FNC_ArrayPush;
					[_counts, 1] Call WFBE_CO_FNC_ArrayPush;
				};
				if ((_get select 3) > _u_upgrade) then {_u_upgrade = (_get select 3)};
				if (_u_picture == "") then {_u_picture = (_get select 0)};
				if (_u_label == "") then {_u_label = (_get select 1)};
				_u_price = _u_price + (_get select 2);
			};
		} else {
			["WARNING", Format["Client_UI_Gear_AddTemplate.sqf : [%1] Magazine [%2] is not a defined within any Gear files",WFBE_Client_SideJoinedText,_x]] Call WFBE_CO_FNC_LogContent;
		};
	} forEach _magazines;
};

//--- Backpacks
if (_u_backpack != "" && count(_backpack_content) > 0) then {
	_prefix = "";
	for '_i' from 0 to count(_backpack_content)-1 do {
		_emplacement = _backpack_content select _i;
		
		if (count _emplacement > 0) then {
			_items = _emplacement select 0;
			_counts_b = _emplacement select 1;
			
			for '_j' from 0 to count(_items)-1 do {
				_process = true;
				if !(WFBE_Allow_HostileGearSaving) then {if !((_items select _j) in _side_equipment) then {_items set [_j, false];_counts_b set [_j, false];_process = false; _flag_cannotadd = true;["INFORMATION", Format["Client_UI_Gear_AddTemplate.sqf : [%1] Backpack item [%2] is not known by the player's side.",WFBE_Client_SideJoinedText,(_items select _j)]] Call WFBE_CO_FNC_LogContent}};
				if (_process) then {
					_get = missionNamespace getVariable Format["%1%2",_prefix,(_items select _j)];
					if !(isNil '_get') then {
						if ((_get select 3) > _u_upgrade) then {_u_upgrade = (_get select 3)};
						if (_u_picture == "") then {_u_picture = (_get select 0)};
						if (_u_label == "") then {_u_label = (_get select 1)};
						_u_price = _u_price + ((_get select 2)*(_counts_b select _j));
					} else {
						["WARNING", Format["Client_UI_Gear_AddTemplate.sqf : [%1] Backpack item [%2] is not a defined within any Gear files",WFBE_Client_SideJoinedText,(_items select _j)]] Call WFBE_CO_FNC_LogContent;
						_items set [_j, false];
						_counts_b set [_j, false];
					};
				};
			};
			
			_items = _items - [false];
			_counts_b = _counts_b - [false];
			_backpack_content set [_i, [_items,_counts_b]];
		};
		_prefix = "Mag_";
	};
} else {
	_backpack_content = [];
};

if (_flag_cannotadd) exitWith {hint parseText("<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>The template cannot be set due to some foreign equipment.</t>")};

//--- Check the final upgrade level.
_upgrades = (WFBE_Client_SideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
if (_u_upgrade <= (_upgrades select WFBE_UP_BARRACKS) || _u_upgrade <= (_upgrades select WFBE_UP_GEAR)) then {
	_set set [0,_u_picture];
	_set set [1,_u_label];
	_set set [2,_u_price];
	_set set [3,_u_upgrade];
	_set set [4,_weapons];
	_set set [5,[_mags,_counts]];
	_set set [6,_backpack_content];

	_template = missionNamespace getVariable Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText];
	[_template, _set] Call WFBE_CO_FNC_ArrayPush;
	missionNamespace setVariable [Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText], _template];
} else {
	hint parseText("<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>The template upgrade level is above the current gear or barrack upgrade level.</t>");
};