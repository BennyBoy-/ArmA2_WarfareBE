Private ["_deathMarkerColor","_deathMarkerSize","_deathMarkerType","_delete","_deletePrevious","_markerColor","_markerName","_markerSize","_markerType","_markerText","_refreshRate","_trackDeath","_tracked","_side"];

waitUntil {commonInitComplete};

_markerType = _this select 0;
_markerColor = _this select 1;
_markerSize = _this select 2;
_markerText = _this select 3;
_markerName = _this select 4;
_tracked = _this select 5;
_refreshRate = _this select 6;
_trackDeath = _this select 7;
_deathMarkerType = _this select 8;
_deathMarkerColor = _this select 9;
_deletePrevious = _this select 10;
_side = _this select 11;
_deathMarkerSize = [1,1];
if (count _this > 12) then {_deathMarkerSize = _this select 12};

if (_side != side player || isNull _tracked || !(alive _tracked)) exitWith {};
if (_deletePrevious) then {deleteMarkerLocal _markerName};

createMarkerLocal [_markerName,getPos _tracked];
if (_markerText != "") then {_markerName setMarkerTextLocal _markerText};
_markerName setMarkerTypeLocal _markerType;
_markerName setMarkerColorLocal _markerColor;
_markerName setMarkerSizeLocal _markerSize;

while {alive _tracked && !(isNull _tracked)} do {
	_markerName setMarkerPosLocal (getPos _tracked);
	sleep _refreshRate;
};

if (_trackDeath) then {
	_markerName setMarkerTypeLocal _deathMarkerType;
	_markerName setMarkerColorLocal _deathMarkerColor;
	_markerName setMarkerSizeLocal _deathMarkerSize;
	sleep (missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_DEAD_DELAY");
};

deleteMarkerLocal _markerName;