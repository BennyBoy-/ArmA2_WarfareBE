Private ["_areas","_commanderTeam","_deployed","_direction","_grp","_HQ","_HQName","_logic","_logik","_MHQ","_near","_position","_side","_sideText","_site","_type","_update"];

_type = _this select 0;
_side = _this select 1;
_position = _this select 2;
_direction = _this select 3;
_sideText = _side;
_sideID = (_side) Call GetSideID;
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

if (typeName _position == "OBJECT") then {_position = position _position};

/* Handle the LAG. */
waitUntil {!(_logik getVariable "wfbe_hqinuse")};
_logik setVariable ["wfbe_hqinuse", true];

_HQ = (_side) Call WFBE_CO_FNC_GetSideHQ;
_deployed = (_side) Call WFBE_CO_FNC_GetSideHQDeployStatus;

if (!_deployed) then {
	_HQ setPos [1,1,1];
	
	_site = createVehicle [_type, _position, [], 0, "NONE"];
	_site setDir _direction;
	_site setPos _position;
	_site setVariable ["wfbe_side", _side];
	_site setVariable ["wfbe_structure_type", "Headquarters"];
	
	_logik setVariable ['wfbe_hq_deployed', true, true];
	_logik setVariable ["wfbe_hq", _site, true];
	
	_site setVehicleInit Format["[this,true,%1] ExecVM 'Client\Init\Init_BaseStructure.sqf'",_sideID];
	processInitCommands;
	
	[_side,"Deployed", ["Base", _site]] Spawn SideMessage;
	_site addEventHandler ['killed', {_this Spawn WFBE_SE_FNC_OnHQKilled}];
	_site addEventHandler ["hit",{_this Spawn BuildingDamaged}];
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE") > 0) then {_site addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}]};
	
	//--- base area limits.
	if ((missionNamespace getVariable "WFBE_C_BASE_AREA") > 0) then {
		_update = true;
		_areas = _logik getVariable "wfbe_basearea";
		_near = [_position,_areas] Call WFBE_CO_FNC_GetClosestEntity;
		if (!isNull _near) then {
			if (_near distance _position < ((missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE") + (missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE"))) then {_update = false};
		};
		if (_update) then {
			_grp = createGroup sideLogic;
			_logic = _grp createUnit ["Logic",[0,0,0],[],0,"NONE"];
			_logic setPos _position;
			_logik setVariable ["wfbe_basearea", _areas + [_logic], true];
		};
	};
	
	["INFORMATION", Format ["Construction_HQSite.sqf: [%1] MHQ has been deployed.", _sideText]] Call WFBE_CO_FNC_LogContent;
	
	deleteVehicle _HQ;
} else {
	_position = getPos _HQ;
	_direction = getDir _HQ;
	_HQName = missionNamespace getVariable Format["WFBE_%1MHQNAME",_sideText];

	_HQ setPos [1,1,1];
	
	_MHQ = [_HQName, _position, _sideID, _direction, true, false] Call WFBE_CO_FNC_CreateVehicle;
	_MHQ setVelocity [0,0,-1];
	_MHQ setVariable ["WFBE_Taxi_Prohib", true];
	_MHQ setVariable ["wfbe_side", _side];
	_MHQ setVariable ["wfbe_trashable", false];
	_MHQ setVariable ["wfbe_structure_type", "Headquarters"];
	
	_logik setVariable ["wfbe_hq", _MHQ, true];
	_logik setVariable ['wfbe_hq_deployed', false, true];
	
	//--- [>1.62] Set the HQ to be local to the commander.
	_commanderTeam = (_side) Call WFBE_CO_FNC_GetCommanderTeam;
	if !(isNull _commanderTeam) then {
		if (!WF_A2_Vanilla && isMultiplayer && isPlayer(leader _commanderTeam)) then {
			[_MHQ, leader _commanderTeam] Spawn {sleep 1.7; _this Spawn WFBE_SE_FNC_SetLocalityOwner};
		};
	};
	
	[_side,"Mobilized", ["Base", _MHQ]] Spawn SideMessage;
	_MHQ addEventHandler ['killed', {_this Spawn WFBE_SE_FNC_OnHQKilled}];
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE") > 0) then {_MHQ addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}]};
	
	["INFORMATION", Format ["Construction_HQSite.sqf: [%1] MHQ has been mobilized.", _sideText]] Call WFBE_CO_FNC_LogContent;
	
	deleteVehicle _HQ;
};

/* Handle the LAG. */
_logik setVariable ["wfbe_hqinuse", false];