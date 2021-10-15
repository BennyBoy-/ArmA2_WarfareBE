/*
	A camp has been captured by a unit or repaired.
	 Parameters:
		- Camp.
		- New Side.
		- Old Side.
		- {Is repaired}.
*/

Private ["_camps","_is_repair","_side","_side_new","_sideID_new","_sideID_old","_town"];

_camp = _this select 0;
_sideID_new = _this select 1;
_sideID_old = _this select 2;
_is_repair = if (count _this > 3) then {_this select 3} else {false};

_town = _camp getVariable "town";

//--- Does the new side match the client side?
if (WFBE_Client_SideID == _sideID_new) then {
	//--- The client side has captured a camp.
	(_camp getVariable "wfbe_camp_marker") setMarkerColorLocal WFBE_Client_Color;
	
	//--- Skip the reset upon repair.
	if (_is_repair) exitWith {};
	
	//--- Attempt to award the client if his orders were to take a town.
	// if ((WFBE_Client_Team getVariable "wfbe_task_order") == "towns") then {
		//--- Ensure that the destination is the camp's town.
		// if ((WFBE_Client_Team getVariable "wfbe_task_position") == _town) then {
			Private ["_closest"];
			//--- Get the closest unit from the player group near the camp.
			_closest = [_camp, units group player] Call WFBE_CO_FNC_GetClosestEntity;
			
			//--- If the closest unit is in range, then award the player's group.
			if (_closest distance _camp < (missionNamespace getVariable "WFBE_C_CAMPS_RANGE")) then {
				hint parseText Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>Your squad has captured a camp near <t color='#B6F563'>%1</t> and has been rewarded with <t color='#EAD267'>$%2.</t></t>",_town getVariable "name",missionNamespace getVariable "WFBE_C_CAMPS_CAPTURE_BOUNTY"];
				["RequestChangeScore", [player,score player + (missionNamespace getVariable 'WFBE_C_PLAYERS_SCORE_CAPTURE_CAMP')]] Call WFBE_CO_FNC_SendToServer;
				(missionNamespace getVariable "WFBE_C_CAMPS_CAPTURE_BOUNTY") Call WFBE_CL_FNC_ChangeClientFunds;
			};
		// };
	// };
} else {
	//--- Did the client side lost a known camp?
	if (WFBE_Client_SideID in [(_town getVariable "sideID"), _sideID_old]) then {
		(_camp getVariable "wfbe_camp_marker") setMarkerColorLocal (missionNamespace getVariable Format ["WFBE_C_%1_COLOR",(_sideID_new) Call WFBE_CO_FNC_GetSideFromID]);
	};
};