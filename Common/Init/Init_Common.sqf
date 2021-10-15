["INITIALIZATION", Format ["Init_Common.sqf: Common initialization begins at [%1]", time]] Call WFBE_CO_FNC_LogContent;

Private ['_count'];

BalanceInit = Compile preprocessFileLineNumbers "Common\Functions\Common_BalanceInit.sqf";
BuildingInRange = Compile preprocessFileLineNumbers "Common\Functions\Common_BuildingInRange.sqf";
ChangeSideSupply = Compile preprocessFileLineNumbers "Common\Functions\Common_ChangeSideSupply.sqf";
ChangeTeamFunds = Compile preprocessFileLineNumbers "Common\Functions\Common_ChangeTeamFunds.sqf";
EquipArtillery = Compile preprocessFileLineNumbers "Common\Functions\Common_EquipArtillery.sqf";
EquipLoadout = Compile preprocessFileLineNumbers "Common\Functions\Common_EquipLoadout.sqf";
FireArtillery = Compile preprocessFileLineNumbers "Common\Functions\Common_FireArtillery.sqf";
GetAIDigit = Compile preprocessFileLineNumbers "Common\Functions\Common_GetAIDigit.sqf";
GetClosestLocation = Compile preprocessFileLineNumbers "Common\Functions\Common_GetClosestLocation.sqf";
GetClosestLocationBySide = Compile preprocessFileLineNumbers "Common\Functions\Common_GetClosestLocationBySide.sqf";
GetCommanderTeam = Compile preprocessFileLineNumbers "Common\Functions\Common_GetCommanderTeam.sqf";
GetConfigInfo = Compile preprocessFileLineNumbers "Common\Functions\Common_GetConfigInfo.sqf";
GetFactories = Compile preprocessFileLineNumbers "Common\Functions\Common_GetFactories.sqf";
GetFriendlyCamps = Compile preprocessFileLineNumbers "Common\Functions\Common_GetFriendlyCamps.sqf";
GetGroupFromConfig = Compile preprocessFileLineNumbers "Common\Functions\Common_GetGroupFromConfig.sqf";
GetHostilesInArea = Compile preprocessFileLineNumbers "Common\Functions\Common_GetHostilesInArea.sqf";
GetLiveUnits = Compile preprocessFileLineNumbers "Common\Functions\Common_GetLiveUnits.sqf";
GetPositionFrom = Compile preprocessFileLineNumbers "Common\Functions\Common_GetPositionFrom.sqf";
GetRandomPosition = Compile preprocessFileLineNumbers "Common\Functions\Common_GetRandomPosition.sqf";
GetRespawnCamps = Compile preprocessFileLineNumbers "Common\Functions\Common_GetRespawnCamps.sqf";
GetRespawnThreeway = Compile preprocessFileLineNumbers "Common\Functions\Common_GetRespawnThreeway.sqf";
GetSafePlace = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSafePlace.sqf";
GetSideFromID = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideFromID.sqf";
GetSideID = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideID.sqf";
GetSideSupply = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideSupply.sqf";
GetSideUpgrades = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideUpgrades.sqf";
GetSideTowns = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideTowns.sqf";
GetSleepFPS = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSleepFPS.sqf";
GetTeamArtillery = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamArtillery.sqf";
GetTeamAutonomous = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamAutonomous.sqf";
GetTeamFunds = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamFunds.sqf";
GetTeamMoveMode = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamMoveMode.sqf";
GetTeamMovePos = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamMovePos.sqf";
GetTeamRespawn = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamRespawn.sqf";
GetTeamType = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamType.sqf";
GetTeamVehicles = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamVehicles.sqf";
GetTotalCamps = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTotalCamps.sqf";
GetTotalCampsOnSide = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTotalCampsOnSide.sqf";
GetTotalSupplyValue = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTotalSupplyValue.sqf";
GetTownsHeld = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTownsHeld.sqf";
GetTownsIncome = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTownsIncome.sqf";
GetUnitsBelowHeight = Compile preprocessFileLineNumbers "Common\Functions\Common_GetUnitsBelowHeight.sqf";
GetUnitVehicle = Compile preprocessFileLineNumbers "Common\Functions\Common_GetUnitVehicle.sqf";
HandleIncomingMissile = Compile preprocessFileLineNumbers "Common\Functions\Common_HandleIncomingMissile.sqf";
IsArtillery = Compile preprocessFileLineNumbers "Common\Functions\Common_IsArtillery.sqf";
MarkerUpdate = Compile preprocessFileLineNumbers "Common\Common_MarkerUpdate.sqf";
PlaceNear = Compile preprocessFileLineNumbers "Common\Functions\Common_PlaceNear.sqf";
PlaceSafe = Compile preprocessFileLineNumbers "Common\Functions\Common_PlaceSafe.sqf";
RearmVehicle = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_RearmVehicleOA.sqf"} else {Compile preprocessFileLineNumbers "Common\Functions\Common_RearmVehicle.sqf"};
RevealArea = Compile preprocessFileLineNumbers "Common\Functions\Common_RevealArea.sqf";
SetCommanderVotes = Compile preprocessFileLineNumbers "Common\Functions\Common_SetCommanderVotes.sqf";
SetTeamAutonomous = Compile preprocessFileLineNumbers "Common\Functions\Common_SetTeamAutonomous.sqf";
SetTeamRespawn = Compile preprocessFileLineNumbers "Common\Functions\Common_SetTeamRespawn.sqf";
SetTeamMoveMode = Compile preprocessFileLineNumbers "Common\Functions\Common_SetTeamMoveMode.sqf";
SetTeamMovePos = Compile preprocessFileLineNumbers "Common\Functions\Common_SetTeamMovePos.sqf";
SetTeamType = Compile preprocessFileLineNumbers "Common\Functions\Common_SetTeamType.sqf";
SpawnTurrets = Compile preprocessFileLineNumbers "Common\Functions\Common_SpawnTurrets.sqf";
SortByDistance = Compile preprocessFileLineNumbers "Common\Functions\Common_SortByDistance.sqf";
UpdateStatistics = Compile preprocessFileLineNumbers "Common\Functions\Common_UpdateStatistics.sqf";
UseStationaryDefense = Compile preprocessFileLineNumbers "Common\Functions\Common_UseStationaryDefense.sqf";

