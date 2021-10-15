Private['_get','_lb','_type'];
_lb = _this select 0;
_type = _this select 1;

lbClear _lb;
{
	lbAdd [_lb,_x];
} forEach (missionNamespace getVariable Format["WFBE_%1%2FACTIONS",sideJoinedText,_type]);

_get = missionNamespace getVariable Format["WFBE_%1%2CURRENTFACTIONSELECTED",sideJoinedText,_type];
if (isNil '_get') then {
	lbSetCurSel [_lb,0];
} else {
	lbSetCurSel [_lb,_get];
};