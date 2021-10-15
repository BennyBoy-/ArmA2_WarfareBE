/*
	Update the gear view
	 Parameters:
		- Backpack type
		- Selected object
*/

Private ["_backpack","_i","_selected","_target","_view"];

_backpack = _this select 0;
_target = _this select 1;

lbClear 503003;
_selected = "gear";
_view = [];
if (_target isKindOf "Man") then {
	if (_backpack != "") then {_get = missionNamespace getVariable _backpack; if !(isNil '_get') then {if ((_get select 4) == 200) then {_view = [["Backpack","backpack"]]}}};
	_view = _view + [["Gear","gear"]];
	if !(WF_A2_Vanilla) then {if (vehicle _target != _target) then {_view = _view + [["Vehicle","vehicle"]]}};
} else {
	_view =	[["Vehicle","vehicle"]];
	_selected = "vehicle";
};

_i = 0;
{lbAdd[503003, _x select 0];lbSetData[503003,_i,_x select 1];if (_selected == (_x select 1)) then {lbSetCurSel[503003, _i]};_i = _i + 1} forEach _view;
