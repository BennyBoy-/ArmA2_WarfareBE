/* Titles */

#ifdef VANILLA
	#define usflag "\ca\data\flag_usa_co.paa"
	#define ruflag "\ca\data\flag_rus_co.paa"
#endif

#ifdef ARROWHEAD
	#define usflag "\ca\ca_e\data\flag_us_co.paa"
	#define ruflag "\ca\ca_e\data\flag_tkg_co.paa"
#endif

#ifdef COMBINEDOPS
	#define usflag "\ca\ca_e\data\flag_us_co.paa"
	#define ruflag "\ca\data\flag_rus_co.paa"
#endif

#ifndef usflag
	#define usflag "\ca\ca_e\data\flag_us_co.paa"
	#define ruflag "\ca\ca_e\data\flag_tkg_co.paa"
#endif

class RscTitles {
	
	titles[] = {CaptureBar,OptionsAvailable,EndOfGameStats};
	
	class CaptureBar {
		idd = 600100;
		duration = 15000;
		name = "Capture Bar";
		onLoad = "uiNamespace setVariable ['wfbe_title_capture', _this select 0]";
		onUnload = "uiNamespace setVariable ['wfbe_title_capture', displayNull]";
		
		class controls {
			class CA_Progress_Bar_Background : RscText {
				style = ST_TEXT_BG;
				idc = 601000;
				x = 0.3;
				y = "((SafeZoneH + SafeZoneY) - (1 + 0.165))*-1";
				w = 0.4;
				h = 0.06;
				colorBackground[] = {0,0,0,0.001};
			};
				
			class CA_Progress_Bar : CA_Progress_Bar_Background {
				idc = 601001;
				x = 0.31;
				y = "((SafeZoneH + SafeZoneY) - (1 + 0.175))*-1";
				w = 0.38;
				h = 0.04;
			};
			
			class CA_Progress_Label : RscText {
				idc = 601002;
				style = ST_CENTER;
				colorText[] = {1,1,1,0.8};
				shadow = 2;
				x = 0.31;
				w = 0.38;
				y = "((SafeZoneH + SafeZoneY) - (1 + 0.177))*-1";
			};
		};
	};
	
	class OptionsAvailable {
		idd = 10200;
		movingEnable = 0;
		objects[] = {};
		duration = 15000;
		name = "OptionsAvailable";
		onLoad = "_this ExecVM ""Client\GUI\GUI_SetCurrentCutDisplay.sqf""";
		onUnload = "_this ExecVM ""Client\GUI\GUI_ClearCurrentCutDisplay.sqf""";
		controls[] = {"OptionsIcon0", "OptionsIcon1", "OptionsIcon2", "OptionsIcon3", "OptionsIcon4", "OptionsIcon5", "OptionsIcon6", "OptionsIcon7", "OptionsIcon8", "OptionsIcon9", "OptionsIcon10",
		"OptionsIcon11", "OptionsIcon12", "OptionsIcon13", "OptionsIcon14", "OptionsIcon15", "OptionsIcon16", "OptionsIcon17"};
		controlsBackground[] = {};

		class OptionsImageAspectRatio : RscPicture {
			w = 0.0784314;
			h = 0.104575;
			style = 0x30+0x800;
		};
			
		class OptionsIcon0 : OptionsImageAspectRatio {
			idc = 3500;
			x = "(SafeZoneW + SafeZoneX) - (0.0392157)";
			y = 0+(0.0522876*17);
			w = 0.0392157;
			h = 0.0522876;
			colorText[] = WFBE_OA_Icon;
			text = "";
		};
			
		class OptionsIcon1 : OptionsIcon0 {
			idc = 3500 + 1;
			y = 0+(0.0522876*16);
		};
		
		class OptionsIcon2 : OptionsIcon0 {
			idc = 3500 + 2;
			y = 0+(0.0522876*15);
		};
		
		class OptionsIcon3 : OptionsIcon0 {
			idc = 3500 + 3;
			y = 0+(0.0522876*14);
		};
		
		class OptionsIcon4 : OptionsIcon0 {
			idc = 3500 + 4;
			y = 0+(0.0522876*13);
		};
		
		class OptionsIcon5 : OptionsIcon0 {
			idc = 3500 + 5;
			y = 0+(0.0522876*12);
		};
		
		class OptionsIcon6 : OptionsIcon0 {
			idc = 3500 + 6;
			y = 0+(0.0522876*11);
		};
		
		class OptionsIcon7 : OptionsIcon0 {
			idc = 3500 + 7;
			y = 0+(0.0522876*10);
		};
		
		class OptionsIcon8 : OptionsIcon0 {
			idc = 3500 + 8;
			y = 0+(0.0522876*9);
		};
		
