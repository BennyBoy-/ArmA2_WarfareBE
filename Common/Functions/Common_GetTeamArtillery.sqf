Private["_artillery","_artyTypes","_artyWeapons","_count","_ignoreAmmo","_index","_position","_search","_side","_team","_units","_vehicle","_weapon","_x","_y"];

_team = _this select 0;
_ignoreAmmo = _this select 1;
_index = _this select 2;
_side = _this select 3;

if (_index < 0) exitWith {[]};

_units = units _team;
_artyTypes = (missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_CLASSNAMES",_side]) select _index;
_artyWeapons = missionNamespace getVariable Format ["WFBE_%1_ARTILLERY_WEAPONS",_side];

_artillery = [];

{
	_vehicle = vehicle _x;

	if (typeOf(_vehicle) in _artyTypes) then {
		if (!(isNull(gunner _vehicle)) && !(_vehicle in _artillery) && !(isPlayer(gunner _vehicle))) then {
			if !(isPlayer(gunner _vehicle)) then {
				_weapon = _artyWeapons select _index;

				if (_ignoreAmmo || (_vehicle ammo _weapon > 0)) then {
					_artillery = _artillery + [_vehicle];
				};
			};
		};
	};
} forEach _units;

_artillery