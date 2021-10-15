//--- Global Init, first file called.

//--- Define which 'part' of the game to run.
#include "version.sqf"

//--- Mission is starting.
for '_i' from 0 to 3 do {diag_log "################################"};
diag_log format ["## Island Name: [%1]", worldName];
diag_log format ["## Mission Name: [%1]", WF_MISSIONNAME];
diag_log format ["## Max players Defined: [%1]", WF_MAXPLAYERS];
for '_i' from 0 to 3 do {diag_log "################################"};

WFBE_CO_FNC_LogContent = Compile preprocessFileLineNumbers "Common\Functions\Common_LogContent.sqf"; //--- Define the log function earlier.
WFBE_LogLevel = 0; //--- Logging level (0: Trivial, 1: Information, 2: Warnnings, 3: Errors).

["INITIALIZATION", Format["initJIPCompatible.sqf: Starting JIP Initialization",local player]] Call WFBE_CO_FNC_LogContent;

if (isServer) then { //--- JIP Handler, handle connection & disconnection.
	WFBE_SE_FNC_OnPlayerConnected = Compile preprocessFileLineNumbers "Server\Functions\Server_OnPlayerConnected.sqf";
	WFBE_SE_FNC_OnPlayerDisconnected = Compile preprocessFileLineNumbers "Server\Functions\Server_OnPlayerDisconnected.sqf";

	onPlayerConnected {[_uid, _name, _id] Spawn WFBE_SE_FNC_OnPlayerConnected};
	onPlayerDisconnected {[_uid, _name, _id] Spawn WFBE_SE_FNC_OnPlayerDisconnected};
};

//--- Client Init.
if (!isServer || local player) then {
	["INITIALIZATION", "initJIPCompatible.sqf: Client detected... waiting for non null result..."] Call WFBE_CO_FNC_LogContent;
	waitUntil {!isNull player};
	["INITIALIZATION", "initJIPCompatible.sqf: Client is not null..."] Call WFBE_CO_FNC_LogContent;
	//--- Client Init - Begin the blackout on Layer 12452.
	12452 cutText [(localize 'STR_WF_Loading')+"...","BLACK FADED",50000];
	isHostedServer = if (!isMultiplayer || (isServer && local player)) then {true} else {false};
} else {
	//--- Prevent the isServer bug on the client.
	sleep 1.3;

	isHostedServer = if (!isMultiplayer || (isServer && local player)) then {true} else {false};
	["INITIALIZATION", Format["initJIPCompatible.sqf: Server detected... client is local? [%1]",local player]] Call WFBE_CO_FNC_LogContent;
};

setViewDistance 1000; //--- Server & Client default View Distance.

clientInitComplete = false;
commonInitComplete = false;
serverInitComplete = false;
serverInitFull = false;
gameOver = false;
WFBE_GameOver = false;
townInitServer = false;
townInit = false;
modACE = false;
towns = [];

WF_A2_Vanilla = false;
#ifdef VANILLA
	WF_A2_Vanilla = true;
#endif

WF_A2_Arrowhead = false;
#ifdef ARROWHEAD
	WF_A2_Arrowhead = true;
#endif

WF_A2_CombinedOps = false;
#ifdef COMBINEDOPS
	WF_A2_CombinedOps = true;
#endif

WF_Debug = false;
#ifdef WF_DEBUG
	WF_Debug = true;
#endif

WF_Camo = false;
#ifdef WF_CAMO
	WF_Camo = true;
#endif

if (isMultiplayer) then {Call Compile preprocessFileLineNumbers "Common\Init\Init_Parameters.sqf"}; //--- In MP, we get the parameters.

Call Compile preprocessFileLineNumbers "Common\Init\Init_CommonConstants.sqf"; //--- Set the constants and the parameters, skip the params if they're already defined.

if (WF_Debug) then { //--- Debug.
	// missionNamespace setVariable ["WFBE_C_TOWNS_CONQUEST_MODE", 1];
	// missionNamespace setVariable ["WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE", 7];
};

//--- Apply the time-environment (don't halt).
[] Spawn {
	waitUntil {time > 0}; //--- Await for the mission to start / JIP.
	
	setDate [(date select 0),(missionNamespace getVariable "WFBE_C_ENVIRONMENT_STARTING_MONTH"),(date select 2),(missionNamespace getVariable "WFBE_C_ENVIRONMENT_STARTING_HOUR"),(date select 4)]; //--- Apply the date and time.
	
	if (local player) then {skipTime (time / 3600)}; //--- If we're dealing with a client, he may have JIP half way through the game. Sync him via skipTime with the mission time.
};

WFBE_Parameters_Ready = true; //--- All parameters are set and ready.

ExecVM "Common\Init\Init_Common.sqf"; //--- Execute the common files.
ExecVM "Common\Init\Init_Towns.sqf"; //--- Execute the towns file.//--- Execute the common files.

if (isServer) then { //--- Run the server's part.
	["INITIALIZATION", "initJIPCompatible.sqf: Executing the Server Initialization."] Call WFBE_CO_FNC_LogContent;
	ExecVM "Server\Init\Init_Server.sqf";
};

//--- Run the client's part.
if (!isServer || local player) then {

	waitUntil {!isNil 'WFBE_PRESENTSIDES'}; //--- Await for teams to be set before processing the client init.
	{
		_logik = (_x) Call WFBE_CO_FNC_GetSideLogic;
		waitUntil {!isNil {_logik getVariable "wfbe_teams"}};
		missionNamespace setVariable [Format["WFBE_%1TEAMS",_x], _logik getVariable "wfbe_teams"];
	} forEach WFBE_PRESENTSIDES;

	["INITIALIZATION", "initJIPCompatible.sqf: Executing the Client Initialization."] Call WFBE_CO_FNC_LogContent;
	ExecVM "Client\Init\Init_Client.sqf";
};