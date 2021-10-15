/*
	Set a town's camps to a side on a client.
	 Parameters:
		- Town.
		- Old Side.
		- New Side.
*/

Private ["_camps","_side_old","_side_new","_town"];

_town = _this select 0;
_side_old = _this select 1;
_side_new = _this select 2;

//--- Abort if the client is not concerned (3-way).
if !(WFBE_Client_SideID in [_side_old,_side_new]) exitWith {};

_camps = _town getVariable "camps";
_color = missionNamespace getVariable (Format ["WFBE_C_%1_COLOR",(_side_new) Call WFBE_CO_FNC_GetSideFromID]);

{(_x getVariable "wfbe_camp_marker") setMarkerColorLocal _color} forEach _camps;