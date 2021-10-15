/*
	AI Commander Upgrade script.
	 Parameters:
		- Side.
*/

Private["_can_upgrade","_cost","_funds","_level","_logik","_path","_side","_to_upgrade","_upgrade","_upgrades"];

_side = _this;
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

_path = missionNamespace getVariable Format ["WFBE_C_UPGRADES_%1_AI_ORDER", _side];
_upgrades = _logik getVariable "wfbe_upgrades";

//--- Get the existing content.
_to_upgrade = [];
{
	_upgrade = _x select 0;
	_level = _x select 1;
	
	if (_upgrades select _upgrade < _level) exitWith {_to_upgrade = _x};
} forEach _path;

//--- Found something to upgrade!
if (count _to_upgrade > 0) then {
	_upgrade = _to_upgrade select 0;
	_cost = ((missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_COSTS", _side]) select _upgrade) select (_to_upgrade select 1);
	
	//--- Validation.
	_can_upgrade = false;
	
	_funds = _side Call GetAICommanderFunds;
	if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {
		if ((_side Call WFBE_CO_FNC_GetSideSupply) >= (_cost select 0) && _funds >= (_cost select 1)) then {_can_upgrade = true};
	} else {
		if (_funds >= (_cost select 1)) then {_can_upgrade = true};
	};
	
	//--- Roll on!
	if (_can_upgrade) then {
		[_side, _upgrade, _upgrades select _upgrade, false] Spawn WFBE_SE_FNC_ProcessUpgrade;
		_logik setVariable ["wfbe_upgrading", true, true];
		
		//--- Deduct.
		[_side,-(_cost select 0)] Call ChangeAICommanderFunds;
		
		if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {
			[_side,-(_cost select 1)] Call ChangeSideSupply;
		};
	};
};