/*
	Delete a template from the gear templates.
	 Parameters:
		- Index
*/

Private ["_template"];

_template = missionNamespace getVariable Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText];
if (_this < count _template) then {
	_template set [_this, false];
	_template = _template - [false];
	missionNamespace setVariable [Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText], _template];
};