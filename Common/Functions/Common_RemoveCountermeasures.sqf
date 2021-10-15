/*
	Remove the countermeasures from an air unit.
	 Parameters:
		- Unit
*/

Private ["_cms","_magazines","_unit","_weapons"];

_unit = _this;

_weapons = getArray(configFile >> "CfgVehicles" >> typeOf _unit >> "weapons");

if ("CMFlareLauncher" in _weapons) then {
	_magazines = getArray(configFile >> "CfgVehicles" >> typeOf _unit >> "magazines");
	_cms = ["60Rnd_CMFlareMagazine","120Rnd_CMFlareMagazine","240Rnd_CMFlareMagazine","60Rnd_CMFlare_Chaff_Magazine","120Rnd_CMFlare_Chaff_Magazine","240Rnd_CMFlare_Chaff_Magazine"];
	{if (_x in _cms) then {_unit removeMagazineTurret [_x, [-1]]}} forEach _magazines;
};

true