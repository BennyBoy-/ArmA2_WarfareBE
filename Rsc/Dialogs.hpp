/* Dialogs */

//--- WF3 Groups Menu.
class WFBE_GroupsMenu {
	movingEnable = 1;
	idd = 508000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_GroupsMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.8;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.06;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.76;
			w = 0.8;
			h = 0.04;
			colorBackground[] = WFBE_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = "Groups Menu :";
			colorText[] = WFBE_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.75;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
		class CA_Back_Button : CA_Quit_Button {
			x = 0.695;
			text = "<<";
			onButtonClick = "WFBE_MenuAction = 1000;";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		class CA_Menu_Details : RscText {
			x = 0.405;
			y = 0.07;
			w = 0.39;
			h = 0.215;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
		class CA_Menu_Links : CA_Menu_Details {
			y = 0.29;
			h = 0.46;
		};
		class CA_Menu_Groups : RscText {
			x = 0.005;
			y = 0.07;
			w = 0.396;
			h = 0.425;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
		class CA_Menu_Requests : RscText {
			x = 0.005;
			y = 0.5;
			w = 0.396;
			h = 0.25;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
	};
	
	class controls {
		class CA_GroupsList : RscListnBox {
			idc = 508001;
			x = 0.01;
			y = 0.12;
			w = 0.386;
			h = 0.36;
			columns[] = {0.01, 0.35};
			rowHeight = 0.03;
			
			onLBDblClick = "WFBE_MenuAction = 1";
			onLBSelChanged = "WFBE_MenuAction = 2";
		};
		class CA_Icon : RscPicture {
			x = 0.67;
			y = 0.090;
			w = 0.128;
			h = 0.128;
			style = 0x30 + 0x800;
			text = "Client\Images\upgrade_infantry.paa";
		};
		class CA_GroupsDetails : RscStructuredText {
			idc = 508002;
			x = 0.41;
			y = 0.080;
			w = 0.26;
			h = 0.195;
			size = 0.0260;
			shadow = 2;
			
			class Attributes {
				font = "Zeppelin32";
				color = "#E8F0FF";
				align = "left";
				shadow = true;
			};
		};
		class CA_UnitsList : RscListnBox {
			idc = 508003;
			x = 0.41;
			y = 0.34;
			w = 0.38;
			h = 0.40;
			columns[] = {0.01, 0.35};
			rowHeight = 0.045;
			sizeEx = 0.0240;
		};
		class CA_MembersDetails : CA_GroupsDetails {
			idc = 508004;
			y = 0.3;
			h = 0.035;
		};
		class CA_Join : RscButton_Main {
			x = 0.595;
			y = 0.762;
			w = 0.2;
			h = 0.035;
			sizeEx = 0.035;
			text = "Join";
			action = "WFBE_MenuAction = 1";
		};
		class CA_Groups : CA_GroupsDetails {
			idc = 508005;
			x = 0.01;
			h = 0.035;
		};
		class CA_Request : CA_GroupsDetails {
			idc = 508006;
			x = 0.01;
			y = 0.51;
			h = 0.035;
		};
		class CA_RequestsList : RscListnBox {
			idc = 508007;
			x = 0.01;
			y = 0.55;
			w = 0.386;
			h = 0.19;
			columns[] = {0.01, 0.35};
			rowHeight = 0.0316;
			
			onLBDblClick = "WFBE_MenuAction = 3";
			// onLBSelChanged = "WFBE_MenuAction = 2";
		};
		class CA_Accept_Button : RscButton {
			idc = 508008;
			x = 0.01;
			y = 0.762;
			w = 0.15;
			h = 0.035;
			sizeEx = 0.035;
			
			text = "Accept";
			
			colorBackground[] = WFBE_Menu_Button_Sub_Color;
			colorBackgroundActive[] = WFBE_Menu_Button_Sub_Color;
			colorFocused[] = WFBE_Menu_Button_Sub_Focused_Color;
			
			onButtonClick = "WFBE_MenuAction = 3;";
		};
		class CA_Deny_Button : CA_Accept_Button {
			idc = 508009;
			x = 0.17;
			
			text = "Deny";
			
			onButtonClick = "WFBE_MenuAction = 4;";
		};
		class CA_Kick_Button : CA_Accept_Button {
			idc = 508009;
			x = 0.33;
			
			text = "Kick";
			
			onButtonClick = "WFBE_MenuAction = 5;";
		};
	};
};

//--- WF3 Upgrade Menu.
class WFBE_UpgradeMenu {
	movingEnable = 1;
	idd = 504000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_UpgradeMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.8;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.06;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.76;
			w = 0.8;
			h = 0.04;
			colorBackground[] = WFBE_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = "Upgrade Menu :";
			colorText[] = WFBE_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.75;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
		class CA_Back_Button : CA_Quit_Button {
			x = 0.695;
			text = "<<";
			onButtonClick = "WFBE_MenuAction = 1000;";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		class CA_Menu_Details : RscText {
			x = 0.345;
			y = 0.075;
			w = 0.45;
			h = 0.20;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
		class CA_Menu_Links : CA_Menu_Details {
			y = 0.29;
			h = 0.16;
		};
		class CA_Menu_Desc : CA_Menu_Details {
			y = 0.465;
			h = 0.28;
		};
	};
	
	class controls {
		class CA_UpgradeList : RscListnBox {
			idc = 504001;
			x = 0.000983551;
			y = 0.065;
			w = 0.34;
			h = 0.69;
			columns[] = {0.01, 0.25, 0.75};
			rowHeight = 0.03;
			
			onLBDblClick = "WFBE_MenuAction = 1";
			onLBSelChanged = "WFBE_MenuAction = 2";
		};
		class CA_Icon : RscPicture {
			idc = 504002;
			x = 0.67;
			y = 0.095;
			w = 0.128;
			h = 0.128;
			style = 0x30 + 0x800;
		};
		class CA_UpgradeDetails : RscStructuredText {
			idc = 504003;
			x = 0.35;
			y = 0.08;
			w = 0.32;
			h = 0.195;
			size = 0.0260;
			shadow = 2;
			
			class Attributes {
				font = "Zeppelin32";
				color = "#E8F0FF";
				align = "left";
				shadow = true;
			};
		};
		class CA_UpgradeLinks : CA_UpgradeDetails {
			idc = 504004;
			y = 0.295;
			h = 0.155;
			w = 0.45;
		};
		class CA_UpgradeDesc : CA_UpgradeLinks {
			idc = 504005;
			y = 0.47;
			h = 0.275;
		};
		class CA_Upgrade : RscButton_Main {
			idc = 504007;
			x = 0.595;
			y = 0.762;
			w = 0.2;
			h = 0.035;
			sizeEx = 0.035;
			text = "Upgrade";
			action = "WFBE_MenuAction = 1";
		};
		class CA_Details : CA_UpgradeDetails {
			idc = 504006;
			x = 0.01;
			y = 0.765;
			w = 0.4;
			h = 0.035;
			size = 0.0250;
			shadow = 2;
		};
	};
};

//--- WF3 Vote Menu.
class WFBE_VoteMenu {
	movingEnable = 1;
	idd = 500000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_VoteMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0.273;
			y = 0.134;
			w = 0.5;
			h = 0.8;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0.273;
			y = 0.134;
			w = 0.5;
			h = 0.06;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0.273;
			y = 0.134 + 0.76;
			w = 0.5;
			h = 0.04;
			colorBackground[] = WFBE_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.28;
			y = 0.134 + 0.01;
			w = 0.5;
			text = $STR_WF_VOTING_Title;
			colorText[] = WFBE_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.273 + 0.45;
			y = 0.134 + 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
	};
	
	class controls {
		class CA_Vote_List : RscListnBox {
			idc = 500100;
			x = 0.28;
			y = 0.134 + 0.07;
			w = 0.489;
			h = 0.665;
			columns[] = {0.01, 0.75};
			
			colorSelectBackground[] = WFBE_Menu_ListBox_Select_Color;
			colorSelectBackground2[] = WFBE_Menu_ListBox_Select_Color;
			
			onLBSelChanged = "WFBE_MenuAction = 1";
		};
		class CA_Menu_TimeLeft : RscText {
			idc = 500101;
			x = 0.28;
			y = 0.134 + 0.762;
			w = 0.25;
			sizeEx = 0.03;
			text = "";
			colorText[] = WFBE_Menu_Text_Color;
			shadow = 2;
		};
		class CA_Menu_Elected : CA_Menu_TimeLeft {
			idc = 500102;
			x = 0.273 + 0.20;
			y = 0.134 + 0.762;
			w = 0.3;
			style = ST_RIGHT;
			text = "";
		};
		class CA_Menu_Time_Static : CA_Menu_TimeLeft {
			idc = 500103;
			x = 0.273 + 0.16;
			y = 0.134 + 0.762;
			w = 0.3;
			style = ST_RIGHT;
			text = $STR_WF_VOTING_TimeLeft;
		};
	};
};

//--- WF3 Respawn menu.
class WFBE_RespawnMenu {
	movingEnable = 1;
	idd = 511000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_RespawnMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 1;
			h = 0.06;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.96;
			w = 1;
			h = 0.04;
			colorBackground[] = WFBE_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = $STR_WF_RESPAWN_Title;
			colorText[] = WFBE_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.95;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
	};
	
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 511001;
			x = 0.01;
			y = 0.07;
			w = 0.98;
			h = 0.8;
			ShowCountourInterval = 1;
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this select 1;";
			onMouseButtonUp = "mouseButtonUp = _this select 1;";
		};
		class CA_RespawnDetails : RscStructuredText {
			idc = 511002;
			x = 0.01;
			y = 0.965;
			w = 0.49;
			h = 0.13;
			
