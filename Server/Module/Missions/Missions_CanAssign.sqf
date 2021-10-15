/*
	Check whether a mission can be assigned or not.
	 Parameters:
		- Mission
*/

Private ["_canAssign"];

_canAssign = false;

{
	if ((missionNamespace getVariable Format["_WFBE_M_RUNNINGMISSIONS_%1", _x]) < (missionNamespace getVariable Format["WFBE_MISSIONSMAXIMUM_%1", _x])) exitWith {_canAssign = true};
} forEach WFBE_PRESENTSIDES;

_canAssign