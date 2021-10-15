Private ["_allowCustom","_buildings","_charge","_funds","_get","_loadDefault","_listbp","_mode","_price","_skip","_spawn","_spawnInside","_typeof","_unit","_weaps"];

_unit = _this select 0;
_spawn = _this select 1;
_loadDefault = true;
_typeof = typeOf _spawn;

WFBE_Client_IsRespawning = false;
_allowCustom = true;

//--- Default gear enforcement on mobile respawn.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_MOBILE") == 2) then {
	if (_typeof in (missionNamespace getVariable Format ["WFBE_%1AMBULANCES",sideJoinedText])) then {_allowCustom = false};
};

//--- Default gear enforcement on mash respawn.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_MASH") == 2) then {
	if (_typeof == (missionNamespace getVariable Format ["WFBE_%1FARP",sideJoinedText])) then {_allowCustom = false};
};

//--- Default gear enforcement on leader respawn.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_LEADER") == 2) then {
	if (_spawn == leader group _unit) then {_allowCustom = false};
};

//--- Respawn.
if (_spawn isKindOf "Man") then {_spawn = vehicle _spawn};
_spawnInside = false;
if (_typeof in (missionNamespace getVariable Format ["WFBE_%1AMBULANCES",sideJoinedText]) && alive _spawn) then {
	if (_spawn emptyPositions "cargo" > 0 && !(locked _spawn)) then {_unit moveInCargo _spawn;_spawnInside = true};
};

if !(_spawnInside) then {_unit setPos ([getPos _spawn,10,20] Call GetRandomPosition)};

//--- Loadout.
if (!isNil {_unit getVariable "wfbe_custom_gear"} && !WFBE_RespawnDefaultGear && _allowCustom) then {
	_mode = missionNamespace getVariable "WFBE_C_RESPAWN_PENALTY";
	
	if (_mode in [0,2,3,4,5]) then {
		//--- Calculate the price/funds.
		_skip = false;
		_gear_cost = _unit getVariable "wfbe_custom_gear_cost";
		if (_mode != 0) then {
			_price = 0;
			
			//--- Get the mode pricing.
			switch (_mode) do {
				case 2: {_price = _gear_cost};
				case 3: {_price = round(_gear_cost/2)};
				case 4: {_price = round(_gear_cost/4)};
				case 5: {_price = _gear_cost};
			};
			
			//--- Are we charging only on mobile respawn?
			_charge = true;
			if (_mode == 5) then {
				_buildings = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;
				if (_spawn in _buildings || _spawn == ((sideJoined) Call WFBE_CO_FNC_GetSideHQ)) then {_charge = false};
			};
			
			//--- Charge if possible.
			_funds = Call GetPlayerFunds;
			if (_funds >= _price && _charge) then {
				-(_price) Call ChangePlayerFunds;
				(Format[localize 'STR_WF_CHAT_Gear_RespawnCharge',_price]) Call GroupChatMessage;
			};
			
			//--- Check that the player has enough funds.
			if (_funds < _price) then {_skip = true};
		};
		
		//--- Use the respawn loadout.
		if !(_skip) then {
			_get = _unit getVariable "wfbe_custom_gear";
			[_unit, _get select 0, _get select 1, _get select 4, _get select 2, _get select 3] Call WFBE_CO_FNC_EquipUnit;
			_loadDefault = false;
		};
	};
};

//--- Load the default loadout.
if (_loadDefault) then {
	Private ["_default"];
	_default = missionNamespace getVariable Format["WFBE_%1_DefaultGear", WFBE_Client_SideJoinedText];
	if (count _default <= 3) then {
		[_unit, _default select 0, _default select 1, _default select 2] Call WFBE_CO_FNC_EquipUnit;
	} else {
		[_unit, _default select 0, _default select 1, _default select 2, _default select 3, _default select 4] Call WFBE_CO_FNC_EquipUnit;
	};
};