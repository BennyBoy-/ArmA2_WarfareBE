//--- DO NOT CHANGE.
WESTID = 0;
EASTID = 1;
RESISTANCEID = 2;
//--- DO NOT CHANGE.
QUERYUNITLABEL = 0;
QUERYUNITPICTURE = 1;
QUERYUNITPRICE = 2;
QUERYUNITTIME = 3;
QUERYUNITCREW = 4;
QUERYUNITUPGRADE = 5;
QUERYUNITFACTORY = 6;
QUERYUNITSKILL = 7;
QUERYUNITFACTION = 8;
QUERYUNITTURRETS = 9;
//--- DO NOT CHANGE.
QUERYGEARLABEL = 0;
QUERYGEARPICTURE = 1;
QUERYGEARCLASS = 2;
QUERYGEARTYPE = 3;
QUERYGEARCOST = 4;
QUERYGEARUPGRADE = 5;
QUERYGEARALLOWED = 6;
QUERYGEARHANDGUNPOOL = 7;
QUERYGEARMAGAZINES = 8;
QUERYGEARSPACE = 9;
QUERYGEARALLOWTWO = 10;

//--- Side Statics.
WFBE_C_WEST_ID = 0;
WFBE_C_EAST_ID = 1;
WFBE_C_GUER_ID = 2;
WFBE_C_CIV_ID = 3;
WFBE_C_UNKNOWN_ID = 4;

//--- Common Upgrades, each number match the upgrades arrays.
WFBE_UP_BARRACKS = 0;
WFBE_UP_LIGHT = 1;
WFBE_UP_HEAVY = 2;
WFBE_UP_AIR = 3;
WFBE_UP_PARATROOPERS = 4;
WFBE_UP_UAV = 5;
WFBE_UP_SUPPLYRATE = 6;
WFBE_UP_RESPAWNRANGE = 7;
WFBE_UP_AIRLIFT = 8;
WFBE_UP_FLARESCM = 9;
WFBE_UP_ARTYTIMEOUT = 10;
WFBE_UP_ICBM = 11;
WFBE_UP_FASTTRAVEL = 12;
WFBE_UP_GEAR = 13;
WFBE_UP_AMMOCOIN = 14;
WFBE_UP_EASA = 15;
WFBE_UP_SUPPLYPARADROP = 16;
WFBE_UP_ARTYAMMO = 17;
WFBE_UP_IRSMOKE = 18;

//--- New Variables, use isNil to check whether it's already defined or not (MP parameters).

//--- AI.
if (isNil {missionNamespace getVariable "WFBE_C_AI_COMMANDER_ENABLED"}) then {missionNamespace setVariable ["WFBE_C_AI_COMMANDER_ENABLED", 1]}; //--- Enable or disable the AI Commanders.
missionNamespace setVariable ["WFBE_C_AI_COMMANDER_MOVE_INTERVALS", 3600];
missionNamespace setVariable ["WFBE_C_AI_COMMANDER_SUPPLY_TRUCKS_MAX", 5];
if (isNil {missionNamespace getVariable "WFBE_C_AI_MAX"}) then {missionNamespace setVariable ["WFBE_C_AI_MAX", 10]}; //--- Max AI allowed on each AI groups.
if (isNil {missionNamespace getVariable "WFBE_C_AI_DELEGATION"}) then {missionNamespace setVariable ["WFBE_C_AI_DELEGATION", 0]}; //--- Enable AI delegation (creation of ai on the client).
missionNamespace setVariable ["WFBE_C_AI_DELEGATION_FPS_INTERVAL", 60*3]; //--- A client send it's FPS average each x seconds to the server.
missionNamespace setVariable ["WFBE_C_AI_DELEGATION_FPS_MIN", 25]; //--- A client can handle groups if it's FPS average is above x.
missionNamespace setVariable ["WFBE_C_AI_DELEGATION_GROUPS_MAX", 1]; //--- A client max have up to x groups managed on his computer (high values may makes lag, be careful).
missionNamespace setVariable ["WFBE_C_AI_PATROL_RANGE", 400];
if (isNil {missionNamespace getVariable "WFBE_C_AI_TEAMS_ENABLED"}) then {missionNamespace setVariable ["WFBE_C_AI_TEAMS_ENABLED", 1]}; //--- Enable or disable the AI Teams.
if (isNil {missionNamespace getVariable "WFBE_C_AI_TEAMS_JIP_PRESERVE"}) then {missionNamespace setVariable ["WFBE_C_AI_TEAMS_JIP_PRESERVE", 0]}; //--- Keep the AI Teams units on JIP.
missionNamespace setVariable ["WFBE_C_AI_TOWN_ATTACK_HOPS_WP", 4]; //--- AI may use up to x WP to attack a town.

