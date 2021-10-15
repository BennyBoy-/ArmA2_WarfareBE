/*
	Return the numeric value of a side.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {WFBE_C_WEST_ID};
	case east: {WFBE_C_EAST_ID};
	case resistance: {WFBE_C_GUER_ID};
	case civilian: {WFBE_C_CIV_ID};
	default {-1};
};

