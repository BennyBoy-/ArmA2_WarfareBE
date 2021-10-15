/* Parameters */

class Params {
	class WFBE_C_AI_DELEGATION {
		title = "$STR_WF_PARAMETER_AI_Delegation";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled", "$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_AI_MAX {
		title = "$STR_WF_PARAMETER_GroupSizeAI";
		values[] = {2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,35,40,45,50,60,70,80,90,100};
		texts[] = {"2","4","6","8","10","12","14","16","18","20","22","24","26","28","30","35","40","45","50","60","70","80","90","100"};
		default = 10;
	};
	class WFBE_C_PLAYERS_AI_MAX {
		title = "$STR_WF_PARAMETER_GroupSizePlayer";
		values[] = {2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,35,40,45,50,60,70,80,90,100};
		texts[] = {"2","4","6","8","10","12","14","16","18","20","22","24","26","28","30","35","40","45","50","60","70","80","90","100"};
		default = 12;
	};
	class WFBE_C_AI_TEAMS_JIP_PRESERVE {
		title = "$STR_WF_PARAMETER_KeepAI";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_No","$STR_WF_PARAMETER_Yes"};//{"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_AI_TEAMS_ENABLED {
		title = "$STR_WF_PARAMETER_AI";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_ARTILLERY {
		title = "$STR_WF_PARAMETER_Arty";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Long","$STR_WF_PARAMETER_Medium","$STR_WF_PARAMETER_Short"};
		default = 3;
	};
	#ifndef VANILLA
		class WFBE_C_ARTILLERY_COMPUTER {
			title = "$STR_WF_PARAMETER_ArtilleryComputer";
			values[] = {0,1,2};
			texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Enabled_Upgrade","$STR_WF_Enabled"};
			default = 0;
		};	
	#endif
	class WFBE_C_ARTILLERY_UI {
		title = "$STR_WF_PARAMETER_ArtilleryUI";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_AI_COMMANDER_ENABLED {
		title = "$STR_WF_PARAMETER_AICommander";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_No","$STR_WF_PARAMETER_Yes"};//{"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	//--- OA has no suitable allies for both side (yet).
	#ifndef ARROWHEAD
		class WFBE_C_BASE_ALLIES {
			title = "$STR_WF_PARAMETER_Allies";
			values[] = {0,1,2,3};
			texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Side_West","$STR_WF_PARAMETER_Side_East","$STR_WF_PARAMETER_Both"};
			default = 0;
		};
	#endif
	class WFBE_C_STRUCTURES_ANTIAIRRADAR {
		title = "$STR_WF_PARAMETER_AntiAirRadar";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_BASE_AREA {
		title = "$STR_WF_PARAMETER_BaseArea";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,12,14,16,18,20,22,24};
		texts[] = {"$STR_WF_Disabled","1","2","3","4","5","6","7","8","9","10","12","14","16","18","20","22","24"};
		default = 2;
	};
	class WFBE_C_BASE_DEFENSE_MAX_AI {
		title = "$STR_WF_PARAMETER_AutoMannedDefense";
		values[] = {0,10,20,30,40,50,60,70,80,90,100};
		texts[] = {"$STR_WF_Disabled","10","20","30","40","50","60","70","80","90","100"};
		default = 30;
	};
	class WFBE_C_BASE_DEFENSE_MANNING_RANGE {
		title = "$STR_WF_PARAMETER_AutoDefense_Range";
		values[] = {50,100,150,200,250,300,350,400,450,500,600,700,800,900,1000};
		texts[] = {"50m","100m","150m","200m","250m","300m","350m","400m","450m","500m","600m","700m","800m","900m","1000m"};
		default = 250;
	};
	class WFBE_C_STRUCTURES_MAX {
		title = "$STR_WF_PARAMETER_BuildingsLimit";
		values[] = {1,2,3,4,5,6,7,8,9,10};
		texts[] = {"1","2","3","4","5","6","7","8","9","10"};
		default = 2;
	};
	class WFBE_C_STRUCTURES_CONSTRUCTION_MODE {
		title = "$STR_WF_PARAMETER_ConstructionMode";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_Time","$STR_WF_PARAMETER_HQWorkers"};
		default = 0;
	};
	class WFBE_C_STRUCTURES_HQ_COST_DEPLOY {
		title = "$STR_WF_PARAMETER_HQDeployCost";
		values[] = {100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000,3500,4000,5000,6000,7000,8000,9000,10000};
		texts[] = {"S 100","S 200","S 300","S 400","S 500","S 600","S 700","S 800","S 900","S 1000","S 1500","S 2000","S 2500","S 3000","S 3500","S 4000","S 5000","S 6000","S 7000","S 8000","S 9000","S 10000"};
		default = 100;
	};
	class WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED {
		title = "$STR_WF_PARAMETER_HQDeployRange";
		values[] = {50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,220,240,260,280,300,320,340,360,380,400};
		texts[] = {"50m","60m","70m","80m","90m","100m","110m","120m","130m","140m","150m","160m","170m","180m","190m","200m","220m","240m","260m","280m","300m","320m","340m","360m","380m","400m"};
		default = 120;
	};
	class WFBE_C_BASE_PATROLS_INFANTRY {
		title = "$STR_WF_PARAMETER_BasePatrols_Infantry";
		values[] = {0,1,2,3,4};
		texts[] = {"$STR_WF_Disabled","1","2","3","4"};
		default = 0;
	};
	class WFBE_C_BASE_START_TOWN {
		title = "$STR_WF_PARAMETER_SpawnSystemRestrict";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_No","$STR_WF_PARAMETER_Yes"};//{"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_BASE_STARTING_DISTANCE {
		title = "$STR_WF_PARAMETER_StartingDistance";
		values[] = {-1,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000};
		texts[] = {"$STR_WF_PARAMETER_StartingLocations_Random","1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m","5500m","6000m","6500m","7000m","7500m","8000m","8500m","9000m"};
		default = 5500;
	};
	class WFBE_C_BASE_STARTING_MODE {
		title = "$STR_WF_PARAMETER_StartingLocations";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_PARAMETER_StartingLocations_WestNorth","$STR_WF_PARAMETER_StartingLocations_WestSouth","$STR_WF_PARAMETER_StartingLocations_Random"};
		default = 2;
	};
	class WFBE_C_STRUCTURES_COLLIDING {
		title = "$STR_WF_PARAMETER_StructurePlacement";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_Collide_Strict","$STR_WF_PARAMETER_Collide_Smooth"};
		default = 0;
	};
	class WFBE_C_ECONOMY_CURRENCY_SYSTEM {
		title = "$STR_WF_PARAMETER_Currency";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_Money_Supply","$STR_WF_PARAMETER_Money"};
		default = 0;
	};
	class WFBE_C_ECONOMY_INCOME_INTERVAL {
		title = "$STR_WF_PARAMETER_IncomeInterval";
		values[] = {60,75,90,105,120,150,180,240,300,360,420,480,540,600};
		texts[] = {"1 Minute","1 Minute 15 Seconds","1 Minute 30 Seconds","1 Minute 45 Seconds","2 Minutes","2 Minutes 30 Seconds","3 Minutes","4 Minutes","5 Minutes","6 Minutes","7 Minutes","8 Minutes","9 Minutes","10 Minutes"};
		default = 75;
	};
	class WFBE_C_ECONOMY_INCOME_SYSTEM {
		title = "$STR_WF_PARAMETER_IncomeSystem";
		values[] = {1,2,3,4};
		texts[] = {"$STR_WF_PARAMETER_IncomeSystem_Full","$STR_WF_PARAMETER_IncomeSystem_Half","$STR_WF_PARAMETER_Income_Sys_Param","$STR_WF_PARAMETER_Income_Sys_Param_Full"};
		default = 4;
	};
	class WFBE_C_ECONOMY_FUNDS_START_EAST {
		title = "$STR_WF_PARAMETER_Funds_East";
		values[] = {800,1600,2400,3200,4000,4800,6400,8000,12800,25600,51200,102400,204800,409600,819200};
		texts[] = {"$ 800","$ 1600","$ 2400","$ 3200","$ 4000","$ 4800","$ 6400","$ 8000","$ 12800","$ 25600","$ 51200","$ 102400","$ 204800","$ 409600","$ 819200"};
		default = 800;
	};
	class WFBE_C_ECONOMY_FUNDS_START_WEST {
		title = "$STR_WF_PARAMETER_Funds_West";
		values[] = {800,1600,2400,3200,4000,4800,6400,8000,12800,25600,51200,102400,204800,409600,819200};
		texts[] = {"$ 800","$ 1600","$ 2400","$ 3200","$ 4000","$ 4800","$ 6400","$ 8000","$ 12800","$ 25600","$ 51200","$ 102400","$ 204800","$ 409600","$ 819200"};
		default = 800;
	};
	class WFBE_C_ECONOMY_FUNDS_START_GUER {
		title = "$STR_WF_PARAMETER_Funds_Guer";
		values[] = {800,1600,2400,3200,4000,4800,6400,8000,12800,25600,51200,102400,204800,409600,819200};
		texts[] = {"$ 800","$ 1600","$ 2400","$ 3200","$ 4000","$ 4800","$ 6400","$ 8000","$ 12800","$ 25600","$ 51200","$ 102400","$ 204800","$ 409600","$ 819200"};
		default = 800;
	};
	class WFBE_C_ECONOMY_SUPPLY_START_EAST {
		title = "$STR_WF_PARAMETER_Supply_East";
		values[] = {1200,2400,3600,4800,6000,7200,8400,9600,19200,38400,76800};
		texts[] = {"S 1200","S 2400","S 3600","S 4800","S 6000","S 7200","S 8400","S 9600","S 19200","S 38400","S 76800"};
		default = 1200;
	};
	class WFBE_C_ECONOMY_SUPPLY_START_WEST {
		title = "$STR_WF_PARAMETER_Supply_West";
		values[] = {1200,2400,3600,4800,6000,7200,8400,9600,19200,38400,76800};
		texts[] = {"S 1200","S 2400","S 3600","S 4800","S 6000","S 7200","S 8400","S 9600","S 19200","S 38400","S 76800"};
		default = 1200;
	};
	class WFBE_C_ECONOMY_SUPPLY_START_GUER {
		title = "$STR_WF_PARAMETER_Supply_Guer";
		values[] = {1200,2400,3600,4800,6000,7200,8400,9600,19200,38400,76800};
		texts[] = {"S 1200","S 2400","S 3600","S 4800","S 6000","S 7200","S 8400","S 9600","S 19200","S 38400","S 76800"};
		default = 1200;
	};
	class WFBE_C_ECONOMY_SUPPLY_SYSTEM {
		title = "$STR_WF_PARAMETER_SupplySystem";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_SupplySystem_Truck","$STR_WF_PARAMETER_Time"};
		default = 1;
	};
	class WFBE_C_ENVIRONMENT_FAST_TIME {
		title = "$STR_WF_PARAMETER_FastTime";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13};
		texts[] = {"$STR_WF_Disabled","24H = 10H","24H = 9H30","24H = 9H","24H = 8H30","24H = 8H","24H = 7H30","24H = 7H","24H = 6H30", 
		"24H = 6H","24H = 5H30","24H = 5H","24H = 4H30","24H = 4H"};
		default = 0;
	};
	class WFBE_C_ENVIRONMENT_STARTING_HOUR {
		title = "$STR_WF_PARAMETER_Hour";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		texts[] = {"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00",
		"12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
		default = 9;
	};
	class WFBE_C_ENVIRONMENT_STARTING_MONTH {
		title = "$STR_WF_PARAMETER_Month";
		values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
		texts[] = {"January","February","March","April","May","June","July","August","September","October","November","December"};
		default = 6;
	};
	class WFBE_C_ENVIRONMENT_WEATHER_VOLUMETRIC {
		title = "$STR_WF_PARAMETER_Clouds";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_ENVIRONMENT_WEATHER {
		title = "$STR_WF_PARAMETER_Weather";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_PARAMETER_Weather_Clear","$STR_WF_PARAMETER_Weather_Cloudy","$STR_WF_PARAMETER_Weather_Rainy","$STR_WF_PARAMETER_Weather_Dynamic"};
		default = 0;
	};
	#ifndef VANILLA
		class WFBE_C_MODULE_BIS_BAF {
			title = "$STR_WF_PARAMETER_BAF";
			values[] = {0,1};
			texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
			default = 1;
		};
		class WFBE_C_MODULE_BIS_PMC {
			title = "$STR_WF_PARAMETER_PMC";
			values[] = {0,1};
			texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
			default = 1;
		};
	#endif
	class WFBE_C_GAMEPLAY_HANGARS_ENABLED {
		title = "$STR_WF_PARAMETER_Hangars";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_UNITS_CLEAN_TIMEOUT {
		title = "$STR_WF_PARAMETER_BodiesTimeout";
		values[] = {60,120,180,240,300,600,1200,1800,2400,3000,3600};
		texts[] = {"1 Minute","2 Minutes","3 Minutes","4 Minutes","5 Minutes","10 Minutes","20 Minutes","30 Minutes","40 Minutes","50 Minutes","1 Hour"};
		default = 240;
	};
	class WFBE_C_UNITS_EMPTY_TIMEOUT {
		title = "$STR_WF_PARAMETER_VehicleDelay";
		values[] = {60,120,180,240,300,600,1200,1800,2400,3000,3600};
		texts[] = {"1 Minute","2 Minutes","3 Minutes","4 Minutes","5 Minutes","10 Minutes","20 Minutes","30 Minutes","40 Minutes","50 Minutes","1 Hour"};
		default = 1200;
	};
	class WFBE_C_GAMEPLAY_FAST_TRAVEL {
		title = "$STR_WF_PARAMETER_FastTravel";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Free","$STR_WF_PARAMETER_Fee"};
		default = 0;
	};
	class WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE {
		title = "$STR_WF_PARAMETER_FriendlyFire";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_ENVIRONMENT_MAX_CLUTTER {
		title = "$STR_WF_PARAMETER_Grass";
		values[] = {10,20,30,50};
		texts[] = {"Far","Medium","Short","Toggleable"};
		default = 50;
	};
	class WFBE_C_GAMEPLAY_TEAMSWAP_DISABLE {
		title = "$STR_WF_PARAMETER_KickTeamswapper";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED {
		title = "$STR_WF_PARAMETER_LimitedBoundaries";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_GAMEPLAY_MISSILES_RANGE {
		title = "$STR_WF_PARAMETER_MissileRange";
		values[] = {0,500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000,9500,10000};
		texts[] = {"$STR_WF_Disabled","500m","1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m","5500m","6000m","6500m","7000m","7500m","8000m","8500m","9000m","9500m","10000m"};
		default = 0;
	};
	class WFBE_C_MODULE_WFBE_MISSIONS {
		title = "$STR_WF_PARAMETER_SecondaryMissions";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_GAMEPLAY_UID_SHOW {
		title = "$STR_WF_PARAMETER_ShowUID";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_UNITS_PRICING {
		title = "$STR_WF_PARAMETER_Specialization";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_PARAMETER_None","$STR_WF_PARAMETER_Infantry","$STR_WF_PARAMETER_LandVehicles","$STR_WF_PARAMETER_Aircraft"};
		default = 0;
	};
	class WFBE_C_GAMEPLAY_THERMAL_IMAGING {
		title = "$STR_WF_PARAMETER_ThermalImaging";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Weapons","$STR_WF_PARAMETER_Vehicles","$STR_WF_Enabled"};
		default = 3;
	};
	class WFBE_C_UNITS_TRACK_INFANTRY {
		title = "$STR_WF_PARAMETER_TrackAI";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_UNITS_TRACK_LEADERS {
		title = "$STR_WF_PARAMETER_TrackPlayers";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_UNITS_BALANCING {
		title = "$STR_WF_PARAMETER_Balance";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_UNITS_BOUNTY {
		title = "$STR_WF_PARAMETER_UnitsBounty";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE {
		title = "$STR_WF_PARAMETER_Upgrades";
		values[] = {0,1,2,3,4,5,6,7};
		texts[] = {"$STR_WF_Disabled","West","East","Resistance","West + East","West + Resistance","East + Resistance","All"};
		default = 0;
	};
	class WFBE_C_GAMEPLAY_VICTORY_CONDITION {
		title = "$STR_WF_PARAMETER_VictoryCondition";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_PARAMETER_Victory_Annihilation","$STR_WF_PARAMETER_Victory_Assassination","$STR_WF_PARAMETER_Victory_Supremacy","$STR_WF_PARAMETER_Victory_Towns"};
		default = 2;
	};
	class WFBE_C_ENVIRONMENT_MAX_VIEW {
		title = "$STR_WF_PARAMETER_ViewDistance";
		values[] = {200,500,800,1000,1500,2000,2500,3000,3500,4000,4500,5000};
		texts[] = {"200m","500m","800m","1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m"};
		default = 4000;
	};
	class WFBE_C_MODULE_WFBE_FLARES {
		title = "$STR_WF_PARAMETER_Countermeasures";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Enabled_Upgrade","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_MODULE_WFBE_EASA {
		title = "$STR_WF_PARAMETER_EASA";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_MODULE_BIS_HC {
		title = "$STR_WF_PARAMETER_HighCommand";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_MODULE_WFBE_ICBM {
		title = "$STR_WF_PARAMETER_ICBM";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};	
	class WFBE_C_MODULE_WFBE_IRS {
		title = "$STR_WF_PARAMETER_IRS";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_MODULE_UPSMON {
		title = "$STR_WF_PARAMETER_UPSMON";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_RESPAWN_CAMPS_MODE {
		title = "$STR_WF_PARAMETER_Camp";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Classic","$STR_WF_PARAMETER_Respawn_CampsNearby","$STR_WF_PARAMETER_Respawn_Defender"};
		default = 2;
	};
	class WFBE_C_RESPAWN_CAMPS_RULE_MODE {
		title = "$STR_WF_PARAMETER_CampRespawnRule";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Respawn_CampsRule_WestEast","$STR_WF_PARAMETER_Respawn_CampsRule_WestEastRes"};
		default = 2;
	};
	class WFBE_C_RESPAWN_DELAY {
		title = "$STR_WF_PARAMETER_Respawn";
		values[] = {10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90};
		texts[] = {"10 Seconds","15 Seconds","20 Seconds","25 Seconds","30 Seconds","35 Seconds","40 Seconds","45 Seconds","50 Seconds",
		"55 Seconds","60 Seconds","65 Seconds","70 Seconds","75 Seconds","80 Seconds","85 Seconds","90 Seconds"};
		default = 30;
	};
	class WFBE_C_RESPAWN_LEADER {
		title = "$STR_WF_PARAMETER_LeaderRespawn";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled","$STR_WF_Enabled_DefaultGear"};
		default = 2;
	};
	class WFBE_C_RESPAWN_MASH {
		title = "$STR_WF_PARAMETER_Respawn_MASH";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled","$STR_WF_Enabled_DefaultGear"};
		default = 2;
	};
	class WFBE_C_RESPAWN_MOBILE {
		title = "$STR_WF_PARAMETER_MobileRespawn";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled","$STR_WF_Enabled_DefaultGear"};
		default = 2;
	};
	class WFBE_C_RESPAWN_PENALTY {
		title = "$STR_WF_PARAMETER_Respawn_Penalty";
		values[] = {0,1,2,3,4,5};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Respawn_Penalty_Remove","$STR_WF_PARAMETER_Respawn_Penalty_Full","$STR_WF_PARAMETER_Respawn_Penalty_OneHalf","$STR_WF_PARAMETER_Respawn_Penalty_OneFourth","$STR_WF_PARAMETER_Respawn_Penalty_Mobile"};
		default = 5;
	};
	class WFBE_C_RESPAWN_CAMPS_RANGE {
		title = "$STR_WF_PARAMETER_TownRespawnRange";
		values[] = {50,100,150,200,250,300,350,400,450,500,550,600,650,700,750,800,850,900,950,1000,1500,2000,2500,3000,3500,4000};
		texts[] = {"50m","100m","150m","200m","250m","300m","350m","400m","450m","500m","550m","600m","650m","700m","750m","800m","850m","900m","950m","1000m","1500m","2000m","2500m","3000m","3500m","4000m"};
		default = 400;
	};
	class WFBE_C_UNITS_RESTRICT_AIR {
		title = "$STR_WF_PARAMETER_AdvancedAir";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Restriction_Air_H","$STR_WF_PARAMETER_Restriction_Air_HTransport"};
		default = 0;
	};
	#ifndef ARROWHEAD
		class WFBE_C_UNITS_KAMOV_DISABLED {
			title = "$STR_WF_PARAMETER_Kamov";
			values[] = {0,1};
			texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
			default = 0;
		};
	#endif
	class WFBE_C_TOWNS_AMOUNT {
		title = "$STR_WF_PARAMETER_TownsAmount";
		values[] = {0,1,2,3,4};
		texts[] = {"$STR_WF_PARAMETER_Extra_Small","$STR_WF_PARAMETER_Small","$STR_WF_PARAMETER_Medium","$STR_WF_PARAMETER_Large","$STR_WF_PARAMETER_Full"};
		default = 3;
	};
	class WFBE_C_CAMPS_CREATE {
		title = "$STR_WF_PARAMETER_TownsCamps";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 1;
	};
	class WFBE_C_TOWNS_CAPTURE_MODE {
		title = "$STR_WF_PARAMETER_TownsCaptureMode";
		values[] = {0,1,2};
		texts[] = {"$STR_WF_PARAMETER_Classic","$STR_WF_PARAMETER_TownsCaptureMode_Threshold","$STR_WF_PARAMETER_TownsCaptureMode_AllCamps"};
		default = 1;
	};
	class WFBE_C_TOWNS_CONQUEST_MODE {
		title = "$STR_WF_PARAMETER_TownsConquestMode";
		values[] = {0,1};
		texts[] = {"$STR_WF_PARAMETER_Classic","$STR_WF_PARAMETER_Territorial"};
		default = 0;
	};
	class WFBE_C_TOWNS_DEFENDER {
		title = "$STR_WF_PARAMETER_Defender";
		values[] = {0,1,2,3,4};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Light","$STR_WF_PARAMETER_Medium","$STR_WF_PARAMETER_Hard","$STR_WF_PARAMETER_Impossible"};
		default = 1;
	};
	class WFBE_C_TOWNS_GEAR {
		title = "$STR_WF_PARAMETER_TownsGear";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_CampSel","$STR_WF_PARAMETER_Depot","$STR_WF_PARAMETER_CampnDepot"};
		default = 1;
	};
	class WFBE_C_TOWNS_OCCUPATION {
		title = "$STR_WF_PARAMETER_Occupation";
		values[] = {0,1,2,3,4};
		texts[] = {"$STR_WF_Disabled","$STR_WF_PARAMETER_Light","$STR_WF_PARAMETER_Medium","$STR_WF_PARAMETER_Hard","$STR_WF_PARAMETER_Impossible"};
		default = 1;
	};
	#ifdef VANILLA
		class WFBE_C_UNITS_FACTION_EAST {
			title = "$STR_WF_PARAMETER_Occupation_Type_East";
			values[] = {0,1};
			texts[] = {"Insurgents","Russians"};
			default = 1;
		};
	#endif
	#ifdef VANILLA
		class WFBE_C_UNITS_FACTION_WEST {
			title = "$STR_WF_PARAMETER_Occupation_Type_West";
			values[] = {0,1};
			texts[] = {"Chernarussian Defence Force","United States Marine Corps"};
			default = 1;
		};
	#endif
	#ifdef ARROWHEAD
		class WFBE_C_UNITS_FACTION_EAST {
			title = "$STR_WF_PARAMETER_Occupation_Type_East";
			values[] = {0};
			texts[] = {"Takistan Army"};
			default = 0;
		};
	#endif
	#ifdef ARROWHEAD
		class WFBE_C_UNITS_FACTION_WEST {
			title = "$STR_WF_PARAMETER_Occupation_Type_West";
			values[] = {0};
			texts[] = {"United States"};
			default = 0;
		};
	#endif
	#ifdef COMBINEDOPS
		class WFBE_C_UNITS_FACTION_EAST {
			title = "$STR_WF_PARAMETER_Occupation_Type_East";
			values[] = {0,1,2};
			texts[] = {"Insurgents","Russians","Takistan Army"};
			default = 1;
		};
	#endif
	#ifdef COMBINEDOPS
		class WFBE_C_UNITS_FACTION_WEST {
			title = "$STR_WF_PARAMETER_Occupation_Type_West";
			values[] = {0,1,2};
			texts[] = {"Chernarussian Defence Force","United States","United States Marine Corps"};
			default = 1;
		};
	#endif
	class WFBE_C_TOWNS_REINFORCEMENT_OCCUPATION {
		title = "$STR_WF_PARAMETER_Reinforcement_Occupation";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_TOWNS_PATROLS {
		title = "$STR_WF_PARAMETER_MaxResPatrols";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,24,26,28,30,32,34,36,38,40,50,60,70,80,90,100};
		texts[] = {"$STR_WF_Disabled","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","22","24","26","28","30","32","34","36","38","40","50","60","70","80","90","100"};
		default = 0;
	};
	class WFBE_C_TOWNS_BUILD_PROTECTION_RANGE {
		title = "$STR_WF_PARAMETER_TownProtectionRange";
		values[] = {0,50,100,150,200,250,300,350,400,450,500};
		texts[] = {"0m","50m","100m","150m","200m","250m","300m","350m","400m","450m","500m"};
		default = 400;
	};
	class WFBE_C_UNITS_TOWN_PURCHASE {
		title = "$STR_WF_PARAMETER_TownsPurchaseMilita";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	#ifdef VANILLA
		class WFBE_C_UNITS_FACTION_GUER {
			title = "$STR_WF_PARAMETER_Reinforcement_Type";
			values[] = {0};
			texts[] = {"Guerillas"};
			default = 0;
		};
	#endif
	#ifdef ARROWHEAD
		class WFBE_C_UNITS_FACTION_GUER {
			title = "$STR_WF_PARAMETER_Reinforcement_Type";
			values[] = {0,1};
			texts[] = {"Private Military Company","Takistani Locals"};
			default = 1;
		};
	#endif
	#ifdef COMBINEDOPS
		class WFBE_C_UNITS_FACTION_GUER {
			title = "$STR_WF_PARAMETER_Reinforcement_Type";
			values[] = {0,1,2};
			texts[] = {"Guerillas","Private Military Company","Takistani Locals"};
			default = 2;
		};
	#endif
	class WFBE_C_TOWNS_REINFORCEMENT_DEFENDER {
		title = "$STR_WF_PARAMETER_Reinforcement_Resistance";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER {
		title = "$STR_WF_PARAMETER_Resistance_VehLock";
		values[] = {0,1};
		texts[] = {"$STR_WF_Disabled","$STR_WF_Enabled"};
		default = 0;
	};
	class WFBE_C_TOWNS_STARTING_MODE {
		title = "$STR_WF_PARAMETER_StartingMode";
		values[] = {0,1,2,3};
		texts[] = {"$STR_WF_PARAMETER_None","$STR_WF_PARAMETER_Divided_Towns","$STR_WF_PARAMETER_Nearby_Town","$STR_WF_PARAMETER_StartingLocations_Random"};
		default = 0;
	};
};