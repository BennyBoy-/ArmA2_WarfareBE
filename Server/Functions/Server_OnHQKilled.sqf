/*
	Triggered whenever the HQ is killed.
	 Parameters:
		- HQ
		- Shooter
*/

Private ["_building","_dammages","_dammages_current","_get","_killer","_logik","_origin","_structure"];

_structure = _this select 0;
_killer = _this select 1;

_structure_kind = typeOf _structure;
_side = _structure getVariable "wfbe_side";
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

//--- If HQ was mobibilized, spawn a dead hq.
if ((_side) Call WFBE_CO_FNC_GetSideHQDeployStatus) then {
	Private ["_hq"];
	_hq = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _side], getPos _structure, (_side) Call WFBE_CO_FNC_GetSideID, getDir _structure, false, false, false] Call WFBE_CO_FNC_CreateVehicle;
	_hq setPos (getPos _structure);
	_hq setVariable ["wfbe_trashable", false];
	_hq setVariable ["wfbe_side", _side];
	_hq setDamage 1;

	//--- HQ is now considered mobilized.
	_logik setVariable ["wfbe_hq_deployed", false, true];
	_logik setVariable ["wfbe_hq",_hq,true];
	
	//--- Remove the structure after the burial.
	(_structure) Spawn {sleep 10; deleteVehicle _this};
};

//--- Spawn a radio message.
[_side, "Destroyed", ["Base", _structure]] Spawn SideMessage;

//--- Teamkill? [_side, "SendMessage", ["command", "tkill", [name _killer, _structure_kind]]] Call WFBE_CO_FNC_SendToClients
_teamkill = if (side _killer == _side) then {true} else {false};
if (_teamkill && isPlayer _killer) then {[_side, "LocalizeMessage", ['BuildingTeamkill',name _killer,_uid, _structure_kind]] Call WFBE_CO_FNC_SendToClients};

["INFORMATION", Format["Server_OnHQKilled.sqf : [%1] HQ [%2] has been destroyed by [%3], Teamkill? [%4], Side Teamkill? [%5]", _side, _structure_kind, _killer, _teamkill, side _killer]] Call WFBE_CO_FNC_LogContent;