/*
	The client or an AI attempt to repair a camp.
	  todo, action can be reused after x time.
*/

Private ["_camp","_camp_sideID","_camps","_delay","_range","_temp","_townModel","_vehicle"];

_vehicle = _this select 0;

_range = missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_RANGE";

//--- Attempt to get a nearby camp.
_camps = (_vehicle) nearEntities [WFBE_Logic_Camp, _range];

//--- Only get the "real" camps, remove the possible undefined ones.
_temp = _camps;
{
	if (isNil {_x getVariable 'sideID'}) then {_camps = _camps - [_x]};
} forEach _temp;

//--- Make sure that there is at least one camp nearby, abort otherwise.
if (count _camps == 0) exitWith {hint (localize "STR_WF_Repair_Camp_None")};

//--- Now, we need to check if one of those camp is destroyed at least, remove the living ones.
_temp = _camps;
{
	if (alive (_x getVariable 'wfbe_camp_bunker')) then {_camps = _camps - [_x]};
} forEach _temp;

//--- If we have no repairable camps in range, abort with a message.
if (count _camps == 0) exitWith {hint (localize "STR_WF_Repair_Camp_None_Dead")};

//--- Check if the repair is free or if it need to be paid.
if ((missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_PRICE") > 0) then {
	//--- Check that the player has enough funds for a repair.
	if ((Call WFBE_CL_FNC_GetClientFunds) < (missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_PRICE")) exitWith {hint Format [localize "STR_WF_Repair_Camp_NoFunds", (missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_PRICE") - (Call WFBE_CL_FNC_GetClientFunds)]};

	//--- Purchase a repair.
	-(missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_PRICE") Call WFBE_CL_FNC_ChangeClientFunds;
};
	
//--- Get the closest camp then.
_camp = [_vehicle, _camps] Call WFBE_CO_FNC_GetClosestEntity;

hint (localize "STR_WF_Repair_Camp_IsBeingRepaired");

//--- Begin the repair.
_delay = missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_DELAY";

while {_delay > 0} do {
	if (!alive _vehicle || alive (_camp getVariable 'wfbe_camp_bunker') || (_vehicle distance _camp > _range)) exitWith {};
	
	sleep 1;
	_delay = _delay - 1;
}; 

if (!(alive _vehicle) || (_vehicle distance _camp > _range)) exitWith {hint (localize "STR_WF_Repair_TruckIsDeadOrTooFar")};
if (alive (_camp getVariable 'wfbe_camp_bunker')) exitWith {
	hint (localize "STR_WF_Repair_Camp_IsAlive");
	
	//--- Refunds the player.
	(missionNamespace getVariable "WFBE_C_CAMPS_REPAIR_PRICE") Call WFBE_CL_FNC_ChangeClientFunds;
};

//--- Repair the camp, and announce it to the players.
_townModel = (missionNamespace getVariable "WFBE_C_CAMP") createVehicle (getPos _camp);
_townModel setDir ((getDir _camp) + (missionNamespace getVariable "WFBE_C_CAMP_RDIR"));
_townModel setPos (getPos _camp);
_camp setVariable ["wfbe_camp_bunker", _townModel, true];

//--- Do we have to update the camp SID ?
_camp_sideID = _camp getVariable "sideID";
if (_camp_sideID != WFBE_Client_SideID) then {
	Private ["_town"];
	_camp setVariable ["sideID", WFBE_Client_SideID, true];
	
	//--- Notify / update map if needed.
	[nil, "CampCaptured", [_camp, WFBE_Client_SideID, _camp_sideID, true]] Call WFBE_CO_FNC_SendToClients;
	if (local player && !isServer) then {[_camp, WFBE_Client_SideID, _camp_sideID, true] Spawn CLTFNCCampCaptured};
};

hint (localize "STR_WF_Repair_Camp_IsRepaired");