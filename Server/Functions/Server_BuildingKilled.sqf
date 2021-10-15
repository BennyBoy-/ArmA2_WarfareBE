Private ['_current','_find','_killer','_logik','_structure','_structures','_side','_tked','_type','_uid'];
_structure = _this select 0;
_killer = _this select 1;
_type = _this select 2;

_side = _structure getVariable "wfbe_side";
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

["INFORMATION", Format ["Server_BuildingKilled.sqf: [%1] Structure [%2] has been destroyed by [%3].",str _side, _type, _killer]] Call WFBE_CO_FNC_LogContent;

//--- Building Teamkill.
if ((side _killer == _side)&&(isPlayer(_killer))) then {
	_uid = getPlayerUID _killer;
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_UID_SHOW") == 0) then {_uid = "xxxxxxx"};
	[_side, "LocalizeMessage", ['BuildingTeamkill',name _killer,_uid,_type]] Call WFBE_CO_FNC_SendToClients;

	["INFORMATION", Format ["Server_BuildingKilled.sqf: [%1] [%2] has teamkilled a friendly structure.",name _killer,_uid]] Call WFBE_CO_FNC_LogContent;
};

//--- Decrement building limit.
_find = (missionNamespace getVariable Format ['WFBE_%1STRUCTURENAMES',_side]) find _type;
if (_find != -1) then {
	_current = _logik getVariable "wfbe_structures_live";
	_current set [_find - 1, (_current select (_find-1)) - 1];
	_logik setVariable ["wfbe_structures_live", _current, true];
};

_logik setVariable ["wfbe_structures", (_logik getVariable "wfbe_structures") - [_structure, objNull], true];

[_side, "Destroyed", ["Base", _structure]] Spawn SideMessage;

//--- Can be fixed with workers.
if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 1) then {
	Private ["_nearLogic","_position","_sold"];
	
	_sold = _structure getVariable "sold";
	
	if (isNil '_sold') then {
		//--- Grab the logic.
		_position = getPos _structure;
		_nearLogic = _position nearEntities [["LocationLogicStart"],15];
		_nearLogic = [_position, _nearLogic] Call WFBE_CO_FNC_GetClosestEntity;
		
		if (isNull _nearLogic) exitWith {};
		
		//--- Completed at 25% on destruction, dropping until it reach 0 (delete).
		_nearLogic setVariable ["WFBE_B_Completion", 25];
		//--- The ratio gets lower after each destruction.
		_nearLogic setVariable ["WFBE_B_CompletionRatio", (_nearLogic getVariable "WFBE_B_CompletionRatio")*0.8];
		//--- Can be repaired.
		_nearLogic setVariable ["WFBE_B_Repair", true];
		
		_logik setVariable ["wfbe_structures_logic", (_logik getVariable "wfbe_structures_logic") + [_nearLogic]];
		
		[_nearLogic, typeOf _structure, _side, _find - 1] Spawn HandleBuildingRepair;
	};
};

sleep 10;

deleteVehicle _structure;
