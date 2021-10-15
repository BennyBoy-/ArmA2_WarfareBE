Private["_group","_index","_logik","_model","_models","_position","_side","_unit","_workers"];

_side = _this select 0;
_position = _this select 1;
_index = _this select 2;
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

_models = missionNamespace getVariable Format["WFBE_%1_WORKER", _side];
_model = _models select floor (random (count _models));
_group = createGroup _side;
_position = [getPos _position, 30] Call GetSafePlace;
_unit = [_model, _group, _position, _side] Call WFBE_CO_FNC_CreateUnit;

_group setSpeedMode "LIMITED";

_workers = _logik getVariable "wfbe_workers";
_workers set [_index, _unit];
_logik setVariable ["wfbe_workers", _workers, true];

[_unit, _side, _index] ExecFSM "Server\FSM\workers.fsm";