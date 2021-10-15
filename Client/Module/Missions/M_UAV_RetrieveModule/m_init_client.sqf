Private ['_id','_label','_marker','_markerRanPos','_markers','_randomPos','_searchArea','_sideWin','_size','_task','_taskState','_uav'];

_size = _this select 0;
_label = _this select 1;
_id = _this select 2;
_uav = _this select 3;

_marker = Format["%1%2",_label,_id];
//--- Does the client already have the mission (jip handler, some client joining won't have it running)?
if (((getMarkerPos _marker) select 0) != 0 && ((getMarkerPos _marker) select 1) != 0) exitWith {};

taskHint [format [localize "str_taskNew" + "\n%1",localize 'STR_WF_M_UAV_RetrieveModule'], [1,1,1,1], "taskNew"];

_randomPos = getPos _uav;

//--- Determine the marker random area.
_searchArea = (_size/1.5);
_markerRanPos = [(_randomPos select 0)+random(_searchArea)-random(_searchArea),(_randomPos select 1)+random(_searchArea)-random(_searchArea)];

_task = player createSimpleTask [Format["TSK_M_%1%2",_label,_id]];
_task setSimpleTaskDescription [localize 'STR_WF_M_UAV_RetrieveModule_Description', localize 'STR_WF_M_UAV_RetrieveModule', localize 'STR_WF_M_UAV_RetrieveModule'];
_task setSimpleTaskDestination _markerRanPos;

//--- Marker part.
_markers = [_marker];
createMarkerLocal [_marker, _markerRanPos];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "BORDER";
_marker setMarkerSizeLocal [_size,_size];
_marker = Format["0%1%2",_label,_id];
_markers = _markers + [_marker];
createMarkerLocal [_marker, _markerRanPos];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "FDIAGONAL";
_marker setMarkerSizeLocal [_size,_size];
_marker = Format["00%1%2",_label,_id];
_markers = _markers + [_marker];
createMarkerLocal [_marker, _markerRanPos];
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerTypeLocal "pickup";
_marker setMarkerSizeLocal [0.5,0.5];
_marker setMarkerTextLocal "UAV Crash Site";

//--- Wait for the result.
waitUntil {sleep 5; _sideWin = _uav getVariable 'side'; !(isNil '_sideWin')};
_taskState = if (side player == (_uav getVariable 'side')) then {"Succeeded"} else {"Failed"};

//--- Wait for mission completion.
waitUntil {sleep 5; (isNull _uav)};

_task setTaskState _taskState;

if (_taskState == 'Succeeded') then {
	taskHint [format [localize "str_taskAccomplished" + "\n%1",localize 'STR_WF_M_UAV_RetrieveModule'], [1,1,1,1], "taskDone"];
} else {
	taskHint [format [localize "str_taskFailed" + "\n%1",localize 'STR_WF_M_UAV_RetrieveModule'], [1,1,1,1], "taskFailed"];
};

sleep 30;

//--- Remove the task & markers.
player removeSimpleTask _task;
{deleteMarkerLocal _x} forEach _markers;