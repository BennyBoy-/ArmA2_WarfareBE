/*
	Script: Spec Ops Skill System by Benny.
	Description: Add special skills to the defined spec ops unit.
*/
Private ['_min','_ran','_skip','_vehicle','_vehicles','_z'];

_vehicles = player nearEntities [["Car","Motorcycle","Tank","Ship","Air"],5];
if (count _vehicles < 1) exitWith {};

if (isNil "WFBE_SK_V_LockpickChance") then {
	//--- Some units will have less troubles lockpicking than the others, negative means more chance
	WFBE_SK_V_LockpickChance = switch (WFBE_SK_V_Type) do {
		case "SpecOps": {-20};
		default {0};
	};
};

_vehicle = [player,_vehicles] Call WFBE_CO_FNC_GetClosestEntity;

if (!locked _vehicle) exitWith {};

WFBE_SK_V_LastUse_Lockpick = time;

_skip = false;
for [{_z = 0},{_z < 2},{_z = _z + 1}] do {
	sleep 0.5;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 0.5;
	waitUntil {animationState player == "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon" || !alive player || vehicle player != player || !alive _vehicle || _vehicle distance player > 5};
	if (!alive player || vehicle player != player || !alive _vehicle || _vehicle distance player > 5) exitWith {_skip = true};
};

if (!locked _vehicle) exitWith {};

if (!_skip) then {
	_min = 30;
	switch (typeOf _vehicle) do {
		case "Motorcycle": {_min = 45};
		case "Car": {_min = 35};
		case "Tank": {_min = 20};
		case "Ship": {_min = 25};
		case "Air": {_min = 15};
	};
	_ran = ((random 100)-WFBE_SK_V_LockpickChance);
	if (_ran <= _min) then {
		//--- Unlocked, gain experience.
		if (WFBE_SK_V_LockpickChance > -51) then {WFBE_SK_V_LockpickChance = WFBE_SK_V_LockpickChance - 1};
		// WFBE_RequestVehicleLock = ['SRVFNCREQUESTVEHICLELOCK',[_vehicle,false]];
		// publicVariable 'WFBE_RequestVehicleLock';
		// if (isHostedServer) then {['SRVFNCREQUESTVEHICLELOCK',[_vehicle,false]] Spawn HandleSPVF};
		["RequestVehicleLock", [_vehicle, false]] Call WFBE_CO_FNC_SendToServer;
		hint (localize "STR_WF_INFO_Lockpick_Succeed");
	} else {
		hint (localize "STR_WF_INFO_Lockpick_Failed");
	};
};