//--- Artillery.
if (isNil {missionNamespace getVariable "WFBE_C_ARTILLERY"}) then {missionNamespace setVariable ["WFBE_C_ARTILLERY", 1]}; //--- Enable or disable Artillery fire missions (0: Disabled, 1: Short, 2: Medium, 3: Long).
missionNamespace setVariable ["WFBE_C_ARTILLERY_AMMO_RANGE_LASER", 175]; //--- Artillery laser rounds detection range (Per Shell).
missionNamespace setVariable ["WFBE_C_ARTILLERY_AMMO_RANGE_SADARM", 200]; //--- Artillery SADARM rounds operative range (Per Shell).
missionNamespace setVariable ["WFBE_C_ARTILLERY_AREA_MAX", 300]; //---  Maximum spread area of artillery support.
if (isNil {missionNamespace getVariable "WFBE_C_ARTILLERY_COMPUTER"}) then {missionNamespace setVariable ["WFBE_C_ARTILLERY_COMPUTER", 1]}; //--- Enable Artillery Computer (0: Disabled, 1: Enabled on Upgrade, 2: Enabled).
missionNamespace setVariable ["WFBE_C_ARTILLERY_INTERVALS", [300, 250, 200, 150]]; //--- Delay between each fire mission for each upgrades.
if (isNil {missionNamespace getVariable "WFBE_C_ARTILLERY_UI"}) then {missionNamespace setVariable ["WFBE_C_ARTILLERY_UI", 0]}; //--- Enable or disable Artillery UI for direct fire missions.

//--- Base.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_AREA"}) then {missionNamespace setVariable ["WFBE_C_BASE_AREA", 2]}; //--- Force the bases to be grouped by areas.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_ALLIES"}) then {missionNamespace setVariable ["WFBE_C_BASE_ALLIES", 0]}; //--- Allies Parameters (0 Disabled, 1 West, 2 East, 3 both).
missionNamespace setVariable ["WFBE_C_BASE_AREA_RANGE", 250]; //--- A base area has a range of x meters.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MAX_AI"}) then {missionNamespace setVariable ["WFBE_C_BASE_DEFENSE_MAX_AI", 30]}; //--- Maximum AIs that will be able to man defense within the barracks area.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MANNING_RANGE"}) then {missionNamespace setVariable ["WFBE_C_BASE_DEFENSE_MANNING_RANGE", 250]}; //--- Within x meters, defenses may be manned.
missionNamespace setVariable ["WFBE_C_BASE_HQ_BUILD_RANGE", 120]; //--- HQ Build range.
missionNamespace setVariable ["WFBE_C_BASE_HQ_REPAIR_PRICE", 20000]; //--- HQ Repair price.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY"}) then {missionNamespace setVariable ["WFBE_C_BASE_PATROLS_INFANTRY", 0]}; //--- Enable AI Squad patrol in base from Barracks.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_START_TOWN"}) then {missionNamespace setVariable ["WFBE_C_BASE_START_TOWN", 1]}; //--- Remove the spawn locations which are too far away from the towns.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_STARTING_DISTANCE"}) then {missionNamespace setVariable ["WFBE_C_BASE_STARTING_DISTANCE", 5000]}; //--- Sides need at last xkm of distance between them.
if (isNil {missionNamespace getVariable "WFBE_C_BASE_STARTING_MODE"}) then {missionNamespace setVariable ["WFBE_C_BASE_STARTING_MODE", 2]}; //--- Starting Locations Mode: 0 = WN|ES; 1 = WS|EN; 2 = Random;

//--- Camps.
if (isNil {missionNamespace getVariable "WFBE_C_CAMPS_CREATE"}) then {missionNamespace setVariable ["WFBE_C_CAMPS_CREATE", 1]}; //--- Create the camp models.
missionNamespace setVariable ["WFBE_C_CAMPS_CAPTURE_BOUNTY", 100]; //--- Bounty received by player whenever he capture a camp.
missionNamespace setVariable ["WFBE_C_CAMPS_CAPTURE_RATE", 2];
missionNamespace setVariable ["WFBE_C_CAMPS_CAPTURE_RATE_MAX", 5];
missionNamespace setVariable ["WFBE_C_CAMPS_RANGE", 10];
missionNamespace setVariable ["WFBE_C_CAMPS_RANGE_PLAYERS", 5];
missionNamespace setVariable ["WFBE_C_CAMPS_REPAIR_DELAY", 35];
missionNamespace setVariable ["WFBE_C_CAMPS_REPAIR_PRICE", 2500];
missionNamespace setVariable ["WFBE_C_CAMPS_REPAIR_RANGE", 15];

