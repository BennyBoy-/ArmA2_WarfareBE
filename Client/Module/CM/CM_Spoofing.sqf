Private ["_ammo","_chance","_enemy","_prob","_missile","_vehicle"];
_vehicle = _this select 0;
_ammo = _this select 1;
_enemy = _this select 2;
_missile = objnull;

if ((alive _vehicle) && (isEngineOn _vehicle)) then {
	_missile = nearestObject [_enemy,_ammo];
	waitUntil {(_missile distance _vehicle) < ((speed _vehicle) * 1.5)};
	_prob = 25 + (random 75);
	_chance = random 100;
	if (_prob > _chance) then {
		while {alive _missile} do {
			_missile setDir ((getDir _missile) + ((random 20) - 10));
			sleep 0.1;
		};
	};
};