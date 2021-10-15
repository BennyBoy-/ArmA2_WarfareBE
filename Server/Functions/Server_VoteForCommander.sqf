/*
	Trigger a commander's vote.
	 Parameters:
		- Side.
*/

Private ["_logic", "_side", "_voteTime"];

_side = _this;
_voteTime = (missionNamespace getVariable 'WFBE_C_GAMEPLAY_VOTE_TIME');
_logic = (_side) Call WFBE_CO_FNC_GetSideLogic;

//--- Vote countdown.
while {_voteTime > -1} do {_voteTime = _voteTime - 1;_logic setVariable ["wfbe_votetime", _voteTime, true];sleep 1};

//--- Get the most voted person.
Private ["_aiVotes","_count","_highest","_highestTeam","_tie","_teams","_vote","_votes"];
_aiVotes = 0;
_votes = [];
_teams = _logic getVariable "wfbe_teams";

//--- Get the votes from everyone.
for '_i' from 0 to (count _teams)-1 do {[_votes, 0] Call WFBE_CO_FNC_ArrayPush};
{
	if (isPlayer leader _x) then {
		_vote = _x getVariable "wfbe_vote";
		if (_vote == -1) then {_aiVotes = _aiVotes + 1} else {_votes set [_vote, (_votes select _vote) + 1]};
	};
} forEach _teams;

//--- Who was the most voted for?
_count = 0;_highest = 0;_highestTeam = -1;
_tie = false;
{
	if (_x == _highest && _x > 0) then {_tie = true};
	if (_x > _highest) then {_highestTeam = _count;_highest = _x;_tie = false};
	_count = _count + 1;
} forEach _votes;

_commander = objNull;

//--- Attempt to get a playable team.
if (!_tie && _highest > _aiVotes && _highestTeam != -1) then {_commander = _teams select _highestTeam};

//--- Player voted for an ai...?
if !(isNull _commander) then {if !(isPlayer leader _commander) then {_commander = objNull}};

//--- Finally set the commander, null = ai, team = player.
_logic setVariable ["wfbe_commander", _commander, true];

//--- Notify the clients.
[_side, "HandleSpecial", ["commander-vote", _commander]] Call WFBE_CO_FNC_SendToClients;

//--- Process the AI Commander FSM if it's not running.
if (isNull _commander) then {
	if ((missionNamespace getVariable "WFBE_C_AI_COMMANDER_ENABLED") > 0) then {
		if !(_logic getVariable "wfbe_aicom_running") then {
			_logic setVariable ["wfbe_aicom_running", true];
			[_side] ExecFSM "Server\FSM\aicommander.fsm";
		};
	};
} else {
	if (_logic getVariable "wfbe_aicom_running") then {_logic setVariable ["wfbe_aicom_running", false]};
	//--- [>1.62] Set the HQ to be local to the commander.
	if (!WF_A2_Vanilla && isMultiplayer) then {[_side Call WFBE_CO_FNC_GetSideHQ, leader _commander] Spawn WFBE_SE_FNC_SetLocalityOwner};
};