/*
	Send a PVF to the server.
	 Parameters:
		- Server PVF.
*/

Private ["_func","_pvf"];

_pvf = _this;
_func = _pvf select 0;

_pvf set [0, Format["SRVFNC%1",_func]];

if (!isHostedServer) then {
	Call Compile Format ["WFBE_PVF_%1 = _pvf; publicVariable 'WFBE_PVF_%1';", _func];
} else {
	_pvf Spawn WFBE_SE_FNC_HandlePVF;
};