//--- Economy.
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_CURRENCY_SYSTEM", 0]}; //--- 0: Funds + Supply, 1: Funds.
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_FUNDS_START_WEST"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_WEST", if (WF_Debug) then {900000} else {800}]};
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_FUNDS_START_EAST"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_EAST", if (WF_Debug) then {900000} else {800}]};
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_FUNDS_START_GUER"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_GUER", if (WF_Debug) then {900000} else {800}]};
missionNamespace setVariable ["WFBE_C_ECONOMY_INCOME_COEF", 10]; //--- Town Multiplicator Coefficient (SV * x).
missionNamespace setVariable ["WFBE_C_ECONOMY_INCOME_DIVIDED", 2.75]; //--- Prevent commander from being a millionaire, and add the rest to the players pool.
missionNamespace setVariable ["WFBE_C_ECONOMY_INCOME_PERCENT_MAX", 100]; //--- Commander may set income up to x%.
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_INTERVAL"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_INCOME_INTERVAL", 60]}; //--- Income Interval (Delay between each paycheck).
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_INCOME_SYSTEM", 4]}; //--- Income System (1:Full, 2:Half (Half -> 120 SV Town = 60$ / 60SV), 3: Commander System, 4: Commander System: Full)
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_START_WEST"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_WEST", if (WF_Debug) then {900000} else {1200}]};
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_START_EAST"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_EAST", if (WF_Debug) then {900000} else {1200}]};
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_START_GUER"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_GUER", if (WF_Debug) then {900000} else {1200}]};
if (isNil {missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM"}) then {missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_SYSTEM", 1]}; //--- Supply System (0: Trucks, 1: Automatic with time).
missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_TIME_INCREASE_DELAY", 80]; //--- Increase SV delay.

//--- Environment.
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_FAST_TIME"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_FAST_TIME", 0]}; //--- Fast Time rates (where x is the minute # skiped each minute)
missionNamespace setVariable ["WFBE_C_ENVIRONMENT_FAST_TIME_VALUES", [0, 4.8, 5.052631579, 5.333333333, 5.647058824, 6, 6.4, 6.857142857, 7.384615385, 8, 8.727272727, 9.6, 10.66666667, 12]]; //--- Fast time values, this shall match the amount of values in rsc\parameters.hpp
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_MAX_VIEW"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_MAX_VIEW", 4000]}; //--- Max view distance.
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_MAX_CLUTTER"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_MAX_CLUTTER", 50]}; //--- Max Terrain grid.
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_STARTING_HOUR"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_STARTING_HOUR", 9]}; //--- Starting Hour of the day.
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_STARTING_MONTH"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_STARTING_MONTH", 6]}; //--- Starting Month of the year.
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_WEATHER"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_WEATHER", 0]}; //--- Weather Type, 0: Clear, 1: Cloudy, 2: Rainy, 3: Dynamic)
missionNamespace setVariable ["WFBE_C_ENVIRONMENT_WEATHER_TRANSITION", 600]; //--- Weather Transition period, change weather overcast each x seconds (longer is more realistic).
if (isNil {missionNamespace getVariable "WFBE_C_ENVIRONMENT_WEATHER_VOLUMETRIC"}) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_WEATHER_VOLUMETRIC", 0]}; //--- Enable volumetric clouds.

//--- Gameplay.
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED", 1]}; //--- Enable the map boundaries if defined.
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_FAST_TRAVEL"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_FAST_TRAVEL", 1]}; //--- Fast Travel (0 Disabled, 1 Free, 2 Fee).
missionNamespace setVariable ["WFBE_C_GAMEPLAY_FAST_TRAVEL_RANGE", 175];
missionNamespace setVariable ["WFBE_C_GAMEPLAY_FAST_TRAVEL_RANGE_MAX", 3500];
missionNamespace setVariable ["WFBE_C_GAMEPLAY_FAST_TRAVEL_PRICE_KM", 215];
missionNamespace setVariable ["WFBE_C_GAMEPLAY_FAST_TRAVEL_TIME_COEF", 0.8];
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE", 1]}; //--- Handle the friendly fire.
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_HANGARS_ENABLED"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_HANGARS_ENABLED", 1]}; //--- Enable or disable hangars.
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_MISSILES_RANGE", 0]}; //--- Incoming Guided missiles Range limit (0 = Disabled).
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_TEAMSWAP_DISABLE"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_TEAMSWAP_DISABLE", 1]}; //--- Disable teamswitch.
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_THERMAL_IMAGING"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_THERMAL_IMAGING", 3]}; //--- Thermal Imaging (0: Disabled, 1: Weapons, 2: Vehicles, 3: All).
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_UID_SHOW"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_UID_SHOW", 1]}; //--- Display the user ID (on teamswap/tk).
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE", 0]}; //--- Upgrade clearance (on start), 0: Disabled, 1: West, 2: East, 3: Res, 4: West + East, 5: West + Res, 6: East + Res, 7: All.
if (isNil {missionNamespace getVariable "WFBE_C_GAMEPLAY_VICTORY_CONDITION"}) then {missionNamespace setVariable ["WFBE_C_GAMEPLAY_VICTORY_CONDITION", 2]}; //--- Victory Condition (0: Annihilation, 1: Assassination, 2: Supremacy, 3: Towns).
missionNamespace setVariable ["WFBE_C_GAMEPLAY_VOTE_TIME", if (WF_Debug) then {8} else {60}];

