Private ["_availableSpawn","_base_respawn","_buildings","_checks","_deathLoc","_farps","_has_baserespawn","_hq","_mobileRespawns","_range","_side","_sideText","_upgrades"];

_side = _this select 0;
_deathLoc = _this select 1;
_sideText = str _side;

//--- Base.
_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
_availableSpawn = [_hq];
_buildings = (_side) Call WFBE_CO_FNC_GetSideStructures;
_checks = [_side,missionNamespace getVariable Format["WFBE_%1BARRACKSTYPE",_sideText],_buildings] Call GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["WFBE_%1LIGHTTYPE",_sideText],_buildings] Call GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["WFBE_%1HEAVYTYPE",_sideText],_buildings] Call GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["WFBE_%1AIRCRAFTTYPE",_sideText],_buildings] Call GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};

_base_respawn = _availableSpawn - [_hq];
_has_baserespawn = if (alive _hq || count _base_respawn > 0) then {true} else {false};

_checks = [_side,missionNamespace getVariable Format["WFBE_%1COMMANDCENTERTYPE",_sideText],_buildings] Call GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["WFBE_%1SERVICEPOINTTYPE",_sideText],_buildings] Call GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};


//--- HQ is dead, but we can spawn at other buildings.
if (!alive _hq && count _availableSpawn > 1) then {_availableSpawn = _availableSpawn - [_hq]};

//--- Mobile respawn.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_MOBILE") > 0) then {
	_mobileRespawns = missionNamespace getVariable Format["WFBE_%1AMBULANCES",_sideText];
	_upgrades = (_side) Call WFBE_CO_FNC_GetSideUpgrades;
	_range = (missionNamespace getVariable "WFBE_C_RESPAWN_RANGES") select (_upgrades select WFBE_UP_RESPAWNRANGE);
	_checks = _deathLoc nearEntities[_mobileRespawns,_range];
	if (count _checks > 0) then {
		{
			if (_x emptyPositions "cargo" > 0) then {
				_availableSpawn = _availableSpawn + [_x];
			};
		} forEach _checks;
	};
};

//--- MASH.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_MASH") > 0) then {
	_mash = WFBE_Client_Logic getVariable "wfbe_mash";

	if (alive _mash) then {
		_upgrades = (_side) Call WFBE_CO_FNC_GetSideUpgrades;
		_range = (missionNamespace getVariable "WFBE_C_RESPAWN_RANGES") select (_upgrades select WFBE_UP_RESPAWNRANGE);
		if (_deathLoc distance _mash <= _range) then {_availableSpawn = _availableSpawn + [_mash]};
	};
};

//--- Leader.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_LEADER") > 0) then {
	if (group player != WFBE_Client_Team && (leader group player) != player) then {
		if (alive (leader group player) && _deathLoc distance vehicle(leader group player) <= (missionNamespace getVariable "WFBE_C_RESPAWN_RANGE_LEADER")) then {_availableSpawn = _availableSpawn + [leader group player]};
	};
};

//--- In a threeway, defender players are able to respawn in side-controlled towns as long as all camps are owned by the defender's side.
if (WFBE_ISTHREEWAY && _side == WFBE_DEFENDER) then {
	_availableSpawn = _availableSpawn + (_side Call GetRespawnThreeway);
	
	//--- Victory condition may allow random respawn on startup locations.
	if ((missionNamespace getVariable "WFBE_C_VICTORY_THREEWAY") in [0]) then {
		//--- Make sure that at least one base respawn is available.
		if !(_has_baserespawn) then {_availableSpawn = _availableSpawn - [_hq];_availableSpawn = _availableSpawn + [WFBE_Client_Logic getVariable "wfbe_startpos"]};
	};
};

//--- Camps.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_MODE") > 0) then {
	_availableSpawn = _availableSpawn + ([_deathLoc, _side] Call GetRespawnCamps);
};

_availableSpawn