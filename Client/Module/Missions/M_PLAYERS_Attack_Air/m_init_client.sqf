Private ['_get','_id','_label','_marker','_task'];

_chopper = _this select 0;
_label = _this select 1;
_id = _this select 2;

_get = missionNamespace getVariable Format["WFBE_TSK_M_%1%2",_label,_id];
if !(isNil '_get') exitWith {};

taskHint [format [localize "str_taskNew" + "\n%1",localize 'STR_WF_M_PLAYERS_Attack_Air'], [1,1,1,1], "taskNew"];

_task = player createSimpleTask [Format["TSK_M_%1%2",_label,_id]];
missionNamespace setVariable [Format["WFBE_TSK_M_%1%2",_label,_id],true];
_task setSimpleTaskDescription [localize 'STR_WF_M_PLAYERS_Attack_Air_Description', localize 'STR_WF_M_PLAYERS_Attack_Air', localize 'STR_WF_M_PLAYERS_Attack_Air'];
_task setSimpleTaskTarget [_chopper, false];

//--- Wait for the result.
waitUntil {sleep 5; !alive _chopper};

_task setTaskState "Succeeded";
taskHint [format [localize "str_taskAccomplished" + "\n%1",localize 'STR_WF_M_PLAYERS_Attack_Air'], [1,1,1,1], "taskDone"];

sleep 30;

missionNamespace setVariable [Format["WFBE_TSK_M_%1%2",_label,_id],nil];

//--- Remove the task & markers.
player removeSimpleTask _task;