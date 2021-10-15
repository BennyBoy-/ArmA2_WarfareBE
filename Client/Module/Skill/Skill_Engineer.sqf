/*
	Script: Engineer Skill System by Benny.
	Description: Add special skills to the defined engineer.
*/
Private ['_dammages','_skip','_vehicle','_vehicles','_z'];

_vehicles = player nearEntities [["Car","Motorcycle","Tank","Ship","Air","StaticWeapon"],5];
if (count _vehicles < 1) exitWith {};

_vehicle = [player,_vehicles] Call WFBE_CO_FNC_GetClosestEntity;

_dammages = getDammage _vehicle;
if (_dammages <= 0) exitWith {};
WFBE_SK_V_LastUse_Repair = time;

_skip = false;
for [{_z = 0},{_z < 5},{_z = _z + 1}] do {
	sleep 0.5;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 0.5;
	waitUntil {animationState player == "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon" || !alive player || vehicle player != player || !alive _vehicle || _vehicle distance player > 5};
	if (!alive player || vehicle player != player || !alive _vehicle || _vehicle distance player > 5) exitWith {_skip = true};
};

if (!_skip) then {
	_dammages = _dammages - 0.15;
	if (_dammages < 0) then {_dammages = 0};
	_vehicle setDammage _dammages;
};