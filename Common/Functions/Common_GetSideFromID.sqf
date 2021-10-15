/*
	Return the side from the ID.
	 Parameters:
		- Side ID.
*/

switch (_this) do {
	case WFBE_C_WEST_ID: {west};
	case WESTID: {west};
	case WFBE_C_EAST_ID: {east};
	case EASTID: {east};
	case WFBE_C_GUER_ID: {resistance};
	case RESISTANCEID: {resistance};
	case WFBE_C_CIV_ID: {civilian};
	default {sideLogic};
};

