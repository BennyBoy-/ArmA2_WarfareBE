/*
	Return a side's HQ.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {WFBE_L_BLU getVariable "wfbe_supply"};
	case east: {WFBE_L_OPF getVariable "wfbe_supply"};
	case resistance: {WFBE_L_GUE getVariable "wfbe_supply"};
	default {objNull};
}