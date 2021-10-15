/*
	Triggerd upon a unit death.
	 Parameters:
		- Killed
		- Killer
		- Killed side ID.
*/

Private ["_get","_killed","_killed_group","_killed_isman","_killed_side","_killed_type","_killer","_killer_group","_killer_isplayer","_killer_iswfteam","_killer_side","_killer_type","_killer_vehicle","_killer_uid"];

_killed = _this select 0;
_killer = _this select 1;
_killed_side = (_this select 2) Call GetSideFromID;

if (_killer == _killed || isNull _killer) then { //--- The killed may be the killer (suicide) or bailed before destruction.
	_last_hit = _killed getVariable "wfbe_lasthitby";
	if !(isNil '_last_hit') then {
		if (alive _last_hit) then {
			if (side _last_hit != _killed_side && time - (_killed getVariable "wfbe_lasthittime") < 25) then {_killer = _last_hit};
		};
	};
};

if !(alive _killer) exitWith {}; //--- Killer is null or dead, nothing to see here.

//--- Retrieve basic information.
_killed_group = group _killed;
_killed_isman = if (_killed isKindOf "Man") then {true} else {false};
_killed_type = typeOf _killed;
_killer_group = group _killer;
_killer_isplayer = if (isPlayer _killer) then {true} else {false};
_killer_iswfteam = if !(isNil {_killer_group getVariable "wfbe_funds"}) then {true} else {false};
_killer_side = side _killer;
_killer_type = typeOf _killer;
_killer_vehicle = vehicle _killer;
_killer_uid = getPlayerUID (leader _killer_group);
// if (!_killer_isplayer && isPlayer (leader _killer_group) || _killer_isplayer && isPlayer (leader _killer_group)) then {_killer_uid = getPlayerUID (leader _killer_group)};

if (_killer_side == sideEnemy) then { //--- Make sure the killer is not renegade, if so, get the side from the config.
	_killer_side = switch (getNumber(configFile >> "CfgVehicles" >> _killer_type >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
};

if (_killer_side == civilian) exitWith {}; //--- Side couldn't be determined? exit.

if (WF_A2_Vanilla) then { //--- Garbage Collector.
	if (!isServer || local player) then {_objects = (WF_Logic getVariable "trash") + [_killed];	WF_Logic setVariable ["trash",_objects,true];} else {_killed setVariable ["wfbe_trashed", true];_killed Spawn TrashObject};
} else {
	if (isServer) then {_killed setVariable ["wfbe_trashed", true];	_killed Spawn TrashObject};
};

if (_killed_side in WFBE_PRESENTSIDES) then { //--- Update the statistics if needed.
	if (_killed_isman) then {[str _killed_side,'Casualties',1] Call UpdateStatistics} else {[str _killed_side,'VehiclesLost',1] Call UpdateStatistics};
};

_get = missionNamespace getVariable _killed_type; //--- Get the killed informations.

if (!isNil '_get' && _killer_iswfteam) then { //--- Make sure that type killed type is defined in the core files and that the killer is a WF team.
	if (_killer_side != _killed_side) then { //--- Normal kill.
		if (isPlayer (leader _killer_group)) then { //--- The team is lead by a player.
			_killer_award = objNull;
			if !(_killer_isplayer) then { //--- An AI is the killer.
				_killer_award = _killer;
				_points = switch (true) do {
					case (_killed_type isKindOf "Infantry"): {1};
					case (_killed_type isKindOf "Car"): {2};
					case (_killed_type isKindOf "Ship"): {4};
					case (_killed_type isKindOf "Motorcycle"): {1};
					case (_killed_type isKindOf "Tank"): {4};
					case (_killed_type isKindOf "Helicopter"): {4};
					case (_killed_type isKindOf "Plane"): {6};
					case (_killed_type isKindOf "StaticWeapon"): {2};
					case (_killed_type isKindOf "Building"): {2};
					default {1};
				};
				
				if (isServer) then {
					['SRVFNCREQUESTCHANGESCORE',[leader _killer_group, (score leader _killer_group) + _points]] Spawn WFBE_SE_FNC_HandlePVF;
				} else {
					["RequestChangeScore", [leader _killer_group, (score leader _killer_group) + _points]] Call WFBE_CO_FNC_SendToServer;
				};
			};
			
			if ((missionNamespace getVariable "WFBE_C_UNITS_BOUNTY") > 0) then { //--- Award the bounty if needed.
				[_killer_uid, "AwardBounty", [_killed_type, false, _killer_award]] Call WFBE_CO_FNC_SendToClients;
				
				if (vehicle _vehicle != _vehicle && alive _vehicle) then { //--- Kill assist (players in the same vehicle).
					{if (alive _x && isPlayer _x) then {[getPlayerUID(_x), "AwardBounty", [_objectType, true]] Call WFBE_CO_FNC_SendToClients}} forEach ((crew (vehicle _vehicle)) - [_killer, player]);
				};
			};
		} else { //--- The team is lead by an AI.
			if ((missionNamespace getVariable "WFBE_C_AI_TEAMS_ENABLED") > 0 && isServer) then { //--- Award the kill to the AI team.
				_bounty = (_get select QUERYUNITPRICE) * (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF");
				_bounty = _bounty - (_bounty % 1);
				[_killer_group, _bounty] Call ChangeTeamFunds;
			};
		};
	} else { //--- Teamkill.
		if (isPlayer (leader _killer_group) && _killer != _killed && !(_killed_type isKindOf "Building")) then { //--- Only applies to player groups.
			[_killer_uid, "LocalizeMessage", ['Teamkill']] Call WFBE_CO_FNC_SendToClients;
		};
	};
};