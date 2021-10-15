/*
	Send a PVF to one client.
	 Parameters:
		- Client PVF.
*/

Private ["_func","_id","_pvf"];

_pvf = _this;
_func = _pvf select 1;
_id = owner (_pvf select 0);

_pvf set [0, getPlayerUID (_pvf select 0)];
_pvf set [1, Format["CLTFNC%1",_func]];

if (!isHostedServer) then {
	Call Compile Format ["WFBE_PVF_%1 = _pvf; _id publicVariableClient 'WFBE_PVF_%1';", _func];
} else {
	_pvf Spawn WFBE_CL_FNC_HandlePVF;
	if (isMultiplayer) then {Call Compile Format ["WFBE_PVF_%1 = _pvf; _id publicVariableClient 'WFBE_PVF_%1';", _func]};
};