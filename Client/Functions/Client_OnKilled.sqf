/*
	Triggered whenever the player die
	 Parameters:
		- Killed
*/

Private ["_body"];

_body = _this select 0;

//--- EH are flushed on unit death, still, just make sure.
player removeEventHandler ["killed", WFBE_PLAYERKEH];

WFBE_Client_IsRespawning = true;

{player removeAction 0} forEach [0,1,2,3,4,5];
if !(isNil "HQAction") then {player removeAction HQAction};
player removeAction Options;

//--- Close any existing dialogs.
if (dialog) then {closeDialog 0};

WFBE_DeathLocation = getPos _body;

//--- Fade transition.
titleCut["","BLACK OUT",1];
waitUntil {alive player};

//--- Update the player.
["RequestSpecial", ["update-teamleader", WFBE_Client_Team, player]] Call WFBE_CO_FNC_SendToServer;

//--- Make sure that player is always the leader (of his group).
if (group player == WFBE_Client_Team) then {
	if (leader(group player) != player) then {(group player) selectLeader player};
};

titleCut["","BLACK IN",1];

//--- Re-add the KEH to the client.
WFBE_PLAYERKEH = player addEventHandler ['Killed', {[_this select 0,_this select 1] Spawn WFBE_CL_FNC_OnKilled; [_this select 0,_this select 1, sideID] Spawn WFBE_CO_FNC_OnUnitKilled}];

//--- Call the pre respawn routine.
(player) Call PreRespawnHandler;

//--- Camera & PP thread
[] Spawn {
	Private ["_delay"];
	_delay = missionNamespace getVariable "WFBE_C_RESPAWN_DELAY";

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [1];
	"dynamicBlur" ppEffectCommit _delay/3;  
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0.1, 0.0, 0.0, 1], [1.0, 0.5, 0.5, 0.1], [0.199, 0.587, 0.114, 0.0]];
	"colorCorrections" ppEffectCommit 0.1;
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0.1, 0.0, 0.0, 0.5], [1.0, 0.5, 0.5, 0.1], [0.199, 0.587, 0.114, 0.0]];
	"colorCorrections" ppEffectCommit _delay/3;

	WFBE_DeathCamera = "camera" camCreate WFBE_DeathLocation;
	WFBE_DeathCamera camSetDir 0;
	WFBE_DeathCamera camSetFov 0.7;
	WFBE_DeathCamera cameraEffect["Internal","TOP"];

	WFBE_DeathCamera camSetTarget WFBE_DeathLocation;
	WFBE_DeathCamera camSetPos [WFBE_DeathLocation select 0,(WFBE_DeathLocation select 1) + 2,5];
	WFBE_DeathCamera camCommit 0;

	waitUntil {camCommitted WFBE_DeathCamera};

	WFBE_DeathCamera camSetPos [WFBE_DeathLocation select 0,(WFBE_DeathLocation select 1) + 2,30];
	WFBE_DeathCamera camCommit _delay+2;
};

sleep random 1;

//--- Create a respawn menu.
createDialog "WFBE_RespawnMenu";