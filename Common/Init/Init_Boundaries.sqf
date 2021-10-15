Private ['_boundariesXY'];
_boundariesXY = -1;

switch (toLower(worldName)) do {
	case 'chernarus': {_boundariesXY = 15360};
	case 'eden': {_boundariesXY = 12800};
	case 'fallujah': {_boundariesXY = 10240};
	case 'isladuala': {_boundariesXY = 10240};
	case 'panthera2': {_boundariesXY = 10240};
	case 'queshkibrul': {_boundariesXY = 5120};
	case 'sara': {_boundariesXY = 20480};
	case 'saraLite': {_boundariesXY = 10240};
	case 'takistan': {_boundariesXY = 12800};
	case 'utes': {_boundariesXY = 5120};
	case 'yapal': {_boundariesXY = 5120};
	case 'zargabad': {_boundariesXY = 8192};
};

if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED") > 0) then {
	if (_boundariesXY == -1) then {
		missionNamespace setVariable ["WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED", 0];
		if (local player) then {
			BoundariesIsOnMap = nil;
			BoundariesHandleOnMap = nil;
		};
		["INFORMATION", Format ["Init_Boundaries.sqf: There is no proper boundaries set for island [%1]", worldName]] Call WFBE_CO_FNC_LogContent;
	} else {
		missionNamespace setVariable ['WFBE_BOUNDARIESXY',_boundariesXY];
		["INFORMATION", Format ["Init_Boundaries.sqf: Boundaries [%1] found for island [%2]", _boundariesXY, worldName]] Call WFBE_CO_FNC_LogContent;
	};
} else {
	if (_boundariesXY == -1) then {
		["INFORMATION", Format ["Init_Boundaries.sqf: There is no proper boundaries set for island [%1]", worldName]] Call WFBE_CO_FNC_LogContent;
	} else {
		missionNamespace setVariable ['WFBE_BOUNDARIESXY',_boundariesXY];
		["INFORMATION", Format ["Init_Boundaries.sqf: Boundaries [%1] found for island [%2] {Boundaries parameter is disabled}", _boundariesXY, worldName]] Call WFBE_CO_FNC_LogContent;
	};
};