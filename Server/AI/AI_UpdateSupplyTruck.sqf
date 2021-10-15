Private ["_AITrucks","_hq","_isDeployed","_maist","_side"];
_side = _this select 0;
_maist = missionNamespace getVariable "WFBE_C_AI_COMMANDER_SUPPLY_TRUCKS_MAX";

waitUntil {townInit};

sleep random 1;

while {!gameOver} do {
	sleep 60;
	_AITrucks = ((_side) Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_ai_supplytrucks";
	if (count _AITrucks < _maist) then {
		_isDeployed = (_side) Call WFBE_CO_FNC_GetSideHQDeployStatus;
		_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
		if (_isDeployed && alive _hq) then {
			["INFORMATION", Format ["AI_UpdateSupplyTruck.sqf: [%1] Supply truck was created.", _side]] Call WFBE_CO_FNC_LogContent;
			[_side] ExecFSM "Server\FSM\supplytruck.fsm";
		};
	};
};