			size = 0.0275;
			shadow = 2;
		};
		class CA_RespawnDelay : CA_RespawnDetails {
			idc = 511003;
			x = 0.5;
			w = 0.49;
			h = 0.13;
		};
		class CA_Gear_Button : RscButton {
			idc = 511004;
			x = 0.68;
			y = 0.00940119;
			w = 0.25;
			sizeEx = 0.03221;
			
			colorBackground[] = WFBE_Menu_Button_Sub_Color;
			colorBackgroundActive[] = WFBE_Menu_Button_Sub_Color;
			colorFocused[] = WFBE_Menu_Button_Sub_Focused_Color;
			
			tooltip = $STR_WF_TOOLTIP_RespawnDefault;
			onButtonClick = "WFBE_MenuAction = 1;";
		};
	};
};

//--- WF3 Funds Menu.
class WFBE_TransferMenu {
	movingEnable = 1;
	idd = 505000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_TransferMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.6;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.06;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.56;
			w = 0.8;
			h = 0.04;
			colorBackground[] = WFBE_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = $STR_WF_MAIN_FundsMenu;
			colorText[] = WFBE_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.75;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
		class CA_Menu_Details : RscText {
			x = 0.405;
			y = 0.075;
			w = 0.385;
			h = 0.18;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
		class CA_Edit_BG : RscText {
			x = 0.415;
			y = 0.165;
			w = 0.15;
			colorBackground[] = WFBE_Background_Color_Header;
		};
	};
	
	class controls {
		class CA_TransferList : RscListnBox {
			idc = 505001;
			x = 0.000983551;
			y = 0.065;
			w = 0.4;
			h = 0.488;
			columns[] = {0.01, 0.3, 0.75};
			rowHeight = 0.03;
			
			onLBDblClick = "WFBE_MenuAction = 1";
		};
		class CA_Send : RscButton_Main {
			x = 0.595;
			y = 0.562;
			w = 0.2;
			h = 0.035;
			sizeEx = 0.035;
			text = $STR_WF_Send;
			action = "WFBE_MenuAction = 1";
		};
		class CA_AmountDetails : RscText {
			x = 0.415;
			y = 0.08;
			w = 0.2;
			sizeEx = 0.030;
			text = $STR_WF_Amount;
		};
		class CA_Funds_Slider : RscXSliderH {
			idc = 505002;
			x = 0.415;
			y = 0.12;
			w = 0.365;
			h = 0.029412;
			
			onSliderPosChanged = "WFBE_MenuAction = 2";
		};
		class CA_Funds_Edit : RscEdit {
			idc = 505003;
			x = 0.415;
			y = 0.165;
			w = 0.15;
			text = "0";
			sizeEx = 0.035;
		};
		class CA_Funds : RscStructuredText {
			idc = 505004;
			x = 0.415;
			y = 0.21;
			w = 0.3;
			h = 0.035;
			size = 0.03;
			
			colorText[] = {0.543, 0.5742, 0.4102, 1.0};
		};
	};
};

//--- WF3 Gear Menu.
class WFBE_BuyGearMenu {
	movingEnable = 1;
	idd = 503000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_BuyGearMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 1;
			h = 0.06;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.96;
			w = 1;
			h = 0.04;
			colorBackground[] = WFBE_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = "Gear Purchase Menu :";
			colorText[] = WFBE_Menu_Title_Color;
		};
		class CA_Menu_Gear : RscText {
			x = 0.5;
			y = 0.06;
			w = 0.5;
			h = 0.9;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
		};
		class LineTRH1 : RscText {
			x = 0;
			y = 0.768;
			w = 0.5;
			h = 0.001;
			colorBackground[] = {0.2588, 0.7137, 1, 0.7};
		};
		class CA_Label_View : RscText {
			x = 0.01;
			y = 0.195;
			w = 0.20;
			text = "View:";
			sizeEx = 0.035;
		};
		class CA_Label_Target : CA_Label_View {
			y = 0.15;
			text = "Target:";
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.95;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
		class CA_Back_Button : CA_Quit_Button {
			x = 0.895;
			text = "<<";
			onButtonClick = "WFBE_MenuAction = 1000;";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
	};
	
	class controls {
		class CA_GearList : RscListnBox {
			idc = 503001;
			x = 0.000983551;
			// y = 0.24;
			y = 0.28;
			w = 0.493697;
			// h = 0.505;
			h = 0.48;
			columns[] = {0.01, 0.25, 0.75};
			rowHeight = 0.03;
			
			onLBDblClick = "WFBE_MenuAction = 1";
			onLBSelChanged = "WFBE_MenuAction = 2";
		};
		class CA_AmmoList : CA_GearList {
			idc = 503002;
			// y = 0.76;
			y = 0.775;
			// h = 0.195;
			h = 0.180;
			
			onLBDblClick = "WFBE_MenuAction = 3";
		};
		class CA_Combo_View : RscCombo {
			idc = 503003;
			x = 0.15;
			y = 0.195;
			w = 0.34;
			h = 0.037;
			onLBSelChanged = "WFBE_MenuAction = 301";
		};
		class CA_Combo_Target : CA_Combo_View {
			idc = 503004;
			y = 0.15;
			onLBSelChanged = "WFBE_MenuAction = 302";
		};
		class FilterButtonTemplate : RscClickableText {
			idc = 503301;
			style = 48 + 0x800;
			x = 0.00642873;
			y = 0.034482;
			w = 0.0699999;
			h = 0.11;
			text = "Client\Images\gearicontemplate.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_tab', 0];";
		};
		class FilterButtonAll : FilterButtonTemplate {
			idc = 503302;
			x = 0.0814287;
			text = "Client\Images\geariconall.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_tab', 1];";
		};
		class FilterButtonPrimary : FilterButtonTemplate {
			idc = 503303;
			x = 0.16979;
			text = "Client\Images\geariconprimary.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_tab', 2];";
		};
		class FilterButtonSecondary : FilterButtonTemplate {
			idc = 503304;
			x = 0.259109;
			text = "Client\Images\geariconsecondary.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_tab', 3];";
		};
		class FilterButtonSidearm : FilterButtonTemplate {
			idc = 503305;
			x = 0.33979;
			text = "Client\Images\geariconsidearm.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_tab', 4];";
		};
		class FilterButtonMisc : FilterButtonTemplate {
			idc = 503306;
			x = 0.421555;
			text = "Client\Images\geariconmisc.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_tab', 5];";
		};
		class PrimaryWeapon : RscClickableText {
			idc = 503401;
			x = 0.502842;
			y = 0.200302;
			w = 0.310369;
			h = 0.198179;
			style = 48 + 0x800;
			soundDoubleClick[] = {"", 0.1, 1};
			colorBackground[] = {0.6, 0.83, 0.47, 1};
			colorBackgroundSelected[] = {0.6, 0.83, 0.47, 1};
			colorFocused[] = {0, 0, 0, 0};
			color[] = {0.85, 0.85, 0.85, 1};
			colorText[] = {0.85, 0.85, 0.85, 1};
			colorActive[] = {1, 1, 1, 1};
			text = "\Ca\UI\Data\ui_gear_gun_gs.paa";
			action = "WFBE_MenuAction = 901";
		};
		class SecondaryWeapon : PrimaryWeapon {
			idc = 503402;
			y = 0.401362;
			text = "\Ca\UI\Data\ui_gear_sec_gs.paa";
			action = "WFBE_MenuAction = 902";
		};
		class Sidearm : PrimaryWeapon {
			idc = 503403;
			x = 0.576806;
			y = 0.607022;
			w = 0.113;
			h = 0.15;
			text = "\Ca\UI\Data\ui_gear_hgun_gs.paa";
			action = "WFBE_MenuAction = 903";
		};
		class InventorySlot0 : RscClickableText {
			idc = 503501;
			x = 0.816052;
			y = 0.250721;
			w = 0.06;
			h = 0.08;
			text = "\Ca\UI\Data\ui_gear_mag_gs.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 1]";
		};
		class InventorySlot1 : InventorySlot0 {
			idc = 503502;
			x = 0.878093;
			y = 0.250721;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 2]";
		};
		class InventorySlot2 : InventorySlot0 {
			idc = 503503;
			x = 0.940501;
			y = 0.250721;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 3]";
		};
		class InventorySlot3 : InventorySlot0 {
			idc = 503504;
			x = 0.816052;
			y = 0.341169;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 4]";
		};
		class InventorySlot4 : InventorySlot0 {
			idc = 503505;
			x = 0.878093;
			y = 0.341169;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 5]";
		};
		class InventorySlot5 : InventorySlot0 {
			idc = 503506;
			x = 0.940501;
			y = 0.341169;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 6]";
		};
		class InventorySlot6 : InventorySlot0 {
			idc = 503507;
			x = 0.816052;
			y = 0.429373;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 7]";
		};
		class InventorySlot7 : InventorySlot0 {
			idc = 503508;
			x = 0.878093;
			y = 0.429373;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 8]";
		};
		class InventorySlot8 : InventorySlot0 {
			idc = 503509;
			x = 0.940501;
			y = 0.429373;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 9]";
		};
		class InventorySlot9 : InventorySlot0 {
			idc = 503510;
			x = 0.816052;
			y = 0.519938;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 10]";
		};
		class InventorySlot10 : InventorySlot0 {
			idc = 503511;
			x = 0.878093;
			y = 0.519938;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 11]";
		};
		class InventorySlot11 : InventorySlot0 {
			idc = 503512;
			x = 0.940501;
			y = 0.519938;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_main', 12]";
		};
		class SidearmInventorySlot0 : RscClickableText {
			idc = 503513;
			x = 0.695848;
			y = 0.607022;
			w = 0.055;
			h = 0.074;
			text = "\Ca\UI\Data\ui_gear_hgunmag_gs.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 1]";
		};
		class SidearmInventorySlot1 : SidearmInventorySlot0 {
			idc = 503514;
			x = 0.75653;
			y = 0.607022;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 2]";
		};
		class SidearmInventorySlot2 : SidearmInventorySlot0 {
			idc = 503515;
			x = 0.816892;
			y = 0.607022;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 3]";
		};
		class SidearmInventorySlot3 : SidearmInventorySlot0 {
			idc = 503516;
			x = 0.877253;
			y = 0.607022;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 4]";
		};
		class SidearmInventorySlot4 : SidearmInventorySlot0 {
			idc = 503517;
			x = 0.695848;
			y = 0.688504;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 5]";
		};
		class SidearmInventorySlot5 : SidearmInventorySlot0 {
			idc = 503518;
			x = 0.756529;
			y = 0.688504;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 6]";
		};
		class SidearmInventorySlot6 : SidearmInventorySlot0 {
			idc = 503519;
			x = 0.816892;
			y = 0.688504;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 7]";
		};
		class SidearmInventorySlot7 : SidearmInventorySlot0 {
			idc = 503520;
			x = 0.877252;
			y = 0.688505;
			action = "UINamespace setVariable ['wfbe_display_buygear_pool_gun', 8]";
		};
		class MiscInventorySlot0 : RscClickableText {
			idc = 503521;
			x = 0.575126;
			y = 0.774467;
			w = 0.055;
			h = 0.074;
			colorActive[] = {0.85, 0.85, 0.85, 1};
			text = "\Ca\UI\Data\ui_gear_eq_gs.paa";
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 0]";
		};
		class MiscInventorySlot1 : MiscInventorySlot0 {
			idc = 503522;
			x = 0.635487;
			y = 0.774468;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 1]";
		};
		class MiscInventorySlot2 : MiscInventorySlot0 {
			idc = 503523;
			x = 0.695848;
			y = 0.774468;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 2]";
		};
		class MiscInventorySlot3 : MiscInventorySlot0 {
			idc = 503524;
			x = 0.75653;
			y = 0.774468;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 3]";
		};
		class MiscInventorySlot4 : MiscInventorySlot0 {
			idc = 503525;
			x = 0.816892;
			y = 0.774468;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 4]";
		};
		class MiscInventorySlot5 : MiscInventorySlot0 {
			idc = 503526;
			x = 0.877252;
			y = 0.774468;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 5]";
		};
		class MiscInventorySlot6 : MiscInventorySlot0 {
			idc = 503527;
			x = 0.575126;
			y = 0.85595;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 6]";
		};
		class MiscInventorySlot7 : MiscInventorySlot0 {
			idc = 503528;
			x = 0.635487;
			y = 0.85595;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 7]";
		};
		class MiscInventorySlot8 : MiscInventorySlot0 {
			idc = 503529;
			x = 0.695848;
			y = 0.85595;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 8]";
		};
		class MiscInventorySlot9 : MiscInventorySlot0 {
			idc = 503530;
			x = 0.75653;
			y = 0.85595;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 9]";
		};
		class MiscInventorySlot10 : MiscInventorySlot0 {
			idc = 503531;
			x = 0.816892;
			y = 0.85595;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 10]";
		};
		class MiscInventorySlot11 : MiscInventorySlot0 {
			idc = 503532;
			x = 0.877253;
			y = 0.85595;
			action = "UINamespace setVariable ['wfbe_display_buygear_misc', 11]";
		};
		class SpecialInventorySlot0 : InventorySlot0 {
			idc = 503533;
			x = 0.507043;
			y = 0.0586288;
			w = 0.11384;
			h = 0.136554;
			colorActive[] = {0.85, 0.85, 0.85, 1};
			text = "\Ca\UI\Data\ui_gear_eq_gs.paa";
			action = "WFBE_MenuAction = 904";
		};
		class SpecialInventorySlot1 : SpecialInventorySlot0 {
			idc = 503534;
			x = 0.880612;
			y = 0.0575075;
			action = "WFBE_MenuAction = 905";
		};
		class CA_CargoList : CA_GearList {
			idc = 503005;
			x = 0.500983551;
			w = 0.493697;
			h = 0.505;
			
			onLBDblClick = "WFBE_MenuAction = 906";
		};
		class CA_CargoDetails : RscStructuredText {
			idc = 503006;
			x = 0.500983551;
			y = 0.08;
			w = 0.24;
			h = 0.13;
			size = 0.0250;
			shadow = 2;
		};
		class CA_CargoDetails2 : CA_CargoDetails {
			idc = 503007;
			x = 0.755983551;
		};
		class CA_Purchase : RscButton_Main {
			x = 0.875;
			y = 0.962;
			w = 0.12;
			h = 0.035;
			sizeEx = 0.035;
			text = "Buy";
			action = "WFBE_MenuAction = 501";
		};
		class CA_PurchaseDetails : CA_CargoDetails {
			idc = 503008;
			x = 0.51;
			y = 0.965;
			w = 0.3;
			h = 0.13;
		};
		class CA_MakeTemplate : CA_Purchase {
			idc = 503009;
			x = 0.005;
			w = 0.24;
			sizeEx = 0.03221;
			
			colorBackground[] = WFBE_Menu_Button_Sub_Color;
			colorBackgroundActive[] = WFBE_Menu_Button_Sub_Color;
			colorFocused[] = WFBE_Menu_Button_Sub_Focused_Color;
			
			text = "Create Template";
			action = "WFBE_MenuAction = 601";
		};
		class CA_DeleteTemplate : CA_MakeTemplate {
			idc = 503010;
			x = 0.255;
			text = "Delete Template";
			action = "WFBE_MenuAction = 602";
		};
		class CA_FundsDetails : CA_CargoDetails {
			idc = 503011;
			x = 0.01;
			y = 0.245;
			w = 0.3;
			h = 0.13;
		};
		class CA_QuickReload : CA_MakeTemplate {
			idc = 503012;
			x = 0.505;
			y = 0.01;
			w = 0.17;
			text = "Reload";
			action = "WFBE_MenuAction = 701";
		};
		class CA_QuickClear : CA_MakeTemplate {
			idc = 503013;
			x = 0.685;
			y = 0.01;
			w = 0.17;
			text = "Clear";
			action = "WFBE_MenuAction = 702";
		};
	};
};

