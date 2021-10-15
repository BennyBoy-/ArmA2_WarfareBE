/* Description: Creates Defenses. */
Private ["_buildings","_defense","_direction","_isAIQuery","_isArtillery","_manned","_position","_side","_sideID","_type"];
_type = _this select 0;
_side = _this select 1;
_position = _this select 2;
_direction = _this select 3;
_manned = _this select 4;
_isAIQuery = _this select 5;
_manRange = if (count _this > 6) then {_this select 6} else {missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MANNING_RANGE"};
_sideID = (_side) Call GetSideID;

_defense = createVehicle [_type, _position, [], 0, "NONE"];
_defense setDir _direction;
_defense setPos _position;

["INFORMATION", Format ["Construction_StationaryDefense.sqf: [%1] Defense [%2] has been constructed.", str _side, _type]] Call WFBE_CO_FNC_LogContent;

//--- If it's a minefield, we exit the script while spawning it.
if (_type == 'Sign_Danger') exitWith {
	Private ["_c","_h","_mine","_mineType","_toWorld"];
	_mineType = if (_side == west) then {'MineMine'} else {'MineMineE'};
	_h = -4;
	_c = 0;
	for [{_z=0}, {_z<9}, {_z=_z+1}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		_c = _c + 4;
	};

	_h = 0;
	_c = 2;
	for [{_z=0}, {_z<8}, {_z=_z+1}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		_c = _c + 4;
	};

	_h = 4;
	_c = 0;
	for [{_z=0}, {_z<9}, {_z=_z+1}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		_c = _c + 4;
	};
	deleteVehicle _defense;
};

_defense setVariable ["wfbe_defense", true]; //--- This is one of our defenses.

if (_type == 'Concrete_Wall_EP1') then {
	_defense addEventHandler ['handleDamage',{getDammage (_this select 0)+(_this select 2)/160}];
};

Call Compile Format ["_defense addEventHandler ['Killed',{[_this select 0,_this select 1,%1] Spawn WFBE_CO_FNC_OnUnitKilled}]",_sideID];

if (_defense emptyPositions "gunner" > 0 && (((missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MAX_AI") > 0) || _isAIQuery)) then {
	Private ["_alives","_check","_closest","_team"];
	_team = missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side];
	emptyQueu = emptyQueu + [_defense];
	_defense Spawn HandleEmptyVehicle;
	if (_manned) then {
		_alives = (units _team) Call GetLiveUnits;
		if (count _alives < (missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MAX_AI") || _isAIQuery) then {
			_buildings = (_side) Call WFBE_CO_FNC_GetSideStructures;
			_closest = ['BARRACKSTYPE',_buildings,_manRange,_side,_defense] Call BuildingInRange;

			//--- Manning Defenses.
			if (alive _closest) then {
				[_defense,_side,_team,_closest] Spawn HandleDefense;
			};
		};
	};
};

if ((missionNamespace getVariable "WFBE_C_ARTILLERY_UI") > 0) then {
	Private ["_isAC","_isVeh"];
	_isVeh = getNumber(configFile >> "CfgVehicles" >> typeOf(_defense) >> "ARTY_IsArtyVehicle");
	_isAC = getNumber(configFile >> "CfgVehicles" >> typeOf(_defense) >> "artilleryScanner");
	if (_isVeh == 1 || _isAC == 1) then {
		_defense setVehicleInit "[this] ExecVM 'Common\Common_InitArtillery.sqf'";
		processInitCommands;
		["INFORMATION", Format ["Construction_StationaryDefense.sqf: [%1] Artillery [%2] has been given the BIS ARTY UI interface.", str _side, _type]] Call WFBE_CO_FNC_LogContent;
	};
};

/* Are we dealing with an artillery unit ? */
_isArtillery = [_type,_side] Call IsArtillery;
if (_isArtillery != -1) then {[_defense,_isArtillery,_side] Call EquipArtillery};

_defense