//--- Modules.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF"}) then {missionNamespace setVariable ["WFBE_C_MODULE_BIS_BAF", 1]}; //--- Enable BAF content.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_BIS_HC"}) then {missionNamespace setVariable ["WFBE_C_MODULE_BIS_HC", 1]}; //--- Enable High Command.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_BIS_PMC"}) then {missionNamespace setVariable ["WFBE_C_MODULE_BIS_PMC", 1]}; //--- Enable PMC content.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA"}) then {missionNamespace setVariable ["WFBE_C_MODULE_WFBE_EASA", 1]}; //--- Enable the Exchangeable Armament System for Aircraft.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES"}) then {missionNamespace setVariable ["WFBE_C_MODULE_WFBE_FLARES", 1]}; //--- Enable the countermeasure system (0: Disabled, 1: Enabled with upgrade, 2: Enabled).
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_WFBE_ICBM"}) then {missionNamespace setVariable ["WFBE_C_MODULE_WFBE_ICBM", 1]}; //--- Enable the Intercontinental Ballistic Missile call for the commander.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE"}) then {missionNamespace setVariable ["WFBE_C_MODULE_WFBE_IRSMOKE", 1]}; //--- Enable the use of IR Smoke.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_WFBE_MISSIONS"}) then {missionNamespace setVariable ["WFBE_C_MODULE_WFBE_MISSIONS", 1]}; //--- Enable WF BE Secondary Missions.
if (isNil {missionNamespace getVariable "WFBE_C_MODULE_UPSMON"}) then {missionNamespace setVariable ["WFBE_C_MODULE_UPSMON", 0]}; //--- Enable UPSMON AI.
missionNamespace setVariable ["WFBE_C_MODULES_UPSMON_TOWN_AREA", [500,500]]; //--- Defines the area of operation for UPSMON AI in a town.

//--- Players.
if (isNil {missionNamespace getVariable "WFBE_C_PLAYERS_AI_MAX"}) then {missionNamespace setVariable ["WFBE_C_PLAYERS_AI_MAX", 14]}; //--- Max AI allowed on each player groups.
missionNamespace setVariable ["WFBE_C_PLAYERS_BOUNTY_CAPTURE", 400];
missionNamespace setVariable ["WFBE_C_PLAYERS_BOUNTY_CAPTURE_ASSIST", 175];
missionNamespace setVariable ["WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION", 800];
missionNamespace setVariable ["WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION_ASSIST", 350];
missionNamespace setVariable ["WFBE_C_PLAYERS_COMMANDER_BOUNTY_CAPTURE_COEF", 30];
missionNamespace setVariable ["WFBE_C_PLAYERS_COMMANDER_SCORE_BUILD", 2];
missionNamespace setVariable ["WFBE_C_PLAYERS_COMMANDER_SCORE_CAPTURE", 1];
missionNamespace setVariable ["WFBE_C_PLAYERS_COMMANDER_SCORE_UPGRADE", 2];
missionNamespace setVariable ["WFBE_C_PLAYERS_GEAR_SELL_COEF", 0.5]; //--- Sell price of the gear: item price * x (800 * 0.5 = 400)
missionNamespace setVariable ["WFBE_C_PLAYERS_GEAR_VEHICLE_RANGE", 50]; //--- Possible to buy gear in vehicle if that one is within that range.
missionNamespace setVariable ["WFBE_C_PLAYERS_HALO_HEIGHT", 200]; //--- Distance above which units are able to perform an HALO jump.
missionNamespace setVariable ["WFBE_C_PLAYERS_MARKER_DEAD_DELAY", 60]; //--- Time that a marker remain on a dead unit.
missionNamespace setVariable ["WFBE_C_PLAYERS_MARKER_TOWN_RANGE", 0.8]; //--- A town marker is updated (SV) on map if a unit is within the range (town range * coef).
missionNamespace setVariable ["WFBE_C_PLAYERS_OFFMAP_TIMEOUT", 30]; //--- Player may remain x second outside of the map before being killed.
missionNamespace setVariable ["WFBE_C_PLAYERS_PENALTY_TEAMKILL", 500]; //--- Teamkill penalty.
missionNamespace setVariable ["WFBE_C_PLAYERS_SCORE_CAPTURE", 10];
missionNamespace setVariable ["WFBE_C_PLAYERS_SCORE_CAPTURE_ASSIST", 5];
missionNamespace setVariable ["WFBE_C_PLAYERS_SCORE_CAPTURE_CAMP", 2];
missionNamespace setVariable ["WFBE_C_PLAYERS_SCORE_DELIVERY", 3];
missionNamespace setVariable ["WFBE_C_PLAYERS_SKILL_SOLDIER_UNITS_MAX", 6]; //--- Skill (Soldiers), have more units than the others.
missionNamespace setVariable ["WFBE_C_PLAYERS_SQUADS_MAX_PLAYERS", 4]; //--- One player squad may contain up to x players.
missionNamespace setVariable ["WFBE_C_PLAYERS_SQUADS_REQUEST_TIMEOUT", 100]; //--- Time delay after which an unanswered request "fades".
missionNamespace setVariable ["WFBE_C_PLAYERS_SQUADS_REQUEST_DELAY", 120]; //--- Time delay between each potential squad hops.
// missionNamespace setVariable ["WFBE_C_PLAYERS_SQUADS_REQUEST_DELAY", 10]; //--- Time delay between each potential squad hops.
missionNamespace setVariable ["WFBE_C_PLAYERS_SUPPLY_TRUCKS_DELIVERY_RANGE", 30]; //--- Supply Trucks (Clients) delivery range.
missionNamespace setVariable ["WFBE_C_PLAYERS_SUPPLY_TRUCKS_DELIVERY_FUNDS_COEF", 4]; //--- Funds awarded to a client for a delivery (SV * coef).
missionNamespace setVariable ["WFBE_C_PLAYERS_SUPPORT_PARATROOPERS_DELAY", 1200]; //--- Paratroopers Call Interval.
missionNamespace setVariable ["WFBE_C_PLAYERS_UAV_SPOTTING_DELAY", 20]; //--- Interval between each uav spotting routine.
missionNamespace setVariable ["WFBE_C_PLAYERS_UAV_SPOTTING_DETECTION", 0.21]; //--- UAV will reveal each targets that it knows about this value (0-4)
missionNamespace setVariable ["WFBE_C_PLAYERS_UAV_SPOTTING_RANGE", 1100]; //--- Max Range of the UAV spotting.