//--- Main Menu. | ALL DONE!
class WF_Menu {
	movingEnable = 1;
	idd = 11000;
	onLoad = "ExecVM ""Client\GUI\GUI_Menu.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.17467;
			y = 0.186955;
			w = 0.65066;
			h = 0.63192;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.17467;
			y = 0.186955;
			w = 0.65066;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.17467;
			y = 0.766375;
			w = 0.65066;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.17467;
			y = 0.238455;
			w = 0.65066;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Button_A : RscShortcutButtonMain {
			idc = 11001;
			x = 0.17598;
			y = 0.250358;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_Purchase_Units;
			tooltip = $STR_WF_TOOLTIP_MainMenu_Purchase_Units;
			action = "MenuAction = 1";
		};
		class Button_B : RscShortcutButtonMain {
			idc = 11002;
			x = 0.17598;
			y = 0.35116;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_Purchase_Gear;
			tooltip = $STR_WF_TOOLTIP_MainMenu_Purchase_Gear;
			action = "MenuAction = 2";
		};
		class Button_C : RscShortcutButtonMain {
			idc = 11003;
			x = 0.17598;
			y = 0.451959;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_TeamMenu;
			tooltip = $STR_WF_TOOLTIP_MainMenu_TeamMenu;
			action = "MenuAction = 3";
		};
		class Button_D : RscShortcutButtonMain {
			idc = 11004;
			x = 0.510943;
			y = 0.65356;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_VotingMenu;
			tooltip = $STR_WF_TOOLTIP_MainMenu_VoteForCommander;
			action = "MenuAction = 4";
		};
		class Button_E : RscShortcutButtonMain {
			idc = 11005;
			x = 0.510943;
			y = 0.250358;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_CommandMenu;
			tooltip = $STR_WF_TOOLTIP_CommandMenu_Commandteam;
			action = "MenuAction = 5";
		};
		class Button_F : RscShortcutButtonMain {
			idc = 11006;
			x = 0.17598;
			y = 0.55276;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_TacticalMenu;
			tooltip = $STR_WF_TOOLTIP_CommandMenu_SpecialMenu;
			action = "MenuAction = 6";
		};		
		class Button_G : RscShortcutButtonMain {
			idc = 11007;
			x = 0.510943;
			y = 0.451959;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_UpgradeMenu;
			tooltip = $STR_WF_TOOLTIP_CommandMenu_Upgrade_Menu;
			action = "MenuAction = 7";
		};
		class Button_H : RscShortcutButtonMain {
			idc = 11008;
			x = 0.510943;
			y = 0.35116;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_EconomyMenu;
			tooltip = $STR_WF_TOOLTIP_CommandMenu_Commander_Menu;
			action = "MenuAction = 8";
		};
		class Button_I : RscShortcutButtonMain {
			idc = 11009;
			x = 0.17598;
			y = 0.65356;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_SupportMenu;
			tooltip = $STR_WF_TOOLTIP_CommandMenu_SupportMenu;
			action = "MenuAction = 9";
		};
		class Button_J : RscShortcutButtonMain {
			idc = 11010;
			x = 0.510943;
			y = 0.55276;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_GroupsMenu;
			action = "MenuAction = 13";
		};
		class TitleMenu: RscText_Title {
			idc = 11015;
			x = 0.178164;
			y = 0.19379;
			w = 0.800001;
			sizeEx = 0.035;
		};
		class CA_PA_Button : RscClickableText {
			idc = 11012;
			x = 0.776399;
			y = 0.191982;
			w = 0.04;
			h = 0.04;
			text = "\ca\ui\data\iconvehicle_ca.paa";
			action = "MenuAction = 12";
			tooltip = $STR_WF_TOOLTIP_Parameter;
		};
		class CA_UN_Button : RscClickableText {
			idc = 11013;
			x = 0.194088;
			y = 0.767144;
			w = 0.045;
			h = 0.045;
			text = "\ca\ui\data\stats_soft_ca.paa";
			action = "MenuAction = 10";
			tooltip = $STR_WF_TOOLTIP_Unflip;
		};
		class CA_HB_Button : RscClickableText {
			idc = 11014;
			x = 0.265514;
			y = 0.766938;
			w = 0.045;
			h = 0.045;
			text = "\ca\ui\data\editor_2d_camera_ca.paa";
			action = "MenuAction = 11";
			tooltip = $STR_WF_TOOLTIP_HeadBugFix;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.778103;
			y = 0.769671;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Team Menu. | ALL DONE!
class RscMenu_Team {
	movingEnable = 1;
	idd = 13000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_Team.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.187276;
			y = 0.200401;
			w = 0.625448;
			h = 0.599268;
			colorBackground[] = WFBE_Background_Color;
			moving = 1;
		};
		class Background_H : RscText {
			x = 0.187276;
			y = 0.200401;
			w = 0.625448;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.187276;
			y = 0.747169;
			w = 0.625448;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.187276;
			y = 0.251901;
			w = 0.625448;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Title_TeamMenu : RscText_Title {
			idc = 13001;
			x = 0.192941;
			y = 0.206879;
			w = 0.3;
			text = $STR_WF_MAIN_TeamMenu;
		};
		/* Video */
		class Video_Subtitle : RscText_SubTitle {
			idc = 13101;
			x = 0.19634;
			y = 0.265506;
			w = 0.3;
			text = $STR_WF_TEAM_VideoOptionsLabel;
		};
		class CA_VD_Label : RscText {
			idc = 13002;
			x = 0.197022;
			y = 0.314747;
			w = 0.3;
		};
		class CA_VD_Slider : RscXSliderH {
			idc = 13003;
			x = 0.513947;
			y = 0.31565;
			w = 0.279999;
			h = 0.029412;
		};
		class CA_TG_Label : RscText {
			idc = 13004;
			x = 0.197022;
			y = 0.35722;
			w = 0.3;
		};
		class CA_TG_Slider : RscXSliderH {
			idc = 13005;
			x = 0.514313;
			y = 0.363086;
			w = 0.279999;
			h = 0.029412;
		};
		/* Transfer */
		class CA_Transfer_SubTitle : RscText_SubTitle {
			idc = 13012;
			x = 0.19634;
			y = 0.465507;
			w = 0.3;
			text = $STR_WF_TEAM_MoneyTransferLabel;
		};
		class CA_TM_Label : RscText {
			idc = 13006;
			x = 0.196002;
			y = 0.57032;
			w = 0.3;
		};
		class CA_TM_Slider : RscXSliderH {
			idc = 13007;
			x = 0.513947;
			y = 0.517846;
			w = 0.279999;
			h = 0.029412;
		};
		class CA_TM_Combo : RscCombo {
			idc = 13008;
			x = 0.202366;
			y = 0.517987;
			w = 0.279999;
			h = 0.035;
		};
		class CA_TM_Button : RscButton {
			idc = 13009;
			x = 0.513949;
			y = 0.572956;
			w = 0.279999;
			text = $STR_WF_TEAM_TransferButton;			
			action = "MenuAction = 1";
		};
		class CA_TA_Button : RscButton_Main {
			idc = 13109;
			x = 0.513949;
			y = 0.465;
			w = 0.279999;
			text = "Transfer (Adv)";			
			action = "MenuAction = 101";
		};
		class CA_IC_SubTitle : RscText_SubTitle {
			idc = 13010;
			x = 0.380877;
			y = 0.20787;
			w = 0.426891;
			style = ST_RIGHT;
		};
		/* Disband */
		class CA_Disband_SubTitle : RscText_SubTitle {
			idc = 13011;
			x = 0.19532;
			y = 0.642376;
			w = 0.3;
			text = $STR_WF_TEAM_DisbandLabel;
		};
		class CA_DB_Combo : RscCombo {
			idc = 13013;
			x = 0.202364;
			y = 0.691727;
			w = 0.279999;
			h = 0.035;
		};
		class CA_DB_Button : RscButton {
			idc = 13014;
			x = 0.513951;
			y = 0.691511;
			w = 0.279999;
			text = $STR_WF_TEAM_DisbandButton;
			action = "MenuAction = 3";
		};
		/* FX */
		class CA_FX_Label : RscText {
			idc = 13015;
			x = 0.19634;
			y = 0.405641;
			w = 0.3;
			text = $STR_WF_TEAM_GraphicFilterLabel;
		};
		class CA_FX_Combo : RscCombo {
			idc = 13018;
			x = 0.514313;
			y = 0.406464;
			w = 0.0999999;
			h = 0.035;
			onLBSelChanged = "MenuAction = 6";
		};
		/* Vote PopUp */
		class VPOPON_Button : RscButton {
			idc = 13019;
			x = 0.203;
			y = 0.755;
			w = 0.279;
			text = "";
			action = "MenuAction = 13";
		}
		/* Seperator */
		class Line_TRH1 : RscText {
			x = 0.192941;
			y = 0.455916;
			w = 0.614486;
			h = WFBE_SPT1;
			colorBackground[] = WFBE_SPC1;
		};
		class Line_TRH2 : RscText {
			x = 0.192941;
			y = 0.629907;
			w = 0.614486;
			h = WFBE_SPT1;
			colorBackground[] = WFBE_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.704632;
			y = 0.753185;
			action = "MenuAction = 8";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.766877;
			y = 0.753185;			
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- BuyUnits Menu. | ALL DONE!
class RscMenu_BuyUnits {
	movingEnable = 1;
	idd = 12000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_BuyUnits.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = -0.000119045;
			y = 0.000960164;
			w = 1.00024;
			h = 1.00046;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = -0.000119045;
			y = 0.000960164;
			w = 1.00024;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = -0.000119045;
			y = 0.948079045;
			w = 1.00024;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = -0.000119045;
			y = 0.051619045;
			w = 1.00024;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		/* Controls */
		class CA_BuyList : RscListBoxA {
			idc = 12001;
			x = 0.000983551;
			y = 0.184483;
			w = 0.493697;
			h = 0.493299;
			columns[] = {0.01, 0.19, 0.75};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			
			onLBSelChanged = "MenuAction = 302";
			onLBDblClick = "MenuAction = 1";
		};
		class CA_Purchase : RscButton {
			idc = 12002;
			x = 0.688983;
			y = 0.956626;
			w = 0.12;
			text = $STR_WF_Purchase;
			action = "MenuAction = 1";
		};
		class Title_BuyUnits : RscText_Title {
			idc = 12004;
			x = 0.00477695;
			y = 0.00775912;
			w = 0.3;
			text = $STR_WF_MAIN_Purchase_Units;
		};
		/* Factory-Picture */
		class WF_Con1 : RscClickableText {
			idc = 12005;
			x = 0.499874;
			y = 0.0612043;
			w = 0.072;
			h = 0.072;
			text = "\CA\warfare2\Images\con_barracks.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con1;
			action = "MenuAction = 101";
		};
		class WF_Con2 : WF_Con1 {
			idc = 12006;
			x = 0.585001;
			text = "\CA\warfare2\Images\con_light.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con2;
			action = "MenuAction = 102";
		};
		class WF_Con3 : WF_Con1 {
			idc = 12007;
			x = 0.670123;
			text = "\CA\warfare2\Images\con_heavy.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con3;
			action = "MenuAction = 103";
		};
		class WF_Con4 : WF_Con1 {
			idc = 12008;
			x = 0.753571;
			text = "\CA\warfare2\Images\con_aircraft.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con4;
			action = "MenuAction = 104";
		};
		class WF_Con7 : WF_Con1 {
			idc = 12021;
			x = 0.838699;
			text = "\CA\warfare2\Images\con_airport.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con5;
			action = "MenuAction = 106";
		};
		class WF_Con5 : WF_Con1 {
			idc = 12020;
			x = 0.923826;
			text = "Client\Images\con_depot.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con6;
			action = "MenuAction = 105";
		};
		/**/
		class CA_Portrait : RscPicture {
			idc = 12009;
			x = 0.00434637;
			y = 0.726386;
			w = 0.186974;
			h = 0.219467;
			style = 0x30 + 0x800;
		};
		/* Vehicle-Crew */
		class WF_Lock : RscClickableText {
			idc = 12023;
			x = 0.443363;
			y = 0.128362;
			w = 0.05;
			h = 0.05;
			text = "Client\Images\i_lock.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Locked;
			action = "MenuAction = 401";
		};
		class WF_Driver : WF_Lock {
			idc = 12012;
			x = 0.242185;
			text = "Client\Images\i_driver.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Driver;
			action = "MenuAction = 201";
		};
		class WF_Gunner : WF_Lock {
			idc = 12013;
			x = 0.292267;
			text = "Client\Images\i_gunner.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Gunner;
			action = "MenuAction = 202";
		};
		class WF_Commander : WF_Lock {
			idc = 12014;
			x = 0.343194;
			text = "Client\Images\i_commander.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Commander;
			action = "MenuAction = 203";
		};
		class WF_Extra : WF_Lock {
			idc = 12041;
			x = 0.393278;
			text = "Client\Images\i_extra.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Extra;
			action = "MenuAction = 204";
		};
		/**/
		class WF_MiniMap : RscMapControl {
			idc = 12015;
			x = 0.5;
			y = 0.185168;
			w = 0.499378;
			h = 0.493457;
			ShowCountourInterval = 1;
		};
		class CA_Factory_Label : RscText {
			idc = 12016;
			x = 0.5;
			y = 0.140446;
			w = 0.3;
			text = $STR_WF_UNITS_Factory;
			sizeEx = 0.035;
		};
		class CA_Combo_Factory : RscCombo {
			idc = 12018;
			x = 0.626048;
			y = 0.140446;
			w = 0.368908;
			h = 0.037;
			onLBSelChanged = "MenuAction = 301";
		};
		class CA_Cash_SubTitle : RscText_SubTitle {
			idc = 12019;
			x = 0.694657;
			y = 0.007759;
			w = 0.3;
			style = ST_RIGHT;
		};
		class CA_Details : RscStructuredText {
			idc = 12022;
			x = 0.5;
			y = 0.699494;
			w = 0.500294;
			h = 0.242927;
			size = 0.0250;
		};
		class CA_Queu_SubTitle : RscText_SubTitle {
			idc = 12024;
			x = 0.350419;
			y = 0.00775906;
			w = 0.3;
			style = ST_CENTER;
		};
		class CA_Faction_Label : RscText {
			idc = 12025;
			x = 0.000797182;
			y = 0.062964;
			w = 0.3;
			sizeEx = 0.035;
		};
		class CA_Combo_Faction : RscCombo {
			idc = 12026;
			x = 0.218874;
			y = 0.0652035;
			w = 0.261343;
			h = 0.035;
			onLBSelChanged = "MenuAction = 303";
		};
		/* Info-Labels */
		class CA_Faction_Small : RscText_Small {
			idc = 12027;
			x = 0.194959;
			y = 0.692771;
			w = 0.3;
			h = 0.037;
			text = $STR_WF_UNITS_FactionLabel;
		};
		class CA_Price_Small : CA_Faction_Small {
			idc = 12010;
			x = 0.194959;
			y = 0.730336;
			text = $STR_WF_Price;
		};
		class CA_Time_Small : CA_Faction_Small {
			idc = 12028;
			x = 0.194957;
			y = 0.76566;
			text = $STR_WF_UNITS_DurationLabel;
		};
		class CA_Skill_Small : CA_Faction_Small {
			idc = 12029;
			x = 0.194959;
			y = 0.803222;
			text = $STR_WF_UNITS_SkillLabel;
		};
		class CA_TransportCapacity_Small : CA_Faction_Small {
			idc = 12030;
			x = 0.194959;
			y = 0.838545;
			text = $STR_WF_UNITS_TransportCabilityLabel;
		};
		class CA_MaxSpeed_Small : CA_Faction_Small {
			idc = 12031;
			x = 0.194959;
			y = 0.876108;
			text = $STR_WF_UNITS_MaxSpeedLabel;
		};
		class CA_Armor_Small : CA_Faction_Small {
			idc = 12032;
			x = 0.194959;
			y = 0.911431;
			text = $STR_WF_UNITS_ArmorLabel;
		};
		/* Info-Values */
		class CA_Faction_Value : RscText_Small {
			idc = 12033;
			x = 0.305041;
			y = 0.692773;
			w = 0.19;
			h = 0.037;
			style = 1;
		};
		class CA_Price_Value : CA_Faction_Value {
			idc = 12034;
			x = 0.305042;
			y = 0.730336;
			colorText[] = {1, 0, 0, 1};
		};
		class CA_Time_Value : CA_Faction_Value {
			idc = 12035;
			x = 0.305041;
			y = 0.765659;
		};
		class CA_Skill_Value : CA_Faction_Value {
			idc = 12036;
			x = 0.305041;
			y = 0.803222;
		};
		class CA_TransportCapacity_Value : CA_Faction_Value {
			idc = 12037;
			x = 0.305042;
			y = 0.838545;
		};
		class CA_MaxSpeed_Value : CA_Faction_Value{
			idc = 12038;
			x = 0.305041;
			y = 0.876109;
		};
		class CA_Armor_Value : CA_Faction_Value {
			idc = 12039;
			x = 0.30504;
			y = 0.911432;
		};
		/**/
		class CA_Unit_SubTitle : RscText_SubTitle {
			idc = 12040;
			x = 0.000575542;
			y = 0.686365;
			w = 0.3;
			text = $STR_WF_UNITS_InformationLabel;
		};
		/* Seperator */
		class LineTRH1 : RscText {
			x = 0.00470637;
			y = 0.685127;
			w = 0.990954;
			h = WFBE_SPT1;
			colorBackground[] = WFBE_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892748;
			y = 0.953506;
			action = "MenuAction = 2";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.953972;
			y = 0.953506;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Command Menu. | ALL DONE!
class RscMenu_Command {
	movingEnable = 1;
	idd = 14000;
	onLoad = "_this ExecVM 'Client\GUI\GUI_Menu_Command.sqf'";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.000960961;
			y = 0.00128184;
			w = 0.999761;
			h = 1.00023;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.000960961;
			y = 0.00128184;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.000960961;
			y = 0.94901184;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.000960961;
			y = 0.05278184;
			w = 0.999761;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 14002;
			x = 0.468907;
			y = 0.0563169;
			w = 0.532152;
			h = 0.892336;
			ShowCountourInterval = 1;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};
		class Title_OrderMenu : RscText_Title {
			idc = 14003;
			x = 0.00561695;
			y = 0.00775909;
			w = 0.3;
			text = $STR_WF_MAIN_CommandMenu;
		};
		class CA_TakeTowns : RscButton {
			idc = 14005;
			x = 0.0057147;
			y = 0.423585;
			w = 0.22;
			text = $STR_WF_COMMAND_TakeTowns;
			action = "MenuAction = 101";
		};
		class CA_Move : CA_TakeTowns {
			idc = 14006;
			x = 0.00487578;
			y = 0.473669;
			text = $STR_WF_COMMAND_Move;
			action = "MenuAction = 102";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_Patrol : CA_TakeTowns {
			idc = 14007;
			x = 0.24437;
			y = 0.424035;
			text = $STR_WF_COMMAND_Patrol;
			action = "MenuAction = 103";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_Defend : CA_TakeTowns {
			idc = 14008;
			x = 0.24353;
			y = 0.472995;
			text = $STR_WF_COMMAND_Defense;
			action = "MenuAction = 104";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		/**/
		class CA_BuyType_Label : RscText {
			idc = 14009;
			x = -0.000420049;
			y = 0.752941;
			w = 0.17;
			text = $STR_WF_COMMAND_BuyType;
		};
		class CA_BuyType_Combo : RscCombo {
			idc = 14010;
			x = 0.162328;
			y = 0.755179;
			w = 0.302101;
			h = 0.035;
		};
		class CA_Respawn : RscButton {
			idc = 14011;
			x = 0.631344;
			y = 0.957504;
			w = 0.23;
			text = $STR_WF_COMMAND_RespawnButton;
			action = "MenuAction = 201";
		};
		class CA_TeamList : RscListBox {
			idc = 14012;
			x = 0.00518636;
			y = 0.178967;
			w = 0.459244;
			h = 0.229759;
			rowHeight = 0.0219091;
			sizeEx = 0.03;
			style = 0x20;//--- MultiSelect LB.
			onLBSelChanged = "MenuAction = 1";
			onLBDblClick = "MenuAction = 2";
		};	
		class CA_Mission_Type : RscText {
			idc = 14013;
			x = 0.000842094;
			y = 0.142566;
			w = 0.3;
		};
		class CA_AutoAIOn : RscButton {
			idc = 14014;
			x = 0.00470574;
			y = 0.957504;
			w = 0.3;
			text = $STR_WF_COMMAND_AutoAI;
			action = "MenuAction = 301";
		};
		class CA_AutoAIOff : CA_AutoAIOn {
			idc = 14015;
			x = 0.318572;
			text = $STR_WF_COMMAND_AutoAIOff;
			action = "MenuAction = 301";
		};		
		class CA_SetBuy : RscButton {
			idc = 14016;
			x = 0.0440367;
			y = 0.801901;
			w = 0.42;
			text = $STR_WF_COMMAND_SetBuyType;
			action = "MenuAction = 302";
		};
		/**/
		class CA_Behavior_Combo : RscCombo {
			idc = 14017;
			x = 0.214428;
			y = 0.531822;
			w = 0.25;
			h = 0.035;
		};
		class CA_Combat_Combo : CA_Behavior_Combo {
			idc = 14018;
			x = 0.214428;
			y = 0.572941;
		};
		class CA_Formation_Combo : CA_Behavior_Combo {
			idc = 14019;
			x = 0.214428;
			y = 0.614061;
		};
		class CA_Speed_Combo : CA_Behavior_Combo {
			idc = 14020;
			x = 0.214428;
			y = 0.656302;
		};
		/**/
		class CA_Behavior_Label : RscText {
			idc = 14021;
			x = -0.000420049;
			y = 0.52958;
			w = 0.17;
			text = $STR_WF_COMMAND_Behavior;
		};
		class CA_Combat_Label : CA_Behavior_Label {
			idc = 14022;
			x = -0.000420049;
			y = 0.5707;
			text = $STR_WF_COMMAND_CombatMode;
		};
		class CA_Formation_Label : CA_Behavior_Label {
			idc = 14031;
			x = -0.000420049;
			y = 0.61182;
			text = $STR_WF_COMMAND_Formation;
		};
		class CA_Speed_Label : CA_Behavior_Label {
			idc = 14023;
			x = -0.000420049;
			y = 0.654061;
			text = $STR_WF_COMMAND_Speed;
		};
		class CA_SetToTeam : RscButton {
			idc = 14024;
			x = 0.0440339;
			y = 0.703026;
			w = 0.42;
			text = $STR_WF_COMMAND_SetTeamProperties;
			action = "MenuAction = 303";
		};
		class CA_Respawn_Combo : RscCombo {
			idc = 14025;
			x = 0.160647;
			y = 0.855182;
			w = 0.303781;
			h = 0.035;
			onLBSelChanged = "MenuAction = 305";
		};
		class CA_Respawn_Label : CA_Behavior_Label {
			idc = 14026;
			x = -0.000420049;
			y = 0.852941;
			text = $STR_WF_COMMAND_Respawn;
		};
		class CA_SetRespawn : RscButton {
			idc = 14027;
			x = 0.0440337;
			y = 0.900783;
			w = 0.42;
			text = $STR_WF_COMMAND_SetRespawn;
			action = "MenuAction = 304";
		};
		class CA_Funds_Label : RscText {
			idc = 14028;
			x = 0.168488;
			y = 0.142689;
			w = 0.3;
			style = ST_RIGHT;
		};
		class CA_Tab_Label : RscText_SubTitle {
			idc = 14030;
			x = 0.335;
			y = 0.0107146;
			w = 0.3;
			style = ST_CENTER;
			text = $STR_WF_COMMAND_SquadSettingsLabel;
		};
		class CA_SetTask : RscButton {
			idc = 14032;
			x = 0.0440328;
			y = 0.621904;
			w = 0.42;
			text = $STR_WF_COMMAND_TaskTO_Set;
			action = "MenuAction = 306";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		/* HQ Team units details */
		class CA_UnitsDetailList : RscListBoxA {
			idc = 14041;
			x = 0.00518636;
			y = 0.527339;
			w = 0.463445;
			h = 0.366386;
			columns[] = {0.01, 0.19};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			rowHeight = 0.05;
			sizeEx = 0.023;
			onLBSelChanged = "MenuAction = 401";
			onLBDblClick = "MenuAction = 3";
			
			/* spezial */
			colorText[] = {0, 0.875, 0, 0.8};
			colorSelect[] = {0, 0.875, 0, 0.8};
			colorSelect2[] = {0, 0.875, 0, 0.8};
			/* extra */
			colorSelectBackground[] = {0, 0, 0, 0.5};
			colorSelectBackground2[] = {0, 0, 0, 0.5};
		};	
		class CA_FUnflip : RscButton {
			idc = 14042;
			x = 0.24384;
			y = 0.900286;
			w = 0.22;
			text = $STR_WF_COMMAND_UnflipButton;
			action = "MenuAction = 402";
		};	
		class CA_FDisband : RscButton {
			idc = 14043;
			x = 0.00493164;
			y = 0.900296;
			w = 0.22;
			text = $STR_WF_TEAM_DisbandButton;
			action = "MenuAction = 403";
		};		
		class WF_Con1 : RscClickableText {
			idc = 14500;
			x = 0.136976;
			y = 0.0589629;
			w = 0.072;
			h = 0.072;
			text = "\CA\warfare2\Images\con_barracks.paa";
			tooltip = $STR_WF_TOOLTIP_TeamOrders_Con1;
			action = "MenuAction = 601";
		};
		class WF_Con2 : WF_Con1 {
			idc = 14501;
			x = 0.290419;
			text = "Client\Images\con_task.paa";
			tooltip = $STR_WF_TOOLTIP_TeamOrders_Con2;
			action = "MenuAction = 602";
		};
		class WF_Con3 : WF_Con1 {
			idc = 14502;
			x = 0.213698;
			text = "\CA\warfare2\Images\con_hq.paa";
			tooltip = $STR_WF_TOOLTIP_TeamOrders_Con3;
			action = "MenuAction = 603";
		};
		/* Separators */
		class LineTRH1 : RscText {
			idc = 14900;
			x = 0.00554727;
			y = 0.518182;
			w = 0.458181;
			h = WFBE_SPT1;
			colorBackground[] = WFBE_SPC1;
		};
		class LineTRH2 : LineTRH1 {
			idc = 14901;
			x = 0.00554727;
			y = 0.845784;
		};
		class LineTRH3 : LineTRH1 {
			idc = 14902;
			x = 0.00554727;
			y = 0.746904;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892507;
			y = 0.953825;
			action = "MenuAction = 4";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.955773;
			y = 0.953825;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Tactical Menu. | ALL DONE!
class RscMenu_Tactical {
	movingEnable = 1;
	idd = 17000;
	onLoad = "_this ExecVM 'Client\GUI\GUI_Menu_Tactical.sqf'";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.000960961;
			y = 0.00128125;
			w = 0.999759;
			h = 1.00023;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.000960961;
			y = 0.00128125;
			w = 0.999759;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.000960961;
			y = 0.94901125;
			w = 0.999759;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.000960961;
			y = 0.05278125;
			w = 0.999759;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 17002;
			x = 0.374789;
			y = 0.0574369;
			w = 0.625427;
			h = 0.888975;
			ShowCountourInterval = 1;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};
		class Title_Tactical : RscText_Title {
			idc = 17003;
			x = 0.00561695;
			y = 0.00999998;
			w = 0.3;
			text = $STR_WF_MAIN_TacticalMenu;
		};
		class CA_Artillery_SubTitle : RscText_SubTitle {
			idc = 17004;
			x = 0.00434637;
			y = 0.0596783;
			w = 0.2;
			text = $STR_WF_TACTICAL_Artillery;
		};
		class CA_Artillery_Label_Radius : RscText {
			idc = 17030;
			x = 0.00602637;
			y = 0.182926;
			w = 0.2;
			text = $STR_WF_TACTICAL_ArtilleryRadius;
		};
		class CA_Artillery_Label_Unit : RscText {
			idc = 17031;
			x = 0.00434496;
			y = 0.14259;
			w = 0.2;
			text = $STR_WF_TACTICAL_Artillery;
		};
		class CA_Artillery_Slider : RscXSliderH {
			idc = 17005;
			x = 0.14652;
			y = 0.188795;
			w = 0.224033;
			h = 0.029412;
		};
		class CA_SetFMission_Button : RscButton {
			idc = 17006;
			x = 0.12047;
			y = 0.515631;
			w = 0.25;
			text = $STR_WF_TACTICAL_ArtillerySetFireMission;
			action = "MenuAction = 1";
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_FireMission_Button : RscButton {
			idc = 17007;
			x = 0.12047;
			y = 0.566833;
			w = 0.25;
			text = $STR_WF_TACTICAL_ArtilleryCallFireMission;
			action = "MenuAction = 2";
		};
		class CA_Artillery_Combo : RscCombo {
			idc = 17008;
			x = 0.145945;
			y = 0.146217;
			w = 0.147;
			h = 0.029412;
			onLBSelChanged = "MenuAction = 200";
		};
		class CA_Support_SubTitle : RscText_SubTitle {
			idc = 17009;
			x = 0.00518464;
			y = 0.622955;
			w = 0.2;
			text = $STR_WF_TACTICAL_Support;
		};
		class CA_Artillery_Label_Status : RscText {
			idc = 17032;
			x = 0.00602637;
			y = 0.102254;
			w = 0.2;
			text = $STR_WF_TACTICAL_ArtilleryStatus;
		};
		class CA_ArtilleryTimeout : RscStructuredText {
			idc = 17016;
			x = 0.139245;
			y = 0.107786;
			w = 0.213025;
			size = 0.03;
			shadow = 2;
		};
		class SupportList : RscListBox {
			idc = 17019;
			x = 0.00602497;
			y = 0.663556;
			w = 0.365965;
			h = 0.237187;
			rowHeight = 0.01;
			sizeEx = 0.026;
		};
		class CA_Button_Use : RscButton {
			idc = 17020;
			x = 0.22021;
			y = 0.905171;
			w = 0.15;
			text = $STR_WF_TACTICAL_RequestButton;
			action = "MenuAction = 20";
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_SupportCost_Label : RscText {
			idc = 17026;
			x = 0.0119054;
			y = 0.907169;
			w = 0.11;
			text = "$STR_WF_TACTICAL_Price";
			sizeEx = 0.032;
		};
		class CA_SupportCost : RscText {
			idc = 17021;
			x = 0.111905;
			y = 0.907169;
			w = 0.11;
			sizeEx = 0.032;
			colorText[] = {1, 0, 0, 1};
		};
		class CA_InformationText : RscStructuredText {
			idc = 17022;
			x = 0.380816;
			y = 0.0188458;
			w = 0.614286;
			h = 0.035;
			size = 0.03;
			class Attributes {
				align = "center";
			};
		};
		class Ca_ArtilleryToggle : RscClickableText {
			idc = 17023;
			x = 0.310672;
			y = 0.121233;
			w = 0.064;
			h = 0.064;
			text = "Client\Images\tog_arty.paa";
			action = "MenuAction = 40";
			tooltip = $STR_WF_TOOLTIP_ArtilleryToggle;
		};
		class CA_ArtilleryList : RscListBoxA {
			idc = 17024;
			x = 0.00459768;
			y = 0.270084;
			w = 0.365209;
			h = 0.235;
			columns[] = {0.02, 0.55};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			rowHeight = 0.05;
			sizeEx = 0.023;
			
			/* extra */
			colorSelectBackground[] = {0, 0, 0, 0.5};
			colorSelectBackground2[] = {0, 0, 0, 0.5};
			
			onLBSelChanged = "MenuAction = 60";
		};	
		class CA_ArtilleryTable_Label : RscText {
			idc = 17025;
			x = 0.00495766;
			y = 0.226604;
			w = 0.339999;
		};
		/* Separators */
		class LineTRH1 : RscText {
			x = 0.00638635;
			y = 0.61566;
			w = 0.364063;
			h = WFBE_SPT1;
			colorBackground[] = WFBE_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892328;
			y = 0.953825;
			action = "MenuAction = 30";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.956614;
			y = 0.953825;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Upgrade Menu. | ALL DONE!
class RscMenu_Upgrade {
	movingEnable = 1;
	idd = 18000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_Upgrade.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.0933989;
			y = 0.151421;
			w = 0.813204;
			h = 0.699949;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.0933989;
			y = 0.151421;
			w = 0.813204;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.0933989;
			y = 0.798870;
			w = 0.813204;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.0933989;
			y = 0.202921;
			w = 0.813204;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Title_Upgrade : RscText_Title {
			idc = 18801;
			x = 0.1;
			y = 0.157621;
			w = 0.399999;
			text = $STR_WF_MAIN_UpgradeMenu;
		};
		class CA_Label_TimeLeft : RscText {
			idc = 18802;
			x = 0.443216;
			y = 0.158741;
			w = 0.45;
			style = ST_RIGHT;
		};
		/* Aircraft */
		class LineTRH1 : RscText {
			x = 0.812039;
			y = 0.3;
			w = 0.0025;
			h = 0.4;
			colorBackground[] = {0.6941,0.6902,0.4431,1};
		};
		class LineTRH2 : LineTRH1 {
			x = 0.812674;
			y = 0.336547;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH3 : LineTRH1 {
			x = 0.763215;
			y = 0.439469;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH4 : LineTRH1 {
			x = 0.763394;
			y = 0.540148;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH5 : LineTRH1 {
			x = 0.812737;
			y = 0.5648;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH6 : LineTRH1 {
			x = 0.700909;
			y = 0.640347;
			w = 0.113265;
			h = 0.00300001;
		};
		class LineTRH7 : LineTRH1 {
			x = 0.76336;
			y = 0.439833;
			w = 0.0025;
			h = 0.0300001;
		};
		class LineTRH8 : LineTRH1 {
			x = 0.76336;
			y = 0.540672;
			w = 0.0025;
			h = 0.0300001;
		};
		class LineTRH9 : LineTRH1 {
			x = 0.76336;
			y = 0.640393;
			w = 0.0025;
			h = 0.0300001;
		};
		class LineTRH10 : LineTRH1 {
			x = 0.700997;
			y = 0.640154;
			w = 0.0025;
			h = 0.0300001;
		};
		class LineTRH11 : LineTRH1 {
			x = 0.862185;
			y = 0.352101;
			w = 0.0025;
			h = 0.14;
		};
		/* Heavy-Vehicle */
		class LineTRH20 : LineTRH1 {
			x = 0.593264;
			y = 0.3;
			w = 0.0025;
			h = 0.4;
		};
		class LineTRH21 : LineTRH1 {
			x = 0.545447;
			y = 0.439629;
			w = 0.0489796;
			h = 0.00300001;
		};
		class LineTRH22 : LineTRH1 {
			x = 0.545713;
			y = 0.439833;
			w = 0.0025;
			h = 0.0300001;
		};
		class LineTRH23 : LineTRH1 {
			x = 0.545713;
			y = 0.496975;
			w = 0.0025;
			h = 0.185;
		};
		/* Light-Vehicle */
		class LineTRH30 : LineTRH1 {
			x = 0.374489;
			y = 0.3;
			w = 0.0025;
			h = 0.4;
		};
		class LineTRH31 : LineTRH1 {
			x = 0.375701;
			y = 0.339909;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH32 : LineTRH1 {
			x = 0.327268;
			y = 0.540469;
			w = 0.0489797;
			h = 0.00300001;
		};
		class LineTRH33 : LineTRH1 {
			x = 0.327226;
			y = 0.540672;
			w = 0.0025;
			h = 0.0300001;
		};
		/* Barracks */
		class LineTRH40 : LineTRH1 {
			x = 0.186325;
			y = 0.3;
			w = 0.0025;
			h = 0.4;
		};
		class LineTRH41 : LineTRH1 {
			x = 0.187465;
			y = 0.339909;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH42 : LineTRH1 {
			x = 0.137885;
			y = 0.439629;
			w = 0.05;
			h = 0.00300001;
		};
		class LineTRH43 : LineTRH1 {
			x = 0.138151;
			y = 0.439831;
			w = 0.0025;
			h = 0.0300001;
		};
		class LineTRH44 : LineTRH1 {
			x = 0.138149;
			y = 0.492493;
			w = 0.0025;
			h = 0.185;
		};
		/* Normal GUI Ctrls */
		class WF_Con1 : RscClickableText {
			idc = 18001;
			x = 0.156325;
			y = 0.238231;
			w = 0.064;
			h = 0.064;
			text = "Client\Images\wf_b.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'infantry'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con2 : WF_Con1 {
			idc = 18002;
			x = 0.34449;
			y = 0.238231;
			text = "Client\Images\wf_lvf.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'light'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con3 : WF_Con1 {
			idc = 18003;
			x = 0.561224;
			y = 0.238231;
			text = "Client\Images\wf_hvf.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'heavy'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con4 : WF_Con1 {
			idc = 18004;
			x = 0.779999;
			y = 0.238231;
			text = "Client\Images\wf_air.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'air'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con5 : WF_Con1 {
			idc = 18005;
			x = 0.724129;
			y = 0.457148;
			text = "Client\Images\wf_par.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'parachutist'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con6 : WF_Con1 {
			idc = 18006;
			x = 0.723951;
			y = 0.557871;
			text = "Client\Images\wf_uav.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'uav'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con7 : WF_Con1 {
			idc = 18007;
			x = 0.400177;
			y = 0.329419;
			text = "Client\Images\wf_sup.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'supply'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con8 : WF_Con1 {
			idc = 18008;
			x = 0.287599;
			y = 0.55879;
			text = "Client\Images\wf_fia.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'ambuSpawn'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con9 : WF_Con1 {
			idc = 18009;
			x = 0.836891;
			y = 0.32942;
			text = "Client\Images\wf_lif.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'airlift'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con10 : WF_Con1 {
			idc = 18010;
			x = 0.836891;
			y = 0.558514;
			text = "Client\Images\wf_fla.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'flares'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con11 : WF_Con1 {
			idc = 18011;
			x = 0.50587;
			y = 0.457871;
			text = "Client\Images\wf_art.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'artillery'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con12 : WF_Con1 {
			idc = 18012;
			x = 0.660492;
			y = 0.657666;
			text = "Client\Images\wf_mib.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'icbm'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con13 : WF_Con1 {
			idc = 18013;
			x = 0.212198;
			y = 0.329419;
			text = "Client\Images\wf_fas.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'fasttravel'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con14 : WF_Con1 {
			idc = 18014;
			x = 0.100274;
			y = 0.456988;
			text = "Client\Images\wf_gea.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'gear'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con15 : WF_Con1 {
			idc = 18015;
			x = 0.100274;
			y = 0.658312;
			text = "Client\Images\wf_amm.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'ammo'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con16 : WF_Con1 {
			idc = 18016;
			x = 0.72413;
			y = 0.658312;
			text = "Client\Images\wf_eas.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'easa'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con17 : WF_Con1 {
			idc = 18017;
			x = 0.837035;
			y = 0.457147;
			text = "Client\Images\wf_pas.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'paradrop'";
			onMouseExit = "displayUpgrade = ''";
		};
		class WF_Con18 : WF_Con1 {
			idc = 18018;
			x = 0.505869;
			y = 0.657837;
			text = "Client\Images\wf_shl.paa";
			action = "MenuAction = 1";
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)"; 
			onMouseEnter = "displayUpgrade = 'shells'";
			onMouseExit = "displayUpgrade = ''";
		};
		/* Tooltip */
		class TooltipHelper : RscText {
			idc = 18998;
			x = 0.0;
			y = 0.0;
			w = 0.0;
			h = 0.0;
			style = 128;
			colorBackground[] = {0, 0, 0, 0.6};
		};
		class TooltipHelperText : RscStructuredText {
			idc = 18999;
			x = 0.0;
			y = 0.0;
			w = 0.0;
			h = 0.0;
			size = 0.035;
			class Attributes {
				font = "Zeppelin32";
				color = "#B6F862";
				align = "left";
				shadow = true;
			};
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.799231;
			y = 0.804806;
			action = "MenuAction = 2";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.862497;
			y = 0.804806;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Service Menu. | ALL DONE!
class RscMenu_Service {
	movingEnable = 1;
	idd = 20000;
	onLoad = "ExecVM ""Client\GUI\GUI_Menu_Service.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.157263;
			y = 0.151421;
			w = 0.687155;
			h = 0.699949;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.157263;
			y = 0.151421;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.157263;
			y = 0.798870;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.157263;
			y = 0.202921;
			w = 0.687155;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Title_Service : RscText_Title {
			idc = 20001;
			x = 0.161008;
			y = 0.157731;
			w = 0.3;
			text = $STR_WF_SupportMenu;
		};
		class CA_UnitList : RscListBox {
			idc = 20002;
			x = 0.162101;
			y = 0.209804;
			w = 0.677143;
			h = 0.429553;
			rowHeight = 0.025;
			sizeEx = 0.035;
		};
		class CA_Rearm_Button : RscButton {
			idc = 20003;
			x = 0.161261;
			y = 0.650391;
			w = 0.22;
			text = $STR_WF_SERVICE_Rearm;
			action = "MenuAction = 1";
		};
		class CA_Repair_Button : RscButton {
			idc = 20004;
			x = 0.50748;
			y = 0.650391;
			w = 0.22;
			text = $STR_WF_SERVICE_Repair;
			action = "MenuAction = 2";
		};
		class CA_Refuel_Button : RscButton {
			idc = 20005;
			x = 0.161261;
			y = 0.697899;
			w = 0.22;
			text = $STR_WF_SERVICE_Refuel;
			action = "MenuAction = 3";
		};
		class CA_Heal_Button : RscButton {
			idc = 20008;
			x = 0.50748;
			y = 0.697899;
			w = 0.22;
			text = $STR_WF_SERVICE_Heal;
			action = "MenuAction = 5";
		};
		class CA_EASA_Button : RscButton {
			idc = 20010;
			x = 0.161261;
			y = 0.747311;
			w = 0.565918;
			text = $STR_WF_SERVICE_EASA;
			action = "MenuAction = 7";
		};
		class CA_LabelRearm: RscText {
			idc = 20011;
			x = 0.388739;
			y = 0.653752;
			w = 0.12;
		};
		class CA_LabelRepair : CA_LabelRearm {
			idc = 20012;
			x = 0.734957;
			y = 0.653752;
			w = 0.12;
		};
		class CA_LabelRefuel : CA_LabelRearm {
			idc = 20013;
			x = 0.388739;
			y = 0.699691;
			w = 0.12;
		};
		class CA_LabelHeal : CA_LabelRearm {
			idc = 20014;
			x = 0.734957;
			y = 0.699691;
			w = 0.12;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.737046;
			y = 0.803685;
			action = "MenuAction = 8";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.800311;
			y = 0.803685;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- UnitCamera Menu. | ALL DONE!
class RscMenu_UnitCamera {
	movingEnable = 1;
	idd = 21000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_UnitCamera.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.000119537;
			y = 0.70044;
			w = 0.999761;
			h = 0.298829;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.000119537;
			y = 0.70044;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.000119537;
			y = 0.946769;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.000119537;
			y = 0.75194;
			w = 0.999761;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Title_UnitCam : RscText_Title {
			idc = 21001;
			x = 0.00470497;
			y = 0.706961;
			w = 0.3;
			text = $STR_WF_TACTICAL_UnitCam;
		};
		class CA_Camera_UnitList : RscListBox {
			idc = 21002;
			x = -0.000335053;
			y = 0.755239;
			w = 0.311932;
			h = 0.190877;
			rowHeight = 0.01;
			sizeEx = 0.024;
			onLBSelChanged = "MenuAction = 101";
		};
		class CA_SquadKI_Label : RscText {
			idc = 21003;
			x = 0.312271;
			y = 0.714061;
			w = 0.3;
			colorText[] = {0.2588, 0.7137, 1, 1};
			text = $STR_WF_UNITCAM_SquadKI;
		};
		class CA_Camera_AIList : RscListBox {
			idc = 21004;
			x = 0.312269;
			y = 0.754063;
			w = 0.311932;
			h = 0.190877;
			rowHeight = 0.01;
			sizeEx = 0.024;
			onLBSelChanged = "MenuAction = 102";
		};
		class CA_Camera_Mode : RscText {
			idc = 21005;
			x = 0.629077;
			y = 0.713836;
			w = 0.3;
			colorText[] = {0.2588, 0.7137, 1, 1};
			text = $STR_WF_UNITCAM_CamMode;
		};
		class CA_Camera_Combo : RscCombo {
			idc = 21006;
			x = 0.831595;
			y = 0.711259;
			w = 0.163193;
			h = 0.035;
			onLBSelChanged = "MenuAction = 103";
		};
		class CA_MiniMap : RscMapControl {
			idc = 21007;
			x = 0.625041;
			y = 0.75514;
			w = 0.374504;
			h = 0.191614;
			ShowCountourInterval = 1;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};		
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.954933;
			y = 0.953825;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Prameters Display. | ALL DONE!
class RscDisplay_Parameters {
	movingEnable = 1;
	idd = 22000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Display_Parameters.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = -0.000478864;
			y = 0.151421;
			w = 1.00096;
			h = 0.699949;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = -0.000478864;
			y = 0.151421;
			w = 1.00096;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = -0.000478864;
			y = 0.798870;
			w = 1.00096;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = -0.000478864;
			y = 0.202921;
			w = 1.00096;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Title_Parameter : RscText_Title {
			idc = 22002;
			x = 0.00510308;
			y = 0.157759;
			w = 0.3;
			text = $STR_WF_PARAMETER_Parameters;
		};
		class LB_ParamsTitles : RscListBoxA {
			idc = 22003;
			columns[] = {0.01, 0.55};
			rowHeight = 0.036;
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			x = 0.00204286;
			y = 0.211603;
			w = 0.997959;
			h = 0.579722;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892509;
			y = 0.804806;
			action = "MenuAction = 1";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.955774;
			y = 0.804806;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- EASA Menu. | ALL DONE!
class RscMenu_EASA {
	movingEnable = 1;
	idd = 23000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_EASA.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.157263;
			y = 0.200721;
			w = 0.687155;
			h = 0.601349;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.157263;
			y = 0.200721;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.157263;
			y = 0.749570;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.157263;
			y = 0.252221;
			w = 0.687155;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class Title_EASA : RscText_Title {
			idc = 23002;
			x = 0.162105;
			y = 0.207843;
			w = 0.6;
			text = $STR_WF_EASA;
		};
		class LB_EASA : RscListBoxA {
			idc = 23003;
			columns[] = {0.01, 0.16};
			rowHeight = 0.036;
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			x = 0.162186;
			y = 0.263187;
			w = 0.67689;
			h = 0.476481;
			onLBDblClick = "MenuAction = 101";
		};
		class CA_Purchase : RscButton {
			idc = 22004;
			x = 0.613615;
			y = 0.758018;
			w = 0.1;
			text = $STR_WF_Purchase;
			action = "MenuAction = 101";
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.799471;
			y = 0.755506;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

//--- Economy Menu. | ALL DONE!
class RscMenu_Economy {
	movingEnable = 1;
	idd = 23000;
	onLoad = "_this ExecVM 'Client\GUI\GUI_Menu_Economy.sqf'";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.0318137;
			y = 0.2004;
			w = 0.938056;
			h = 0.59934;
			moving = 1;
			colorBackground[] = WFBE_Background_Color;
		};
		class Background_H : RscText {
			x = 0.0318137;
			y = 0.2004;
			w = 0.938056;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.0318137;
			y = 0.74724;
			w = 0.938056;
			h = 0.0525;
			moving = 1;
			colorBackground[] = WFBE_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.0318137;
			y = 0.2519;
			w = 0.938056;
			h = WFBE_Background_Border_Thick;
			colorBackground[] = WFBE_Background_Border;
		};
	};
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 23002;
			x = 0.5;
			y = 0.254636;
			w = 0.469125;
			h = 0.492337;
			ShowCountourInterval = 1;
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};
		class Title_CommanderMenu : RscText_Title {
			idc = 23003;
			x = 0.0367093;
			y = 0.207199;
			w = 0.3;
			text = $STR_WF_MAIN_EconomyMenu;
		};
		/* Workers */
		class CA_LabelPartWorkers : RscText_SubTitle {
			idc = 23008;
			x = 0.0322372;
			y = 0.264119;
			w = 0.25;
			text = $STR_WF_ECONOMY_Workers;
		};
		class CA_HireWorker_Button : RscButton {
			idc = 23004;
			x = 0.0372772;
			y = 0.315322;
			w = 0.279999;
			text = $STR_WF_ECONOMY_HireWorker;
			action = "MenuAction = 1";
		};
		class CA_LabelWorkers : RscText {
			idc = 23005;
			x = 0.331681;
			y = 0.317564;
			w = 0.15;
			colorText[] = {1, 0, 0, 1};
		};
		class CA_DisbandWorker_Button : RscButton {
			idc = 23006;
			x = 0.0372786;
			y = 0.373248;
			w = 0.279999;
			text = $STR_WF_ECONOMY_DisbandWorker;
			action = "MenuAction = 2";
		};
		class CA_Workers_Combo : RscCombo {
			idc = 23007;
			x = 0.33168;
			y = 0.37601;
			w = 0.15;
			h = 0.035;
			onLBSelChanged = "MenuAction = 100";
		};
		/* Income */
		class CA_LabelPartIncome : CA_LabelPartWorkers {
			idc = 23009;
			x = 0.0322358;
			y = 0.456346;
			w = 0.25;
			text = $STR_WF_ECONOMY_Income_Sys;
		};
		class CA_Slider_Income : RscXSliderH {
			idc = 23010;
			x = 0.0372786;
			y = 0.514272;
			w = 0.333109;
			h = 0.029412;
		};
		class CA_LabelIncomePercent : RscText {
			idc = 23011;
			x = 0.394873;
			y = 0.512032;
			w = 0.15;
		};
		class CA_IncomeSet_Button : RscButton {
			idc = 23012;
			x = 0.0372772;
			y = 0.567717;
			w = 0.334;
			text = $STR_WF_ECONOMY_SetIncome;
			action = "MenuAction = 3";
		};
		class CA_LabelIncomeCommander : RscText {
			idc = 23013;
			x = 0.0372772;
			y = 0.634608;
			w = 0.399999;
		};
		class CA_LabelPlayerCommander : CA_LabelIncomeCommander {
			idc = 23014;
			x = 0.0372772;
			y = 0.687535;
			w = 0.399999;
		};
		/* Selling Structures */
		class CA_Sell : RscButton {
			idc = 23015;
			x = 0.501454;
			y = 0.757255;
			w = 0.28; 
			text = $STR_WF_ECONOMY_SellStructure;
			action = "MenuAction = 105";
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		/* Respawn Supply Truck Debug */
		class CA_RespST_Button : RscClickableText {
			idc = 23016;
			x = 0.0368904;
			y = 0.751251;
			w = 0.05;
			h = 0.05;
			text = "Client\Images\picturepapercar_ca.paa";
			action = "MenuAction = 4";
			tooltip = $STR_WF_TOOLTIP_RespawnST;
		};
		/* Separators */
		class LineTRH1 : RscText {
			x = 0.0349591;
			y = 0.449622;
			w = 0.459861;
			h = WFBE_SPT1;
			colorBackground[] = WFBE_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.861415;
			y = 0.754385;
			action = "MenuAction = 5";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.924681;
			y = 0.754385;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
