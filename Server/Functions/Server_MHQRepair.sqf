Private ["_commanderTeam","_direction","_hq","_HQName","_logik","_MHQ","_position","_side","_sideID","_sideText"];

_side = _this select 0;
_sideText = str _side;
_sideID = (_side) Call GetSideID;

_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
_position = getPos _hq;
_direction = getDir _hq;

_commanderTeam = (_side) Call WFBE_CO_FNC_GetCommanderTeam;
if !(isNull _commanderTeam) then {
	if (isPlayer (leader _commanderTeam)) then {
		if (WF_A2_Vanilla) then {
			[getPlayerUID(leader _commanderTeam), "HandleSpecial", ["hq-setstatus", false]] Call WFBE_CO_FNC_SendToClients;
		} else {
			[leader _commanderTeam, "HandleSpecial", ["hq-setstatus", false]] Call WFBE_CO_FNC_SendToClient;
		};
	};
};

sleep 15;

_MHQ = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _sideText], _position, _sideID, _direction, true, false] Call WFBE_CO_FNC_CreateVehicle;
_MHQ setVariable ["WFBE_Taxi_Prohib", true];
_MHQ setVariable ["wfbe_trashed", false];
_MHQ setVariable ["wfbe_side", _side];
_MHQ setVariable ["wfbe_structure_type", "Headquarters"];
_MHQ addEventHandler ['killed', {_this Spawn WFBE_SE_FNC_OnHQKilled}];

//--- [>1.62] Set the HQ to be local to the commander.
_commanderTeam = (_side) Call WFBE_CO_FNC_GetCommanderTeam;
if !(isNull _commanderTeam) then {
	if (!WF_A2_Vanilla && isMultiplayer && isPlayer(leader _commanderTeam)) then {
		[_MHQ, leader _commanderTeam] Spawn {sleep 1.7; _this Spawn WFBE_SE_FNC_SetLocalityOwner};
	};
};

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

deleteVehicle _hq;

_logik setVariable ['wfbe_hq', _MHQ, true];
_logik setVariable ['wfbe_hq_deployed', false, true];
_logik setVariable ['wfbe_hq_repairing', false, true];
_logik setVariable ['wfbe_hq_repair_count', (_logik getVariable "wfbe_hq_repair_count") + 1, true];

["INFORMATION", Format ["Server_MHQRepair.sqf: [%1] MHQ has been repaired.", _sideText]] Call WFBE_CO_FNC_LogContent;