//--- Respawn.
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_MODE"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_CAMPS_MODE", 2]}; //--- Respawn Camps (0: Disabled, 1: Classic [from town center], 2: Enhanced [from nearby camps]).
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_RANGE"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_CAMPS_RANGE", 550]}; //--- How far a player need to be from a town to spawn at camps.
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_CAMPS_RULE_MODE"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_CAMPS_RULE_MODE", 2]}; //--- Respawn Camps Rule (0: Disabled, 1: West | East, 2: West | East | Resistance).
missionNamespace setVariable ["WFBE_C_RESPAWN_CAMPS_SAFE_RADIUS", 50];
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_DELAY"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_DELAY", 10]}; //--- Respawn Delay (Players/AI).
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_LEADER"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_LEADER", 2]}; //--- Allow leader respawn (0: Disabled, 1: Enabled, 2: Enabled but default gear).
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_MASH"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_MASH", 2]}; //--- Allow mash respawn (0: Disabled, 1: Enabled, 2: Enabled but default gear).
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_MOBILE"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_MOBILE", 2]}; //--- Allow mobile respawn (0: Disabled, 1: Enabled, 2: Enabled but default gear).
if (isNil {missionNamespace getVariable "WFBE_C_RESPAWN_PENALTY"}) then {missionNamespace setVariable ["WFBE_C_RESPAWN_PENALTY", 4]}; //--- Respawn Penalty (0: None, 1: Remove All, 2: Pay full gear price, 3: Pay 1/2 gear price, 4: pay 1/4 gear price, 5: Charge on Mobile).
missionNamespace setVariable ["WFBE_C_RESPAWN_RANGE_LEADER", 50];
missionNamespace setVariable ["WFBE_C_RESPAWN_RANGES", [200, 300, 400, 500]];

//--- Structures.
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_ANTIAIRRADAR", 1]};
missionNamespace setVariable ["WFBE_C_STRUCTURES_ANTIAIRRADAR_DETECTION", 100];
missionNamespace setVariable ["WFBE_C_STRUCTURES_BUILDING_DEGRADATION", 1]; //--- Degredation of the building in time during a repair phase (over 100).
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_COLLIDING"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_COLLIDING", 0]};
missionNamespace setVariable ["WFBE_C_STRUCTURES_COMMANDCENTER_RANGE", 50000]; //--- Command Center Range.
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_CONSTRUCTION_MODE", 0]}; //--- Structures construction mode (0: Time, 1: Workers).
missionNamespace setVariable ["WFBE_C_STRUCTURES_DAMAGES_REDUCTION", 6]; //--- Building Damage Reduction (Current damage given / x, 1 = normal).
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_COST_DEPLOY"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_HQ_COST_DEPLOY", 100]}; //--- HQ Deploy / Mobilize Price.
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED", 120]}; //--- HQ Deploy / Mobilize Price.
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX", 3]};
missionNamespace setVariable ["WFBE_C_STRUCTURES_RUINS", if (WF_A2_Vanilla) then {"Land_budova4_ruins"} else {"Land_Mil_Barracks_i_ruins_EP1"}]; //--- Ruins model.
missionNamespace setVariable ["WFBE_C_STRUCTURES_SALE_DELAY", 240]; //--- Building is sold after x seconds.
missionNamespace setVariable ["WFBE_C_STRUCTURES_SALE_PERCENT", 40]; //--- When a structure is sold, x% of supply goes back to the side.
missionNamespace setVariable ["WFBE_C_STRUCTURES_SERVICE_POINT_RANGE", 50];
missionNamespace setVariable ["WFBE_C_STRUCTURES_WORKERS_DISTANCE", 30]; //--- Minimal Distance in order to start building.
missionNamespace setVariable ["WFBE_C_STRUCTURES_WORKERS_MAX", 10]; //--- Maximum Workers per side.
missionNamespace setVariable ["WFBE_C_STRUCTURES_WORKERS_PRICE", 500]; //--- Worker Price
missionNamespace setVariable ["WFBE_C_STRUCTURES_WORKERS_RADIUS", 650]; //--- Maximal Traveling distance.
missionNamespace setVariable ["WFBE_C_STRUCTURES_WORKERS_RATIO", 2]; //--- Build Speed Ratio.
missionNamespace setVariable ["WFBE_C_STRUCTURES_WORKERS_REPAIR", 0.0075]; //--- Health Point fixed during a repair.
if (WF_A2_Vanilla) then {
	missionNamespace setVariable ["WFBE_C_BASE_COIN_DISTANCE_MIN", 8];
	missionNamespace setVariable ["WFBE_C_BASE_COIN_GRADIENT_MAX", 4];
} else {
	missionNamespace setVariable ["WFBE_C_BASE_COIN_DISTANCE_MIN", 24];
	missionNamespace setVariable ["WFBE_C_BASE_COIN_GRADIENT_MAX", 4];
};

