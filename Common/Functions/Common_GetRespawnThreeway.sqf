Private ["_availableSpawn","_camps_side","_camps_total","_side"];

_side = _this;
_availableSpawn = [];

{
	if ((_x Call GetTotalCamps) == ([_x, _side] Call GetTotalCampsOnSide)) then {[_availableSpawn, _x] Call WFBE_CO_FNC_ArrayPush};
} forEach (_side Call GetSideTowns);

_availableSpawn