		class OptionsIcon9 : OptionsIcon0 {
			idc = 3500 + 9;
			y = 0+(0.0522876*8);
		};
		
		class OptionsIcon10 : OptionsIcon0 {
			idc = 3500 + 10;
			y = 0+(0.0522876*7);
		};
		
		class OptionsIcon11 : OptionsIcon0 {
			idc = 3500 + 11;
			y = 0+(0.0522876*6);
		};
		
		class OptionsIcon12 : OptionsIcon0 {
			idc = 3500 + 12;
			y = 0+(0.0522876*5);
		};
		
		class OptionsIcon13 : OptionsIcon0 {
			idc = 3500 + 13;
			y = 0+(0.0522876*4);
		};
		
		class OptionsIcon14 : OptionsIcon0 {
			idc = 3500 + 14;
			y = 0+(0.0522876*3);
		};
		
		class OptionsIcon15 : OptionsIcon0 {
			idc = 3500 + 15;
			y = 0+(0.0522876*2);
		};
		
		class OptionsIcon16 : OptionsIcon0 {
			idc = 3500 + 16;
			y = 0+(0.0522876*1);
		};
		
		class OptionsIcon17 : OptionsIcon0 {
			idc = 3500 + 17;
			y = 0.0522876;
		};
	};
	
	class EndOfGameStats {
		idd = 90000;
		duration = 15000;
		movingEnable = 0;
		objects[] = {};
		name = "EndOfGameStats";

		onLoad = "_this ExecVM ""Client\GUI\GUI_SetCurrentCutDisplay.sqf""";
		onUnload = "_this ExecVM ""Client\GUI\GUI_ClearCurrentCutDisplay.sqf"""; 

		controls[] = {StatsBackGroundHeader,SideWinsText,StatsBackGround,EastImage,WestImage,SoldiersRecruitedLabel,SoldiersLostLabel,VehiclesCreatedLabel,VehiclesLostLabel,
					  EastSoldiersRecruitedBar,EastSoldiersRecruitedCount,WestSoldiersRecruitedBar,WestSoldiersRecruitedCount,
					  EastSoldiersLostBar,EastSoldiersLostCount,WestSoldiersLostBar,WestSoldiersLostCount,
					  EastVehiclesCreatedBar,EastVehiclesCreatedCount,WestVehiclesCreatedBar,WestVehiclesCreatedCount,
					  EastVehiclesLostBar,EastVehiclesLostCount,WestVehiclesLostBar,WestVehiclesLostCount};

		controlsBackground[] = {};
		
		class StatsBackGroundHeader : RscText {
			style = 128;
			idc = 90002;
			x = 0;
			y = 0.06;
			w = 1;
			h = 0.18;
			colorBackground[] = WFBE_EOGS_Background;
		};
		
		class SideWinsText : RscText {
			idc = 90001;
			style = 2;
			sizeEx = 0.05;
			x = 0.211224;
			y = 0.1;
			w = 0.579592;
			h = 0.08;
			colorText[] = {1.0,1.0,1.0,1};
		};
		
		class StatsBackGround : RscText {
			style = 128;
			idc = 90003;
			x = 0;
			y = 0.24;
			w = 1;
			h = 0.62;
			colorBackground[] = WFBE_EOGS_Background;
		};

		class EastImage : RscPicture {
			style = 48 + 0x800;
			x = 0.00612286;
			y = 0.05;
			w = 0.2;
			h = 0.2;
			text = ruflag;
		};
		
		class WestImage:EastImage {
			x = 0.792857;
			text = usflag;
		};

		class SoldiersRecruitedLabel : RscText {
			style = 2;
			sizeEx = 0.03;
			x = 0.05;
			y = 0.25;
			w = 0.9;
			h = 0.04;
			colorText[] = {1.0,1.0,1.0,1};
			text = $STR_WF_END_Soldier_Recruited;
		};

		class SoldiersRecruitedCountBase : RscText {
			idc = 90100;
			style = 0;
			sizeEx = 0.06;
			x = 0.05;
			y = 0.3;
			w = 0.2;
			h = 0.1;
			colorText[] = {1.0,1.0,1.0,1};
		};

		class EastSoldiersRecruitedCount : SoldiersRecruitedCountBase {
			idc = 90101;
		};

		class EastSoldiersRecruitedBar : RscText {
			style = 128;
			idc = 90102;
			x = 0.05;
			y = 0.31;
			w = 0.4;
			h = 0.08;
			colorBackground[] = WFBE_EOGS_SRVBBar;
		};

		class WestSoldiersRecruitedCount : SoldiersRecruitedCountBase {
			idc = 90200;
			x = 0.55;
		};