//--- Towns.
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_AMOUNT"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_AMOUNT", 3]}; //--- Amount of towns (0: Very small, 1: Small, 2: Medium, 3: Large, 4: Full).
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_BUILD_PROTECTION_RANGE"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_BUILD_PROTECTION_RANGE", 450]}; //--- Prevent construction in towns within that radius.
missionNamespace setVariable ["WFBE_C_TOWNS_CAPTURE_ASSIST", 400];
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_MODE"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_CAPTURE_MODE", 1]}; //--- Town capture mode (0: Normal, 1: Threshold, 2: All Camps).
missionNamespace setVariable ["WFBE_C_TOWNS_CAPTURE_RANGE", 40];
missionNamespace setVariable ["WFBE_C_TOWNS_CAPTURE_RATE", 1];
missionNamespace setVariable ["WFBE_C_TOWNS_CAPTURE_THRESHOLD_RANGE", 50];
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_CONQUEST_MODE"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_CONQUEST_MODE", 0]}; //--- Town Conquest mode (0: None, 1: Territoriality).
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_DEFENDER", 1]}; //--- Town defender Difficulty (0: Disabled, 1: Light, 2: Medium, 3: Hard, 4: Insane).
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_OCCUPATION", 1]}; //--- Town occupation Difficulty (0: Disabled, 1: Light, 2: Medium, 3: Hard, 4: Insane).
missionNamespace setVariable ["WFBE_C_TOWNS_DEFENSE_RANGE", 30];
missionNamespace setVariable ["WFBE_C_TOWNS_DETECTION_RANGE_ACTIVE_COEF", 1]; //--- Town activation range once active (town range * coef)
missionNamespace setVariable ["WFBE_C_TOWNS_DETECTION_RANGE_COEF", 1]; //--- Town activation range while idling (town range * coef)
missionNamespace setVariable ["WFBE_C_TOWNS_DETECTION_RANGE_AIR", 200]; //--- Detect Air if > x
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_GEAR"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_GEAR", 1]}; //--- Buy Gear From (0: None, 1: Camps, 2: Depot, 3: Camps & Depot).
missionNamespace setVariable ["WFBE_C_TOWNS_MORTARS_SCAN", 60]; //--- Scan the area around a target for friends and enemies.
missionNamespace setVariable ["WFBE_C_TOWNS_MORTARS_INTERVAL", 200]; //--- AI Mortars may fire each x seconds.
missionNamespace setVariable ["WFBE_C_TOWNS_MORTARS_PRECOGNITION", 25]; //--- AI Mortars may fire at a target by precognition. This value is a percentage.
missionNamespace setVariable ["WFBE_C_TOWNS_MORTARS_RANGE_MAX", 750]; //--- AI Mortars may not fire at target further than that range (Cannot be higher than artillery core values).
missionNamespace setVariable ["WFBE_C_TOWNS_MORTARS_RANGE_MIN", 125]; //--- AI Mortars may not fire at targets within that range (Cannot be lower than artillery core values).
missionNamespace setVariable ["WFBE_C_TOWNS_MORTARS_SPLASH_RANGE", 60]; //--- AI Mortar firing area of effect.
missionNamespace setVariable ["WFBE_C_TOWNS_PATROL_HOPS", 5]; //--- Amount of Waypoints given to the AI Patrol in towns (Higher is wider).
missionNamespace setVariable ["WFBE_C_TOWNS_PATROL_RANGE", 500];
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_PATROLS"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_PATROLS", 0]}; //--- Enable town to town patrols.
missionNamespace setVariable ["WFBE_C_TOWNS_PURCHASE_RANGE", 500];
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_REINFORCEMENT_DEFENDER"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_REINFORCEMENT_DEFENDER", 0]}; //--- Enable towns defender reinforcement.
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_REINFORCEMENT_OCCUPATION"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_REINFORCEMENT_OCCUPATION", 0]}; //--- Enable towns occupation reinforcement.
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_STARTING_MODE"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_STARTING_MODE", 0]}; //--- Town starting mode (0: Resistance, 1: 50% blu, 50% red, 2: Nearby Towns, 3: Random).
missionNamespace setVariable ["WFBE_C_TOWNS_SUPPLY_LEVELS_TIME", [1, 2, 3, 4, 5]];
missionNamespace setVariable ["WFBE_C_TOWNS_SUPPLY_LEVELS_TRUCK", [5, 6, 7, 8, 10]];
missionNamespace setVariable ["WFBE_C_TOWNS_UNITS_INACTIVE", 300]; //--- Remove units in town if no enemies are to be found within that time.
missionNamespace setVariable ["WFBE_C_TOWNS_UNITS_WAYPOINTS", 9];
if (isNil {missionNamespace getVariable "WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER"}) then {missionNamespace setVariable ["WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER", 1]}; //--- Lock the vehicles of the defender side.