// Module: Arty
ARTY_HandleILLUM = Compile preprocessFile "Common\Module\Arty\ARTY_HandleILLUM.sqf"; 
ARTY_HandleSADARM = Compile preprocessFile "Common\Module\Arty\ARTY_HandleSADARM.sqf"; 
ARTY_Prep = Compile preprocessFile "Common\Module\Arty\ARTY_mobileMissionPrep.sqf";
ARTY_Finish = Compile preprocessFile "Common\Module\Arty\ARTY_mobileMissionFinish.sqf";

//--- New Fnc.
WFBE_CO_FNC_ArrayPush = Compile preprocessFileLineNumbers "Common\Functions\Common_ArrayPush.sqf";
WFBE_CO_FNC_ArrayRemoveIndex = Compile preprocessFileLineNumbers "Common\Functions\Common_ArrayRemoveIndex.sqf";
WFBE_CO_FNC_ArrayShift = Compile preprocessFileLineNumbers "Common\Functions\Common_ArrayShift.sqf";
WFBE_CO_FNC_ArrayShuffle = Compile preprocessFileLineNumbers "Common\Functions\Common_ArrayShuffle.sqf";
WFBE_CO_FNC_ChangeTeamFunds = Compile preprocessFileLineNumbers "Common\Functions\Common_ChangeTeamFunds.sqf";
WFBE_CO_FNC_ChangeUnitGroup = Compile preprocessFileLineNumbers "Common\Functions\Common_ChangeUnitGroup.sqf";
WFBE_CO_FNC_ClearVehicleCargo = if (WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_ClearVehicleCargo.sqf"} else {Compile preprocessFileLineNumbers "Common\Functions\Common_ClearVehicleCargoOA.sqf"};
WFBE_CO_FNC_CreateTeam = Compile preprocessFileLineNumbers "Common\Functions\Common_CreateTeam.sqf";
WFBE_CO_FNC_CreateTownUnits = Compile preprocessFileLineNumbers "Common\Functions\Common_CreateTownUnits.sqf";
WFBE_CO_FNC_CreateVehicle = Compile preprocessFileLineNumbers "Common\Functions\Common_CreateVehicle.sqf";
WFBE_CO_FNC_CreateUnit = Compile preprocessFileLineNumbers "Common\Functions\Common_CreateUnit.sqf";
WFBE_CO_FNC_EquipBackpack = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_EquipBackpack.sqf"} else {{}};
WFBE_CO_FNC_EquipUnit = Compile preprocessFileLineNumbers "Common\Functions\Common_EquipUnit.sqf";
WFBE_CO_FNC_EquipVehicle = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_EquipVehicle.sqf"} else {{}};
WFBE_CO_FNC_FindTurretsRecursive = Compile preprocessFileLineNumbers "Common\Functions\Common_FindTurretsRecursive.sqf";
WFBE_CO_FNC_FireArtillery = Compile preprocessFileLineNumbers "Common\Functions\Common_FireArtillery.sqf";
WFBE_CO_FNC_GetAreaEnemiesCount = Compile preprocessFileLineNumbers "Common\Functions\Common_GetAreaEnemiesCount.sqf";
WFBE_CO_FNC_GetCommanderTeam = Compile preprocessFileLineNumbers "Common\Functions\Common_GetCommanderTeam.sqf";
WFBE_CO_FNC_GetClosestEnemyLocation = Compile preprocessFileLineNumbers "Common\Functions\Common_GetClosestEnemyLocation.sqf";
WFBE_CO_FNC_GetClosestEntity = Compile preprocessFileLineNumbers "Common\Functions\Common_GetClosestEntity.sqf";
WFBE_CO_FNC_GetConfigEntry = Compile preprocessFileLineNumbers "Common\Functions\Common_GetConfigEntry.sqf";
WFBE_CO_FNC_GetDirTo = Compile preprocessFileLineNumbers "Common\Functions\Common_GetDirTo.sqf";
WFBE_CO_FNC_GetEmptyPosition = Compile preprocessFileLineNumbers "Common\Functions\Common_GetEmptyPosition.sqf";
WFBE_CO_FNC_GetLiveUnits = Compile preprocessFileLineNumbers "Common\Functions\Common_GetLiveUnits.sqf";
WFBE_CO_FNC_GetRandomPosition = Compile preprocessFileLineNumbers "Common\Functions\Common_GetRandomPosition.sqf";
WFBE_CO_FNC_GetSideFromID = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideFromID.sqf";
WFBE_CO_FNC_GetSideHQDeployStatus = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideHQDeployStatus.sqf";
WFBE_CO_FNC_GetSideHQ = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideHQ.sqf";
WFBE_CO_FNC_GetSideID = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideID.sqf";
WFBE_CO_FNC_GetSideLogic = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideLogic.sqf";
WFBE_CO_FNC_GetSideSupply = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideSupply.sqf";
WFBE_CO_FNC_GetSideStructures = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideStructures.sqf";
WFBE_CO_FNC_GetSideTowns = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideTowns.sqf";
WFBE_CO_FNC_GetSideUpgrades = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideUpgrades.sqf";
WFBE_CO_FNC_GetTeamFunds = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTeamFunds.sqf";
WFBE_CO_FNC_GetTotalCamps = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTotalCamps.sqf";
WFBE_CO_FNC_GetTotalCampsOnSide = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTotalCampsOnSide.sqf";
WFBE_CO_FNC_GetTownsSupply = Compile preprocessFileLineNumbers "Common\Functions\Common_GetTownsSupply.sqf";
WFBE_CO_FNC_GetUnitConfigGear = Compile preprocessFileLineNumbers "Common\Functions\Common_GetUnitConfigGear.sqf";
WFBE_CO_FNC_GetUnitsPerSide = Compile preprocessFileLineNumbers "Common\Functions\Common_GetUnitsPerSide.sqf";
WFBE_CO_FNC_GetVehicleTurretsGear = Compile preprocessFileLineNumbers "Common\Functions\Common_GetVehicleTurretsGear.sqf";
WFBE_CO_FNC_HandleArtillery = Compile preprocessFileLineNumbers "Common\Functions\Common_HandleArtillery.sqf";
WFBE_CO_FNC_OnUnitHit = Compile preprocessFileLineNumbers "Common\Functions\Common_OnUnitHit.sqf";
WFBE_CO_FNC_OnUnitKilled = Compile preprocessFileLineNumbers "Common\Functions\Common_OnUnitKilled.sqf";
WFBE_CO_FNC_RevealArea = Compile preprocessFileLineNumbers "Common\Functions\Common_RevealArea.sqf";
WFBE_CO_FNC_RemoveCountermeasures = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_RemoveCountermeasures.sqf"} else {{}};
WFBE_CO_FNC_SendToClient = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_SendToClient.sqf"} else {{}};
WFBE_CO_FNC_SendToClients = Compile preprocessFileLineNumbers "Common\Functions\Common_SendToClients.sqf";
WFBE_CO_FNC_SendToServer = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_SendToServer.sqf"} else {Compile preprocessFileLineNumbers "Common\Functions\Common_SendToServerOptimized.sqf"};
WFBE_CO_FNC_SetTurretsMagazines = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Common\Functions\Common_SetTurretsMagazines.sqf"} else {{}};
WFBE_CO_FNC_SortByDistance = Compile preprocessFileLineNumbers "Common\Functions\Common_SortByDistance.sqf";
WFBE_CO_FNC_WaypointPatrol = Compile preprocessFileLineNumbers "Common\Functions\Common_WaypointPatrol.sqf";
WFBE_CO_FNC_WaypointPatrolTown = Compile preprocessFileLineNumbers "Common\Functions\Common_WaypointPatrolTown.sqf";
WFBE_CO_FNC_WaypointSimple = Compile preprocessFileLineNumbers "Common\Functions\Common_WaypointSimple.sqf";
WFBE_CO_FNC_WaypointsAdd = Compile preprocessFileLineNumbers "Common\Functions\Common_WaypointsAdd.sqf";
WFBE_CO_FNC_WaypointsRemove = Compile preprocessFileLineNumbers "Common\Functions\Common_WaypointsRemove.sqf";

["INITIALIZATION", "Init_Common.sqf: Functions are initialized."] Call WFBE_CO_FNC_LogContent;

varQueu = random(10)+random(100)+random(1000);
unitMarker = 0;

/* Respawn Markers */
createMarkerLocal ["respawn_east",getMarkerPos "EastTempRespawnMarker"];
"respawn_east" setMarkerColorLocal "ColorGreen";
"respawn_east" setMarkerShapeLocal "RECTANGLE";
"respawn_east" setMarkerBrushLocal "BORDER";
"respawn_east" setMarkerSizeLocal [15,15];
"respawn_east" setMarkerAlphaLocal 0;
createMarkerLocal ["respawn_west",getMarkerPos "WestTempRespawnMarker"];
"respawn_west" setMarkerColorLocal "ColorGreen";
"respawn_west" setMarkerShapeLocal "RECTANGLE";
"respawn_west" setMarkerBrushLocal "BORDER";
"respawn_west" setMarkerSizeLocal [15,15];
"respawn_west" setMarkerAlphaLocal 0;
createMarkerLocal ["respawn_guerrila",getMarkerPos "GuerTempRespawnMarker"];
"respawn_guerrila" setMarkerColorLocal "ColorGreen";
"respawn_guerrila" setMarkerShapeLocal "RECTANGLE";
"respawn_guerrila" setMarkerBrushLocal "BORDER";
"respawn_guerrila" setMarkerSizeLocal [15,15];
"respawn_guerrila" setMarkerAlphaLocal 0;

//--- Types.
WFBE_Logic_Airfield = "LocationLogicAirport";
WFBE_Logic_Camp = "LocationLogicCamp";
WFBE_Logic_Depot = "LocationLogicDepot";

/* Allies */
if ((missionNamespace getVariable "WFBE_C_BASE_ALLIES") > 0) then {
	westAlliesFunds = (missionNamespace getVariable "WFBE_C_ECONOMY_FUNDS_START_WEST")*5;
	eastAlliesFunds = (missionNamespace getVariable "WFBE_C_ECONOMY_FUNDS_START_EAST")*5;
};

/* Wait for BIS Module Init */
waitUntil {!(isNil 'BIS_fnc_init')};
waitUntil {BIS_fnc_init};

/* CORE SYSTEM - Start
	Different Core are added depending on the current ArmA Version running, add yours bellow.
*/
_team_west = "";
_team_east = "";
switch (true) do {
	case WF_A2_Vanilla: {
		/* Model Core */
		Call Compile preprocessFileLineNumbers 'Common\Config\Core_Models\Vanilla.sqf';
		
		/* Gear Core */
		if (local player) then {
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_RU.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_GUE.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_USMC.sqf";
		};
		/* Class Core */
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_CDF.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_CIV.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_FR.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_GUE.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_INS.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_MVD.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_RU.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_Spetsnaz.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_USMC.sqf';

		/* Call in the teams template - Vanilla */
		_team_west = "USMC";
		_team_east = "RU";
	};
	case WF_A2_Arrowhead: {
		/* Model Core */
		Call Compile preprocessFileLineNumbers 'Common\Config\Core_Models\Arrowhead.sqf';
	
		/* Gear Core */
		if (local player) then {
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_US.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_TKA.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_BAF.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_PMC.sqf";
		};
		/* Class Core */
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_ACR.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_BAF.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_BAFD.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_BAFW.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_DeltaForce.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_KSK.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_PMC.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKA.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKCIV.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKGUE.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKSF.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_US.sqf';

		/* Call in the teams template - Arrowhead */
		_team_west = "US";
		_team_east = "TKA";
	};
	case WF_A2_CombinedOps: {
		/* Model Core */
		if !(WF_Camo) then {
			Call Compile preprocessFileLineNumbers 'Common\Config\Core_Models\CombinedOps.sqf';
		} else {
			Call Compile preprocessFileLineNumbers 'Common\Config\Core_Models\CombinedOps_W.sqf';
		};
	
		/* Gear Core */
		if (local player) then {
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_US.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_TKA.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_BAF.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_GUE.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_PMC.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_RU.sqf";
			Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_USMC.sqf";
		};
		/* Class Core */
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_ACR.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_BAF.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_BAFD.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_BAFW.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_CDF.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_CIV.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_DeltaForce.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_FR.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_GUE.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_INS.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_KSK.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_MVD.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_PMC.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_RU.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_Spetsnaz.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKA.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKCIV.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKGUE.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_TKSF.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_US.sqf';
		Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_USMC.sqf';

		/* Call in the teams template - Combined Operations */
		_team_west = if (WF_Camo) then {'US_Camo'} else {'US'};
		_team_east = "TKA";
		
		/* Mods */
		if (modACE) then {
			if (local player) then {
				Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_ACE_RU.sqf";
				Call Compile preprocessFileLineNumbers "Common\Config\Gear\Gear_ACE_US.sqf";
			};
			Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_ACE_RU.sqf';
			Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_ACE_US_D.sqf';
			Call Compile preprocessFileLineNumbers 'Common\Config\Core\Core_ACE_US_W.sqf';
		};
	};
};

["INITIALIZATION", "Init_Common.sqf: Core Files are loaded."] Call WFBE_CO_FNC_LogContent;

//--- new system.
_grpWest = (missionNamespace getVariable 'WFBE_C_UNITS_FACTIONS_WEST') select (missionNamespace getVariable 'WFBE_C_UNITS_FACTION_WEST');
_grpEast = (missionNamespace getVariable 'WFBE_C_UNITS_FACTIONS_EAST') select (missionNamespace getVariable 'WFBE_C_UNITS_FACTION_EAST');
_grpRes = (missionNamespace getVariable 'WFBE_C_UNITS_FACTIONS_GUER') select (missionNamespace getVariable 'WFBE_C_UNITS_FACTION_GUER');

["INITIALIZATION", Format["Init_Common.sqf: Using groups - West [%1], East [%2], Resistance [%3].",_grpWest,_grpEast,_grpRes]] Call WFBE_CO_FNC_LogContent;

/* CORE SYSTEM - End */

//--- Determine which logics are defined.
_presents = [];
{
	Private ["_sideIsPresent"];
	_sideIsPresent = if !(isNil (_x select 1)) then {true} else {false};
	missionNamespace setVariable [Format["WFBE_%1_PRESENT", str (_x select 0)], _sideIsPresent];
	if (_sideIsPresent) then {_presents = _presents + [_x select 0]};
} forEach [[west,"WFBE_L_BLU"],[east,"WFBE_L_OPF"],[resistance,"WFBE_L_GUE"]];

WFBE_PRESENTSIDES = _presents;
WFBE_ISTHREEWAY = if (count WFBE_PRESENTSIDES == 3) then {true} else {false};

//--- Todo, dynamic (if logic is present or not).
WFBE_DEFENDER = resistance;
WFBE_DEFENDER_ID = (WFBE_DEFENDER) Call WFBE_CO_FNC_GetSideID;

//--- Import the desired global side variables.
Call Compile preprocessFileLineNumbers Format["Common\Config\Core_Root\Root_%1.sqf",_grpRes];
Call Compile preprocessFileLineNumbers Format["Common\Config\Core_Root\Root_%1.sqf", _team_west];
Call Compile preprocessFileLineNumbers Format["Common\Config\Core_Root\Root_%1.sqf", _team_east];

//--- Common Exec.
Call Compile preprocessFileLineNumbers "Common\Init\Init_PublicVariables.sqf";

//--- Import the desired defenses. (todo, Replace the old defense init by this one).
Call Compile preprocessFileLineNumbers Format["Common\Config\Defenses\Defenses_%1.sqf",_grpWest];
Call Compile preprocessFileLineNumbers Format["Common\Config\Defenses\Defenses_%1.sqf",_grpEast];
Call Compile preprocessFileLineNumbers Format["Common\Config\Defenses\Defenses_%1.sqf",_grpRes];

//--- Server Exec.
if (isServer) then {
	//--- Import the desired town groups.
	Call Compile preprocessFileLineNumbers Format["Common\Config\Groups\Groups_%1.sqf",_grpWest];
	Call Compile preprocessFileLineNumbers Format["Common\Config\Groups\Groups_%1.sqf",_grpEast];
	Call Compile preprocessFileLineNumbers Format["Common\Config\Groups\Groups_%1.sqf",_grpRes];
	
	//--- Allies.
	if ((missionNamespace getVariable "WFBE_C_BASE_ALLIES") > 0) then {Call Compile preprocessFileLineNumbers "Common\Config\Config_Allies.sqf"};
};

//--- Airports Init.
ExecVM "Common\Init\Init_Airports.sqf";

["INITIALIZATION", "Init_Common.sqf: Config Files are loaded."] Call WFBE_CO_FNC_LogContent;

//--- Boundaries, use setPos to find the perfect spot on other islands and worldName to determine the island name (editor: diag_log worldName; player setPos [0,5120,0]; ).
Call Compile preprocessFileLineNumbers "Common\Init\Init_Boundaries.sqf";
["INITIALIZATION", "Init_Common.sqf: Boundaries are loaded."] Call WFBE_CO_FNC_LogContent;

if ((missionNamespace getVariable 'WFBE_C_TOWNS_CONQUEST_MODE') > 0) then {Call Compile preprocessFileLineNumbers "Common\Init\Init_Neighbors.sqf"}; //--- Neighbors
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_ICBM") > 0) then {Call Compile preprocessFileLineNumbers "Client\Module\Nuke\ICBM_Init.sqf"}; //--- ICBM.
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE") > 0) then {Call Compile preprocessFileLineNumbers "Common\Module\IRS\IRS_Init.sqf"}; //--- IR Smoke.
if ((missionNamespace getVariable "WFBE_C_MODULE_UPSMON") > 0) then {Call Compile preprocessFileLineNumbers "Server\Module\UPSMON\Init_UPSMON.sqf"}; //--- UPSMON AI

//--- CIPHER Module - Functions.
Call Compile preprocessFileLineNumbers "Common\Module\CIPHER\CIPHER_Init.sqf";

//--- Longest vehicles purchase (+ extra processing).
_balancePrice = missionNamespace getVariable "WFBE_C_UNITS_PRICING";
{
	Private ["_longest","_structure"];
	_structure = _x;
	
	//--- Get the longest build time per structure.
	_longest = 0;
	{
		_type = missionNamespace getVariable Format ["WFBE_%1%2UNITS", _x, _structure];
		if !(isNil '_type') then {
			{
				_c = missionNamespace getVariable _x;
				if !(isNil '_c') then {
					if ((_c select QUERYUNITTIME) > _longest) then {_longest = (_c select QUERYUNITTIME)};
					if (_structure in ["LIGHT", "HEAVY"]) then {if (_balancePrice in [1,3]) then {_c set [QUERYUNITPRICE, (_c select QUERYUNITPRICE)*2]}};
					if (_structure in ["AIRCRAFT", "AIRPORT"]) then {if (_balancePrice in [1,2]) then {_c set [QUERYUNITPRICE, (_c select QUERYUNITPRICE)*2]}};
				};
			} forEach _type;
		};
	} forEach WFBE_PRESENTSIDES;
	
	missionNamespace setVariable [Format ["WFBE_LONGEST%1BUILDTIME",_structure], _longest];
} forEach ["BARRACKS","LIGHT","HEAVY","AIRCRAFT","AIRPORT","DEPOT"];

//--- If money is the only resource, multiply the building cost.
if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 1) then {
	Private ["_list"];
	{
		_list = missionNamespace getVariable Format ["WFBE_%1STRUCTURECOSTS", _x];
		for '_i' from 0 to count(_list)-1 do {_list set [_i, round((_list select _i) * 5)]};
	} forEach WFBE_PRESENTSIDES;
};

//--- Common initilization is complete at this point.
["INITIALIZATION", Format ["Init_Common.sqf: Common initialization ended at [%1]", time]] Call WFBE_CO_FNC_LogContent;
commonInitComplete = true;