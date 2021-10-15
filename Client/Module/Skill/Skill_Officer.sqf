/*
	Script: Officer Skill System by Benny.
	Description: Add special skills to the defined officer.
*/
Private ['_array','_exist','_skip','_tent','_toWorld','_type','_z'];

_type = missionNamespace getVariable Format ["WFBE_%1FARP",sideJoinedText];
_exist = WFBE_Client_Logic getVariable "wfbe_mash";
if !(isNull _exist) then {deleteVehicle _exist};

WFBE_SK_V_LastUse_MASH = time;

_skip = false;
for [{_z = 0},{_z < 7},{_z = _z + 1}] do {
	sleep 0.5;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 0.5;
	waitUntil {animationState player == "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon" || !alive player || vehicle player != player};
	if (!alive player || vehicle player != player) exitWith {_skip = true};
};

if (!_skip) then {
	_array = [((player worldToModel (getPos player)) select 0),((player worldToModel (getPos player)) select 1) + 10];
	_toWorld = player modelToWorld _array;
	_tent = _type createVehicle _toWorld;
	WFBE_Client_Logic setVariable ["wfbe_mash", _tent, true];
	_tent addAction ["<t color='#f8d664'>" + localize 'STR_WF_ACTION_UndeployMASH'+ "</t>", "Client\Module\Skill\Actions\Officer_Undeploy_MASH.sqf", [], 75, false, true, "", "alive _target && time - WFBE_SK_V_LastUse_MASH > 240"];
} else {
	WFBE_Client_Logic setVariable ["wfbe_mash", objNull, true];
};