		class WestSoldiersRecruitedBar : EastSoldiersRecruitedBar {
			idc = 90201;
			x = 0.55;
		};

		class SoldiersLostLabel : SoldiersRecruitedLabel {
			y = 0.4;
			text = $STR_WF_END_Soldier_Lost;
		};

		class EastSoldiersLostCount : SoldiersRecruitedCountBase {
			idc = 90103;
			y = 0.45;
		};

		class EastSoldiersLostBar : EastSoldiersRecruitedBar {
			idc = 90104;
			y = 0.46;
			colorBackground[] = WFBE_EOGS_SLVLBar;
		};

		class WestSoldiersLostCount : SoldiersRecruitedCountBase {
			idc = 90202;
			y = 0.45;
			x = 0.55;
		};

		class WestSoldiersLostBar : EastSoldiersLostBar	{
			idc = 90203;
			x = 0.55;
		};

		class VehiclesCreatedLabel : SoldiersRecruitedLabel {
			y = 0.55;
			text = $STR_WF_END_Vehicle_Built;
		};

		class EastVehiclesCreatedCount : SoldiersRecruitedCountBase	{
			idc = 90105;
			y = 0.6;
		};

		class EastVehiclesCreatedBar : EastSoldiersRecruitedBar	{
			idc = 90106;
			y = 0.61;
			colorBackground[] = WFBE_EOGS_SRVBBar;
		};

		class WestVehiclesCreatedCount : SoldiersRecruitedCountBase {
			idc = 90204;
			x = 0.55;
			y = 0.6;
		};

		class WestVehiclesCreatedBar : EastVehiclesCreatedBar {
			idc = 90205;
			x = 0.55;
		};

		class VehiclesLostLabel : SoldiersRecruitedLabel {
			y = 0.7;
			text = $STR_WF_END_Vehicle_Lost;
		};

		class EastVehiclesLostCount : SoldiersRecruitedCountBase {
			idc = 90107;
			y = 0.75;
		};

		class EastVehiclesLostBar : EastSoldiersRecruitedBar {
			idc = 90108;
			y = 0.76;
			colorBackground[] = WFBE_EOGS_SLVLBar;
		};

		class WestVehiclesLostCount : SoldiersRecruitedCountBase {
			idc = 90206;
			x = 0.55;
			y = 0.75;
		};

		class WestVehiclesLostBar : EastVehiclesLostBar	{
			idc = 90207;
			x = 0.55;
		};
	};
	
	class WFBE_ConstructionInterface {
		idd = 112200;
		movingEnable = 0;
		duration = 1e+011;
		name = "Construction Interface";
		onLoad = "uiNamespace setVariable ['wfbe_title_coin', _this select 0]";
		onUnload = "uiNamespace setVariable ['wfbe_title_coin', displayNull]";
		
		class controls {
			class center : RscPictureKeepAspect {
				idc = 112201;
				x = 0.4;
				y = 0.4;
				w = 0.2;
				h = 0.2;
				colorText[] = {1, 1, 1, 0.1};
				text = "\ca\ui\data\cursor_w_laserlock_gs.paa";
			};
			
			class descBackLeft : IGUIBack {
				idc = 112211;
				x = "SafezoneX + 0.01";
				y = "SafezoneY + SafezoneH - 0.13 + 0.01";
				w = 0.3;
				h = 0.12;
			};
			class descBackCenter : descBackLeft {
				idc = 112212;
				x = "SafezoneX + 0.01 +	0.3";
				w = "SafeZoneW - 0.02 -	0.3*2";
			};
			class descBackRight : descBackLeft {
				idc = 112213;
				x = "SafezoneX + SafeZoneW - 0.01 -	0.3";
				w = 0.3;
			};
			
			class descText : RscStructuredText {
				idc = 112214;
				x = "SafezoneX + 0.01 + 0.3";
				y = "SafezoneY + SafezoneH - 0.13 + 0.021";
				w = "SafeZoneW - 0.02 -	0.3*2";
				h = 0.11;
				size = 0.035;
				
				class Attributes {
					font = "Zeppelin32";
					color = "#B6F862";
					align = "left";
					shadow = true;
				};
			};
			
			class controlsText : descText {
				idc = 112215;
				x = "SafezoneX + SafeZoneW - 0.01 -	0.3";
				y = "SafezoneY + SafezoneH - 0.13 + 0.015";
				w = 0.3;
				h = 0.11;
			};
			
			class cashText : descText {
				idc = 112224;
				x = "SafezoneX + 0.012*2";
				y = "SafezoneY + SafezoneH - 0.13 + 0.02";
				w = 0.2;
				h = 0.1;
			};
		};
	};
};