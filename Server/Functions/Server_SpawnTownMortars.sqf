/*
	Spawn mortars in a town.
	 Parameters:
		- Town.
		- Side.
*/

Private ["_mortar", "_position", "_side", "_town"];

_town = _this select 0;
_side = _this select 1;

_mortar = missionNamespace getVariable Format["WFBE_%1DEFENSES_MORTAR", _side];

if (isNil '_mortar') exitWith {};
if (count _mortar == 0) exitWith {};

//--- Get a spawn position.
_position = _town getVariable "wfbe_town_mortars";
_position = _positions select floor(random count _positions);
_mortar = _mortar select floor (random count _mortar);
_direction = direction _position;

//--- Generate a random setup depending on town SV.
_set = [];
if ((_town getVariable "maxSupplyValue") >= 80) then {
	_set = [[_mortar,[0,0,0]], [_mortar,[-5,-5,0]], [_mortar,[5,-5,0]]];
} else {
	_set = [[_mortar,[-3,0,0]], [_mortar,[3,0,0]]];
};