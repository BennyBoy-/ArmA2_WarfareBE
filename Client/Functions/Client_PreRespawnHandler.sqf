Private ["_hq","_unit"];

_unit = _this;

(_unit) Call WFBE_SK_FNC_Apply;
[] ExecFSM "Client\FSM\updateactions.fsm";

Options = _unit addAction ["<t color='#42b6ff'>" + (localize "STR_WF_Options") + "</t>","Client\Action\Action_Menu.sqf", "", 1, false, true, "", "_target == player"];

if (!isNull commanderTeam) then {
	_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
	if (commanderTeam == group _unit) then {HQAction = _unit addAction [localize "STR_WF_BuildMenu","Client\Action\Action_Build.sqf", [_hq], 100, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"]};
};

[sideJoinedText,'UnitsCreated',1] Call UpdateStatistics;