//--- Units.
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_BALANCING"}) then {missionNamespace setVariable ["WFBE_C_UNITS_BALANCING", 1]}; //--- Enable Units weaponry balancing.
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_BOUNTY"}) then {missionNamespace setVariable ["WFBE_C_UNITS_BOUNTY", 1]}; //--- Enable Units bounty on kill.
missionNamespace setVariable ["WFBE_C_UNITS_BOUNTY_COEF", 0.25]; //--- Bounty is the unit price * coef.
missionNamespace setVariable ["WFBE_C_UNITS_BOUNTY_ASSISTANCE_COEF", 0.5]; //--- Bounty assistance is the unit price * coef * assist coef.
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_CLEAN_TIMEOUT"}) then {missionNamespace setVariable ["WFBE_C_UNITS_CLEAN_TIMEOUT", 300]}; //--- Lifespan of a dead body.
missionNamespace setVariable ["WFBE_C_UNITS_COUNTERMEASURE_PLANES", 64];
missionNamespace setVariable ["WFBE_C_UNITS_COUNTERMEASURE_CHOPPERS", 32];
missionNamespace setVariable ["WFBE_C_UNITS_CREW_COST", 120];
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_EMPTY_TIMEOUT"}) then {missionNamespace setVariable ["WFBE_C_UNITS_EMPTY_TIMEOUT", 1200]}; //--- Lifespan of an empty vehicle.
switch (true) do {
	case (WF_A2_Vanilla): {
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_EAST"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_EAST", 1]}; //--- East Faction.
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_GUER"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_GUER", 0]}; //--- Guerilla Faction.
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_WEST"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_WEST", 1]}; //--- West Faction.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_EAST", ['INS','RU']]; //--- East Factions.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_GUER", ['GUE']]; //--- Guerilla Factions.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_WEST", ['CDF','USMC']]; //--- West Factions.
	};
	case (WF_A2_Arrowhead): {
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_EAST"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_EAST", 0]}; //--- East Faction.
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_GUER"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_GUER", 1]}; //--- Guerilla Faction.
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_WEST"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_WEST", 0]}; //--- West Faction.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_EAST", ['TKA']]; //--- East Factions.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_GUER", ['PMC','TKGUE']]; //--- Guerilla Factions.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_WEST", ['US']]; //--- West Factions.
	};
	case (WF_A2_CombinedOps): {
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_EAST"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_EAST", 1]}; //--- East Faction.
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_GUER"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_GUER", 2]}; //--- Guerilla Faction.
		if (isNil {missionNamespace getVariable "WFBE_C_UNITS_FACTION_WEST"}) then {missionNamespace setVariable ["WFBE_C_UNITS_FACTION_WEST", 1]}; //--- West Faction.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_EAST", ['INS','RU','TKA']]; //--- East Factions.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_GUER", ['GUE','PMC','TKGUE']]; //--- Guerilla Factions.
		missionNamespace setVariable ["WFBE_C_UNITS_FACTIONS_WEST", ['CDF','US','USMC']]; //--- West Factions.
	};
};
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_KAMOV_DISABLED"}) then {missionNamespace setVariable ["WFBE_C_UNITS_KAMOV_DISABLED", 0]}; //--- Enable Kamov.
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_PRICING"}) then {missionNamespace setVariable ["WFBE_C_UNITS_PRICING", 0]}; //--- Price Focus. (0: Default, 1: Infantry, 2: Tanks, 3: Air).
missionNamespace setVariable ["WFBE_C_UNITS_PURCHASE_RANGE", 150];
missionNamespace setVariable ["WFBE_C_UNITS_PURCHASE_GEAR_RANGE", 150];
missionNamespace setVariable ["WFBE_C_UNITS_PURCHASE_GEAR_MOBILE_RANGE", 5];
missionNamespace setVariable ["WFBE_C_UNITS_PURCHASE_GEAR_MOBILE_AI_RANGE", 45];
missionNamespace setVariable ["WFBE_C_UNITS_PURCHASE_HANGAR_RANGE", 50];
missionNamespace setVariable ["WFBE_C_UNITS_REPAIR_TRUCK_RANGE", 40];
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR"}) then {missionNamespace setVariable ["WFBE_C_UNITS_RESTRICT_AIR", 0]}; //--- Advanced Aircraft restriction.
missionNamespace setVariable ["WFBE_C_UNITS_SALVAGER_SCAVENGE_RANGE", 20];
missionNamespace setVariable ["WFBE_C_UNITS_SALVAGER_SCAVENGE_RATIO", 30]; //--- Salvager Sell %.
missionNamespace setVariable ["WFBE_C_UNITS_SKILL_DEFAULT", 0.7];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_RANGE", 70]; //--- Action range for repair/rearm/refuel.
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_HEAL_PRICE", 125];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_HEAL_TIME", 25];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_REARM_PRICE", 14];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_REARM_TIME", 30];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_REFUEL_PRICE", 16];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_REFUEL_TIME", 20];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_REPAIR_PRICE", 2];
missionNamespace setVariable ["WFBE_C_UNITS_SUPPORT_REPAIR_TIME", 40];
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE"}) then {missionNamespace setVariable ["WFBE_C_UNITS_TOWN_PURCHASE", 1]}; //--- Allow AIs to be bought from depots.
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_TRACK_INFANTRY"}) then {missionNamespace setVariable ["WFBE_C_UNITS_TRACK_INFANTRY", 1]}; //--- Track units on map (infantry).
if (isNil {missionNamespace getVariable "WFBE_C_UNITS_TRACK_LEADERS"}) then {missionNamespace setVariable ["WFBE_C_UNITS_TRACK_LEADERS", 1]}; //--- Track playable Team Leaders on map (infantry).

