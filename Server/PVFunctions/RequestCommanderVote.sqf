Private["_commanderTeam","_logik","_name","_side","_team"];

_side = _this select 0;
_name = _this select 1;

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

if ((_logik getVariable "wfbe_votetime") <= 0) then {
	_team = -1;
	_commanderTeam = (_side) Call WFBE_CO_FNC_GetCommanderTeam;

	if (!isNull _commanderTeam) then {
		_team = (_logik getVariable "wfbe_teams") find _commanderTeam;
	};

	//--- Set the commander votes.
	[_side, _team] Call SetCommanderVotes;
	
	(_side) Spawn WFBE_SE_FNC_VoteForCommander;
	[_side,"VotingForNewCommander"] Spawn SideMessage;
	
	[_side, "HandleSpecial", ["commander-vote-start", _name]] Call WFBE_CO_FNC_SendToClients;
};