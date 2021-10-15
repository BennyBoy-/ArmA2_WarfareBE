Private["_damage","_damagedBy","_logik","_side","_structure"];

_structure = _this select 0;
_damagedBy = _this select 1;
_damage = _this select 2;

_side = _structure getVariable "wfbe_side";
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

if ((getDammage _structure) + (_damage / (missionNamespace getVariable "WFBE_C_STRUCTURES_DAMAGES_REDUCTION")) < 1) then {
	if (time - (_logik getVariable "wfbe_structure_lasthit") > 30 && _damage > 0.05) then {
		_logik setVariable ["wfbe_structure_lasthit", time];
		[_side, "IsUnderAttack", ["Base", _structure]] Spawn SideMessage;
	};
};