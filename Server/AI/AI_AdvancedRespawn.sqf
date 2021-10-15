/* Enhanced Respawn Management via Multiplayer Event Handler - Experimental */
Private ['_autonomous','_availableSpawn','_buildings','_checks','_closestRespawn','_corpse','_deathLoc','_hq','_i','_isForcedRespawn','_mobileRespawns','_moveMode','_pos','_ran','_range','_rcm','_rd','_respawn','_respawnLoc','_respawnedUnit','_side','_sideID','_sideText','_skip','_team','_update','_upgrades'];

_respawnedUnit = _this select 0;
_corpse = _this select 1;

_deathLoc = getPos _corpse;
_rd = missionNamespace getVariable "WFBE_C_RESPAWN_DELAY";
_rcm = missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_MODE";

_side = side _respawnedUnit;
_sideID = (_side) Call GetSideID;
//--- Ensure that the side is not civilian.
if (_side == civilian) then {
	_side = switch (getNumber(configFile >> "CfgVehicles" >> typeOf _respawnedUnit >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
};
_sideText = str _side;
_team = group _respawnedUnit;
_respawn = (_team) Call GetTeamRespawn;
_respawnLoc = objNull;

["INFORMATION", Format ["AI_AdvancedRespawn.sqf: [%1] AI Team Leader [%2] [%3] has respawned.", _sideText, _team, _respawnedUnit]] Call WFBE_CO_FNC_LogContent;

//--- Remove previous EH.
_respawnedUnit removeAllEventHandlers "Killed";
_respawnedUnit addEventHandler ['Killed', Format["[_this select 0,_this select 1,%1] Spawn WFBE_CO_FNC_OnUnitKilled", _sideID]];

//--- Place the leader on a 'safe' position.
_respawnedUnit setPos getMarkerPos Format["%1TempRespawnMarker",_sideText];

_availableSpawn = [];
_isForcedRespawn = false;

//--- Ensure that the ai is not forced to respawn.
if (typeName _respawn == 'STRING') then {if (_respawn == "forceRespawn") then {_isForcedRespawn = true}};

//--- Towns.
if (_rcm > 0 && !_isForcedRespawn) then {
	_availableSpawn = _availableSpawn + ([_deathLoc, _side] Call GetRespawnCamps);
};

_upgrades = (_side) Call WFBE_CO_FNC_GetSideUpgrades;

//--- Mobile Respawn.
if ((missionNamespace getVariable "WFBE_C_RESPAWN_MOBILE") > 0 && !_isForcedRespawn) then {
	_mobileRespawns = missionNamespace getVariable Format ["WFBE_%1AMBULANCES",_sideText];
	_range = (missionNamespace getVariable "WFBE_C_RESPAWN_RANGES") select (_upgrades select WFBE_UP_RESPAWNRANGE);
	
	_checks = _deathLoc nearEntities[_mobileRespawns,_range];
	if (count _checks > 0) then {
		{if (alive _x) then {_availableSpawn = _availableSpawn + [_x]}} forEach _checks;
	};
};

//--- Wait.
_i = _rd;
_skip = false;
while {_i > 0} do {
	if (isPlayer(_respawnedUnit) || !(alive _respawnedUnit)) exitWith {_skip = true};
	
	_i = _i - 1;	
	sleep 1;
};

//--- Make sure that the AI didn't die or that a player hasn't replaced him before going any further.
if !(_skip) then {
	//--- Equip the AI.
	_loadout = missionNamespace getVariable Format["WFBE_%1_AI_Loadout_%2", _sideText, _upgrades select 13];
	if !(isNil '_loadout') then {
		_loadout = _loadout select floor (random count _loadout);
		if (count _loadout <= 3) then {
			[_respawnedUnit, _loadout select 0, _loadout select 1, _loadout select 2] Call WFBE_CO_FNC_EquipUnit;
		} else {
			[_respawnedUnit, _loadout select 0, _loadout select 1, _loadout select 2, _loadout select 3, _loadout select 4] Call WFBE_CO_FNC_EquipUnit;
		};
	};
	_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
	_buildings = (_side) Call WFBE_CO_FNC_GetSideStructures;

	//--- Check whether AI has a spawn set or not.
	_update = false;
	switch (typeName _respawn) do {
		case "STRING": {
			//--- Not defined.
			_update = true;
			if (_isForcedRespawn) then {[_team,""] Call SetTeamRespawn};
		};
		case "OBJECT": {
			//--- Defined.
			_respawnLoc = _respawn;
			if (!alive _respawn || isNull _respawn) then {
				[_team, ""] Call SetTeamRespawn;
				_update = true;
			};
		};
	};
	
	//--- Default respawn.
	if (_update) then {
		_respawnLoc = _hq;
		if (count _buildings > 0) then {
			_respawnLoc = [_hq,_buildings] Call WFBE_CO_FNC_GetClosestEntity;
		};
	};
	
	//--- Alternative spawn location.
	if (count _availableSpawn > 0) then {
		_respawnLoc = _availableSpawn select floor (random count _availableSpawn);
	};

	["INFORMATION", Format ["AI_AdvancedRespawn.sqf: [%1] AI Team Leader [%2] [%3] has respawned at [%4].", _sideText, _team, _respawnedUnit, _respawnLoc]] Call WFBE_CO_FNC_LogContent;
	
	_pos = [getPos _respawnLoc,20,30] Call GetRandomPosition;
	_pos set [2,0];
	_respawnedUnit setPos _pos;
	
	//--- Assign fresh order if the AI is not on autonomous mode.
	_autonomous = (_team) Call GetTeamAutonomous;
	if !(_autonomous) then {
		_moveMode = (_team) Call GetTeamMoveMode;
		if (_moveMode == "towns") then {_team setVariable ["wfbe_teamgoto", objNull, true]};
		if (_moveMode == "move") then {[_team,"resetMove"] Call SetTeamMoveMode};
		if (_moveMode == "patrol") then {[_team,"resetPatrol"] Call SetTeamMoveMode};
		if (_moveMode == "defense") then {[_team,"resetDefense"] Call SetTeamMoveMode};
	};
};