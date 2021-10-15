/* 
	Author: Benny
	Name: uav_spotter.sqf
	Parameters:
	  0 - UAV
	Description:
	  This file handle the UAV 'spotting' ability. If the UAV knows about an hostile unit, it'll reveal it's average location on the map.
*/

Private ['_delay','_range','_sensitivity','_uav'];

_uav = _this select 0;
_delay = missionNamespace getVariable "WFBE_C_PLAYERS_UAV_SPOTTING_DELAY";
_range = missionNamespace getVariable "WFBE_C_PLAYERS_UAV_SPOTTING_RANGE";
_sensitivity = missionNamespace getVariable "WFBE_C_PLAYERS_UAV_SPOTTING_DETECTION";

while {true} do {
	sleep _delay;
	if !(alive _uav) exitWith {};
	
	{
		if (_uav knowsAbout _x > _sensitivity && !(side _x in [sideJoined, civilian])) then {
			sleep (0.05 + random 0.05);
			[sideJoined, "HandleSpecial", ["uav-reveal", _uav, _x]] Call WFBE_CO_FNC_SendToClients;
		};
	} forEach (_uav nearEntities _range);
};
