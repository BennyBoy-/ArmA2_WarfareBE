/*
	Return a side's logic.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {WFBE_L_BLU};
	case east: {WFBE_L_OPF};
	case resistance: {WFBE_L_GUE};
	default {sideNull};
};

