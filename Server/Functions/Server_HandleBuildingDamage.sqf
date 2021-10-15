Private ["_difference"];
_difference = ((_this select 1) - (getDammage (_this select 0)))/(missionNamespace getVariable "WFBE_C_STRUCTURES_DAMAGES_REDUCTION");
((getDammage (_this select 0))+_difference)