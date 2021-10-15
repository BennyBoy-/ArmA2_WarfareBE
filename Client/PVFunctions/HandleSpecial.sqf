Private['_args', '_request'];

_request = _this select 0;
_args = +_this;
_args set [0, "**NIL**"];
_args = _args - ["**NIL**"]; //--- Strip the action request from the arguments.

switch (_request) do {
	case "action-perform": {_args spawn WFBE_CL_FNC_Perform_Action};
	case "commander-vote": {_args spawn WFBE_CL_FNC_Commander_VoteEnd};
	case "commander-vote-start": {_args spawn WFBE_CL_FNC_Commander_VoteStart};
	case "delegate-townai": {_args spawn WFBE_CL_FNC_Delegate_TownAI};
	case "endgame": {_args spawn WFBE_CL_FNC_EndGame};
	case "group-join-accept": {_args call WFBE_CL_FNC_Groups_JoinAccepted};
	case "group-join-deny": {_args call WFBE_CL_FNC_Groups_JoinDenied};
	case "group-kick": {_args call WFBE_CL_FNC_Groups_KickedOff};
	case "group-join-request": {_args call WFBE_CL_FNC_Groups_ReceiveRequest};
	case "hq-setstatus": {_args spawn WFBE_CL_FNC_HQ_SetStatus};
	case "icbm-display": {_args spawn WFBE_CL_FNC_Display_ICBM};
	case "irsmoke-createfx": {{_x spawn WFBE_CO_MOD_IRS_CreateSmoke} forEach (_args select 0)};
	case "join-answer": {missionNamespace setVariable ['WFBE_P_CANJOIN', (_args select 0)]};
	case "uav-reveal": {_args spawn WFBE_CL_FNC_Reveal_UAV};
	case "upgrade-complete": {_args spawn WFBE_CL_FNC_Upgrade_Complete};
};