//--- Victory.
missionNamespace setVariable ["WFBE_C_VICTORY_THREEWAY", 0]; //--- Victory Condition (0: Side a vs Side b [supremacy] minus defender).
missionNamespace setVariable ["WFBE_C_VICTORY_THREEWAY_LOCATION_SWAP", 300]; //--- When the defender loose depending on victory conditions, startup locations become available for respawn with a rotation (to prevent spawn camping).

//--- Overall mission coloration.
missionNamespace setVariable ["WFBE_C_WEST_COLOR", "ColorBlue"];
missionNamespace setVariable ["WFBE_C_EAST_COLOR", "ColorRed"];
missionNamespace setVariable ["WFBE_C_GUER_COLOR", "ColorGreen"];
missionNamespace setVariable ["WFBE_C_CIV_COLOR", "ColorYellow"];
missionNamespace setVariable ["WFBE_C_UNKNOWN_COLOR", "ColorBlack"];


//---- THOSE VARIABLES ARE SPECIAL, THOSE ARE ONLY USED AFTER THAT THE PREVIOUS ARE DEFINED.

//--- Build area (Radius/Height).
missionNamespace setVariable ["WFBE_C_BASE_COIN_AREA_HQ_DEPLOYED", [missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED", 25]];
missionNamespace setVariable ["WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED", [(missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED") / 2, 25]];
missionNamespace setVariable ["WFBE_C_BASE_COIN_AREA_REPAIR", [45, 10]];

//--- Pick a fast time rate.
if ((missionNamespace getVariable "WFBE_C_ENVIRONMENT_FAST_TIME") != 0) then {missionNamespace setVariable ["WFBE_C_ENVIRONMENT_FAST_TIME", (missionNamespace getVariable "WFBE_C_ENVIRONMENT_FAST_TIME_VALUES") select (missionNamespace getVariable "WFBE_C_ENVIRONMENT_FAST_TIME")]};

//--- Max structures.
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX_BARRACKS"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX_BARRACKS", missionNamespace getVariable "WFBE_C_STRUCTURES_MAX"]};
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX_LIGHT"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX_LIGHT", missionNamespace getVariable "WFBE_C_STRUCTURES_MAX"]};
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX_COMMANDCENTER"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX_COMMANDCENTER", missionNamespace getVariable "WFBE_C_STRUCTURES_MAX"]};
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX_HEAVY"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX_HEAVY", missionNamespace getVariable "WFBE_C_STRUCTURES_MAX"]};
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX_AIRCRAFT"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX_AIRCRAFT", missionNamespace getVariable "WFBE_C_STRUCTURES_MAX"]};
if (isNil {missionNamespace getVariable "WFBE_C_STRUCTURES_MAX_SERVICEPOINT"}) then {missionNamespace setVariable ["WFBE_C_STRUCTURES_MAX_SERVICEPOINT", (missionNamespace getVariable "WFBE_C_STRUCTURES_MAX")*2]};

//--- Apply a towns unit coeficient.
missionNamespace setVariable ["WFBE_C_TOWNS_UNITS_COEF", switch (missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION") do {case 1: {1}; case 2: {1.5}; case 3: {2}; case 4: {2.5}; default {1}}];
missionNamespace setVariable ["WFBE_C_TOWNS_UNITS_DEFENDER_COEF", switch (missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER") do {case 1: {1}; case 2: {1.5}; case 3: {2}; case 4: {2.5}; default {1}}];

["INITIALIZATION", "Init_CommonConstants.sqf: Constants are defined."] Call WFBE_CO_FNC_LogContent;