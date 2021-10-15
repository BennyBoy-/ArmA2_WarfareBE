/* Header */

//--- Respawn options.
respawn = 3;
respawnDelay = WF_RESPAWNDELAY;
respawnDialog = false;

//--- Require briefing.html to show up.
onLoadMission = WF_MISSIONNAME;
onLoadMissionTime = false;

#ifndef VANILLA
	//--- ArrowHead / CO loadscreen.
	loadScreen = WF_LOADSCREEN;
	
	//--- Prevent gear from being dropped in water, not vanilla compatible.
	enableItemsDropping = 0;
#endif

//--- Properties.
class Header {
	gameType = CTI;
	minPlayers = 1;
	maxPlayers = WF_MAXPLAYERS;
};