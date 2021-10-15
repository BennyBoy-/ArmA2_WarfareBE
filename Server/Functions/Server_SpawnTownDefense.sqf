/*
	Spawn defenses in a town.
	 Parameters:
		- Defense Logic.
		- Side.
*/

Private ["_defense","_defense_logic","_kind","_kinds","_nils","_random","_side","_sideID"];
_defense_logic = _this select 0;
_side = _this select 1;
_sideID = (_side) Call WFBE_CO_FNC_GetSideID;
_defense = "";

//--- Retrieve the possible kinds.
_kinds = _defense_logic getVariable "wfbe_defense_kind";

//--- At least one type is needed.
if (count _kinds == 0) exitWith {};

_nils = [];
if (count _kinds > 1) then {
	//--- Get a random one.
	while {true} do {
		_random = floor(random count _kinds);
		_kind = missionNamespace getVariable Format ["WFBE_%1_Defenses_%2", _side, _kinds select _random];
		if !(isNil '_kind') then {_defense = _kind select floor(random count _kind)} else {[_nils, _kinds select _random] Call WFBE_CO_FNC_ArrayPush; _kinds = [_kinds, [_random]] Call WFBE_CO_FNC_ArrayShift};
		if (count _kinds == 0 || _defense != "") exitWith {};
	};
} else {
	//--- Use the default one.
	_kind = missionNamespace getVariable Format ["WFBE_%1_Defenses_%2", _side, _kinds select 0];
	if !(isNil '_kind') then {_defense = _kind select floor(random count _kind)};
};

//--- Learn and adapt, remove if nil.
if (count _nils > 0) then {_defense_logic setVariable ["wfbe_defense_kind",(_defense_logic getVariable "wfbe_defense_kind") - _nils]};

//--- If found, create a defense.
if (_defense != "") then {
	Private["_entitie"];
	_entitie = createVehicle [_defense, getPos _defense_logic, [], 0, "NONE"];
	_entitie setDir (direction _defense_logic);
	_entitie setPos (getPos _defense_logic);
	_entitie addEventHandler ['killed', Format ["[_this select 0, _this select 1, %1] Spawn WFBE_CO_FNC_OnUnitKilled;", _sideID]];
	_defense_logic setVariable ["wfbe_defense", _entitie];
};