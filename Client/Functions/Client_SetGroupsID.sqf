Private ["_m","_milalpha","_u"];

_milalpha = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike",
"November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu",
"Razor","Fatman","StarForce","Frostbite","Battlemage","Manhattan","Firefly","Swordsman","Sabre","Hammer","Reaper",
"Anvil","Fortune"];

_u = 0;
_m = count _milalpha;
{
	if !(isNil '_x' && _u < _m) then {_x setGroupID [_milalpha select _u]};
	_u = _u + 1;
} forEach clientTeams