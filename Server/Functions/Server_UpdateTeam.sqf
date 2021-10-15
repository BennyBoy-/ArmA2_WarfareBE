Private ['_formations','_team'];
_team = _this;

_formations = ['FILE','DIAMOND','STAG COLUMN','WEDGE'];
_team setFormation (_formations select round(random(count _formations -1)));
_team setBehaviour "AWARE";
_team setSpeedMode "NORMAL";
_team setCombatMode "YELLOW";