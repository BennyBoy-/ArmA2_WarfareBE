Private["_ID","_side","_team"];

_side = _this Select 0;
_ID = _this Select 1;

_team = ((Format["WFBE_%1TEAMS",str _side]) Call GetNamespace) select (_ID - 1);
_team