Private["_count","_defense","_defenses","_defenseTypes","_emptyDefenses","_range","_total","_totalDefenses","_unit","_units"];

_units = _this select 0;
_range = _this select 1;

_total = count _units;
if (_total < 1) exitWith {["ERROR", "Common_UseStationaryDefense.sqf: No units were specified"] Call WFBE_CO_FNC_LogContent};

_defenseTypes = missionNamespace getVariable Format["WFBE_%1DEFENSENAMES",side leader group (_units select 0)];
_defenses = (leader group (_units select 0)) nearEntities[_defenseTypes,_range];

_emptyDefenses = [];

{if (_x EmptyPositions "gunner" > 0) then {_emptyDefenses = _emptyDefenses + [_x]}} forEach _defenses;

for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{
	_unit = _units select _count;

	_totalDefenses = count _emptyDefenses;
	if (_totalDefenses < 1) exitWith {};

	//If not in a vehicle then check for available defense.
	if (alive _unit && _unit == vehicle _unit) then
	{
		_defense = _emptyDefenses select (_totalDefenses - 1);

		[_unit] allowGetIn true;
		_unit assignAsGunner _defense;
		_emptyDefenses = _emptyDefenses - [_defense];
	};
};