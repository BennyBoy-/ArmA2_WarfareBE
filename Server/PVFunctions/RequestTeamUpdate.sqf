Private["_args","_properties","_team"];

_args = _this;
_team = _args select 0;

//--- One team.
if (typeName _team == "ARRAY") then {
	{
		_x setBehaviour (_args select 1);
		_x setCombatMode (_args select 2);
		_x setFormation (_args select 3);
		_x setSpeedMode (_args select 4);
		["INFORMATION", Format ["RequestTeamUpdate.sqf: Team [%1] properties were updated.", _x]] Call WFBE_CO_FNC_LogContent;
	} forEach _team;
};

//--- The whole team.
if (typeName _team == "SIDE") then {
	{
		_x setBehaviour (_args select 1);
		_x setCombatMode (_args select 2);
		_x setFormation (_args select 3);
		_x setSpeedMode (_args select 4);
	} forEach (missionNamespace getVariable Format["WFBE_%1TEAMS",str _team]);
	["INFORMATION", Format ["RequestTeamUpdate.sqf: [%1] Teams properties were updated.", _team]] Call WFBE_CO_FNC_LogContent;
};