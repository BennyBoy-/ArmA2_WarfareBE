/*
	Set a town's camps to a side.
	 Parameters:
		- Town.
		- Old Side.
		- New Side.
*/

Private ["_camps","_side_old","_side_new","_startingSV","_town"];

_town = _this select 0;
_side_old = _this select 1;
_side_new = _this select 2;

_camps = _town getVariable "camps";
_startingSV = _town getVariable "startingSupplyValue";

{
	_x setVariable ["sideID", _side_new, true];
	_x setVariable ["supplyValue", _startingSV, true];

	(_x getVariable "wfbe_flag") setFlagTexture (missionNamespace getVariable Format["WFBE_%1FLAG", (_side_new) Call WFBE_CO_FNC_GetSideFromID]);
} forEach _camps;

["INFORMATION",Format ["Server_SetCampsToSide.sqf : [%1] Camps [%2] were set to [%3], previously owned by [%4].", _town getVariable "name", count _camps, _side_new, _side_old]] Call WFBE_CO_FNC_LogContent;

if (count _camps > 0) then {[nil, "AllCampsCaptured",[_town, _side_old, _side_new]] Call WFBE_CO_FNC_SendToClients};