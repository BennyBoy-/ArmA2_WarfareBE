Private ['_availableSpawn','_camps','_closestCamp','_deathLoc','_enemySide','_get','_hostiles','_nearestCamps','_respawnCampsRuleMode','_respawnMinRange','_side','_town','_townSID'],;

_deathLoc = _this select 0;
_side = _this select 1;

_availableSpawn = [];
_respawnCampsRuleMode = missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_RULE_MODE";
_respawnMinRange = missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_SAFE_RADIUS";
_enemySide = sideEnemy;

switch (missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_MODE") do {
	case 1: {
		/* Classic Respawn */
		_town = [_deathLoc] Call GetClosestLocation;
		if !(isNull _town) then {
			if (_town distance _deathLoc  < (missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_RANGE")) then {
				_camps = [_town,_side,true] Call GetFriendlyCamps;
				if (count _camps > 0) then {
					if (_respawnCampsRuleMode > 0) then {
						_closestCamp = [_deathLoc,_camps] Call WFBE_CO_FNC_GetClosestEntity;
						if (WFBE_ISTHREEWAY) then  {
							_enemySide = [west, east, resistance] - [_side];
						} else {
							_enemySide = if (_side == west) then {[east]} else {[west]};
							if (_respawnCampsRuleMode == 2) then {_enemySide = _enemySide + [resistance]};
						};
						_hostiles = [_closestCamp,_enemySide,_respawnMinRange] Call GetHostilesInArea;
						if (_deathLoc distance _closestCamp < _respawnMinRange && _hostiles > 0) then {_camps = _camps - [_closestCamp]};
					};
					_availableSpawn = _availableSpawn + _camps;
				};
			};
		};
	};
	
	case 2: {
		/* Enhanced Respawn - Get the camps around the unit */
		_nearestCamps = _deathLoc nearEntities [WFBE_Logic_Camp, (missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_RANGE")];
		{
			if !(isNil {_x getVariable 'sideID'}) then {
				if ((_side Call GetSideID) == (_x getVariable 'sideID') && alive(_x getVariable "wfbe_camp_bunker")) then {
					if (_respawnCampsRuleMode > 0) then {
						if (_deathLoc distance _x < _respawnMinRange) then {
							if (WFBE_ISTHREEWAY) then  {
								_enemySide = [west, east, resistance] - [_side];
							} else {
								_enemySide = if (_side == west) then {[east]} else {[west]};
								if (_respawnCampsRuleMode == 2) then {_enemySide = _enemySide + [resistance]};
							};
							_hostiles = [_x,_enemySide,_respawnMinRange] Call GetHostilesInArea;
							if (_hostiles == 0) then {_availableSpawn = _availableSpawn + [_x]};
						} else {
							_availableSpawn = _availableSpawn + [_x];
						};
					} else {
						_availableSpawn = _availableSpawn + [_x];
					};
				};
			};
		} forEach _nearestCamps;
	};
	
	case 3: {
		/* Defender Only Respawn - Get the camps around the unit only if the town is friendly to the unit. */
		_nearestCamps = _deathLoc nearEntities [WFBE_Logic_Camp, (missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_RANGE")];
		{
			if !(isNil {_x getVariable 'sideID'}) then {
				_town = _x getVariable 'town';
				_townSID = _town getVariable 'sideID';
				if ((_side Call GetSideID) == _townSID && (_x getVariable 'sideID') == _townSID && alive(_x getVariable "wfbe_camp_bunker")) then {
					if (_respawnCampsRuleMode > 0) then {
						if (_deathLoc distance _x < _respawnMinRange) then {
							if (WFBE_ISTHREEWAY) then  {
								_enemySide = [west, east, resistance] - [_side];
							} else {
								_enemySide = if (_side == west) then {[east]} else {[west]};
								if (_respawnCampsRuleMode == 2) then {_enemySide = _enemySide + [resistance]};
							};
							_hostiles = [_x,_enemySide,_respawnMinRange] Call GetHostilesInArea;
							if (_hostiles == 0) then {_availableSpawn = _availableSpawn + [_x]};
						} else {
							_availableSpawn = _availableSpawn + [_x];
						};
					} else {
						_availableSpawn = _availableSpawn + [_x];
					};
				};
			};
		} forEach _nearestCamps;
	};
};

/* Return the available camps */
_availableSpawn