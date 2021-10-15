/*
	Send a PVF to the server ([>1.62] needed for publicVariableServer).
	 Parameters:
		- Server PVF.
*/

Private ["_func","_pvf"];

_pvf = _this;
_func = _pvf select 0;

_pvf set [0, Format["SRVFNC%1",_func]];

if (!isHostedServer) then {
	Call Compile Format ["WFBE_PVF_%1 = _pvf; publicVariableServer 'WFBE_PVF_%1';", _func];
} else {
	_pvf Spawn WFBE_SE_FNC_HandlePVF;
};