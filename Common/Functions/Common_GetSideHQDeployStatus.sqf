/*
	Return a side HQ deloy status.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {WFBE_L_BLU getVariable "wfbe_hq_deployed"};
	case east: {WFBE_L_OPF getVariable "wfbe_hq_deployed"};
	case resistance: {WFBE_L_GUE getVariable "wfbe_hq_deployed"};
	default {objNull};
}

