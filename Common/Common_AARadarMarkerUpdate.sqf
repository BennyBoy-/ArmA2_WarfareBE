Private ["_height","_object","_markerName","_side"];

_object = _this select 0;
_side = _this select 1;

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1",unitMarker];

createMarkerLocal [_markerName,[0,0,0]];
_markerName setMarkerTypeLocal "Vehicle";
_markerName setMarkerColorLocal "ColorYellow";
_markerName setMarkerSizeLocal [5,5];
_markerName setMarkerAlphaLocal 0;
_height = missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR_DETECTION";

while {alive _object && !(isNull _object)} do {
	if (antiAirRadarInRange) then {
		if (((getPos _object) select 2) > _height) then {
			_markerName setMarkerAlphaLocal 1;
			_markerName setMarkerPosLocal (getPos _object);
		} else {
			_markerName setMarkerAlphaLocal 0;
		};
	};
	
	sleep 1;
};

deleteMarkerLocal _markerName;