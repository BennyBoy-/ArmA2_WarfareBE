/*
	Logging function.
	 Parameters:
		- Log Type.
		- Log Content.
		- {Log Level}.
*/

Private ["_logContent","_logLevel","_logType"];

_logType = _this select 0;
_logContent = _this select 1;
_logLevel = if (count _this > 2) then {_this select 2} else {0};

if (_logLevel >= WFBE_LogLevel) then {diag_log Format["[WFBE (%1)] [frameno:%2 | ticktime:%3 | fps:%4] %5",_logType, diag_frameno, diag_tickTime, diag_fps, _logContent]};