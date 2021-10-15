disableSerialization;
_display = _this select 0;
MenuAction = -1;
mouseButtonUp = -1;

_cameraModes = ["Internal","External","Gunner","Group"];

_n = 1;
{lbAdd[21002,Format["[%1] %2",_n,name (leader _x)]];_n = _n + 1} forEach clientTeams;
_id = clientTeams find playerTeam;
lbSetCurSel[21002,_id];
_currentUnit = (player) Call GetUnitVehicle;
_currentMode = "Internal";
_currentUnit switchCamera _currentMode;
_units = (Units (group player) - [player]) Call GetLiveUnits;
{lbAdd[21004,Format["(%1) %2",getText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "displayName"),name _x]];_n = _n + 1} forEach _units;

_type = if (!(difficultyEnabled "3rdPersonView")) then {["Internal"]} else {["Internal","External","Ironsight","Group"]};
{lbAdd[21006,_x]} forEach _type;
lbSetCurSel[21006,0];

_map = _display displayCtrl 21007;
_map ctrlMapAnimAdd [0,.25,getPos _currentUnit];
ctrlMapAnimCommit _map;

while {true} do {
	sleep 0.1;
	
	_cameraSwap = false;
	if (Side player != sideJoined || !dialog) exitWith {};

	//--- Map click.
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		_near = _map PosScreenToWorld[mouseX,mouseY];
		_list = _near nearEntities [["Man","Car","Motorcycle","Ship","Tank","Air"],200];
		if (count _list > 0) then {
			_objects = [];
			{if (!(_x isKindOf "Man") && side _x != sideJoined) then {if (count (crew _x) == 0) then {_objects = _objects - [_x]}};if (side _x == sideJoined) then {_objects = _objects + [_x]}} forEach _list;
			if (count _objects > 0) then {
				_currentUnit = ([_near,_objects] Call WFBE_CO_FNC_GetClosestEntity) Call GetUnitVehicle;
				_cameraSwap = true;
			};
		};
	};	
	
	//--- Leader Selection.
	if (MenuAction == 101) then {
		MenuAction = -1;
		_selected = leader (clientTeams select (lbCurSel 21002));
		_currentUnit = (_selected) Call GetUnitVehicle;
		_n = 0;
		_units = (Units (group _selected) - [_selected]) Call GetLiveUnits;
		lbClear 21004;
		{lbAdd[21004,Format["(%1) %2",GetText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "displayName"),name _x]];_n = _n + 1} forEach _units;
		_cameraSwap = true;
	};
	
	//--- Leader commands AIs.
	if (MenuAction == 102) then {
		MenuAction = -1;
		_currentUnit = (_units select (lbCurSel 21004)) Call GetUnitVehicle;
		_cameraSwap = true;
	};
	
	//--- Camera Modes
	if (MenuAction == 103) then {
		MenuAction = -1;
		_currentMode = (_cameraModes select (lbCurSel 21006));
		_cameraSwap = true;
	};
	
	if !(alive _currentUnit) then {
		_currentUnit = (player) Call GetUnitVehicle;
		_cameraSwap = true;
	};
	
	//--- Update the Camera.
	if (_cameraSwap) then {
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [1,.25,getPos _currentUnit];
		ctrlMapAnimCommit _map;
		_currentUnit switchCamera _currentMode;
	};
};

closeDialog 0;
((player) Call GetUnitVehicle) switchCamera _currentMode;