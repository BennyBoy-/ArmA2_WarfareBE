Private["_localize","_txt"];

_localize = _this select 0;

_txt = "";
switch (_localize) do {
	case "BuildingTeamkill": {_txt = Format [Localize "STR_WF_CHAT_Teamkill_Building",_this select 1, _this select 2, [_this select 3, 'displayName'] Call GetConfigInfo]};
	case "Teamswap": {_txt = Format [Localize "STR_WF_CHAT_Teamswap",_this select 1, _this select 2, _this select 3, _this select 4]};
	case "CommanderDisconnected": {_txt = Localize "strwfcommanderdisconnected"};
	case "TacticalLaunch": {_txt = Localize "STR_WF_CHAT_ICBM_Launch"};
	case "Teamkill": {_txt = Format [Localize "STR_WF_CHAT_Teamkill",(missionNamespace getVariable "WFBE_C_PLAYERS_PENALTY_TEAMKILL")]; -(missionNamespace getVariable "WFBE_C_PLAYERS_PENALTY_TEAMKILL") Call ChangePlayerFunds};
	case "FundsTransfer": {_txt = Format [Localize "STR_WF_CHAT_FundsTransfer",_this select 1,_this select 2]};
	case "StructureSold": {_txt = Format [Localize "STR_WF_CHAT_Structure_Sold",([_this select 1,'displayName'] Call GetConfigInfo)]};
	case "StructureSell": {_txt = Format [Localize "STR_WF_CHAT_Structure_Sell",([_this select 1,'displayName'] Call GetConfigInfo),_this select 2]};
	case "SecondaryAward": {_txt = Format [Localize "STR_WF_CHAT_Secondary_Award",_this select 1, _this select 2];(_this select 2) Call ChangePlayerFunds};
};

if (_localize != 'FundsTransfer') then {
	_txt Call CommandChatMessage;
} else {
	_txt Call GroupChatMessage;
};