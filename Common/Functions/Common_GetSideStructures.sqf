/*
	Return a side's structures.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {WFBE_L_BLU getVariable "wfbe_structures"};
	case east: {WFBE_L_OPF getVariable "wfbe_structures"};
	case resistance: {WFBE_L_GUE getVariable "wfbe_structures"};
	default {objNull};
}