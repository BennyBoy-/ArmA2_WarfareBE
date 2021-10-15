{ctrlEnable [_x, false]} forEach [11002, 11005, 11006, 11007, 11008];

_enable = false;
if ((barracksInRange || lightInRange || heavyInRange || aircraftInRange || hangarInRange || depotInRange) && (player == leader WFBE_Client_Team)) then {_enable = true};
ctrlEnable [11001,_enable];
ctrlEnable [11006,commandInRange && (player == leader WFBE_Client_Team)]; //--- Special Menu

MenuAction = -1;
WFBE_ForceUpdate = true;

while {alive player && dialog} do {
	if (side player != sideJoined) exitWith {closeDialog 0};
	if (!dialog) exitWith {};

	//--- Build Units.
	_enable = false;
	if ((barracksInRange || lightInRange || heavyInRange || aircraftInRange || hangarInRange || depotInRange) && (player == leader WFBE_Client_Team)) then {_enable = true};
	ctrlEnable [11001,_enable];
	ctrlEnable [11002,gearInRange];

	_enable = false; //added-MrNiceGuy
	if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_enable = true}};
	ctrlEnable [11005,_enable]; //--- Team Orders
	ctrlEnable [11008,_enable]; //--- Commander Menu
	ctrlEnable [11006,commandInRange && (player == leader WFBE_Client_Team)]; //--- Special Menu
	ctrlEnable [11007,commandInRange]; //--- Upgrade Menu
	
	//--- Uptime.
	_uptime = Call GetTime; //added-MrNiceGuy
	ctrlSetText [11015,Format[localize 'STR_WF_MAIN_Uptime',_uptime select 0,_uptime select 1,_uptime select 2, _uptime select 3]];
	
	//--- Buy Units.
	if (MenuAction == 1) exitWith {
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_BuyUnits";
	};
	
	//--- Buy Gear.
	if (MenuAction == 2) exitWith {
		MenuAction = -1;
		closeDialog 0;
		createDialog "WFBE_BuyGearMenu";
	};	
	
	//--- Team Menu.
	if (MenuAction == 3) exitWith {
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Team";
	};
	
	//--- Voting Menu.
	if (MenuAction == 4) exitWith {
		MenuAction = -1;
		_skip = false;
		if ((WFBE_Client_Logic getVariable "wfbe_votetime") <= 0) then {_skip = true};
		if (!_skip) then {
			closeDialog 0;
			createDialog "WFBE_VoteMenu";
			if !(_skip) exitWith {};
		};
		["RequestCommanderVote", [sideJoined, name player]] Call WFBE_CO_FNC_SendToServer;
		voted = true;
		waitUntil {(WFBE_Client_Logic getVariable "wfbe_votetime") > 0 || !dialog || !alive player};
		if (!alive player || !dialog) exitWith {};
		closeDialog 0;
		createDialog "WFBE_VoteMenu";
	};
	
	//--- Unflip Vehicle.
	if (MenuAction == 10) then { //added-MrNiceGuy
		MenuAction = -1;
		_vehicle = vehicle player;
		if (player != _vehicle) then {
			if (getPos _vehicle select 2 > 3 && !surfaceIsWater (getPos _x)) then {
				[_vehicle, getPos _vehicle, 15] Call PlaceSafe;
			} else {
				_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 0.5];
				_vehicle setVelocity [0,0,-0.5];
			};
		};
		if (player == _vehicle) then {
			_objects = player nearEntities[["Car","Motorcycle","Tank"],10];
			if (count _objects > 0) then {		
				{
					if (getPos _x select 2 > 3 && !surfaceIsWater (getPos _x)) then {
						[_x, getPos _x, 15] Call PlaceSafe;
					} else {
						_x setPos [getPos _x select 0, getPos _x select 1, 0.5];
						_x setVelocity [0,0,-0.5];
					};
				} forEach _objects;
			};
		};
	};
	
	//--- Headbug Fix.
	if (MenuAction == 11) then { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		titleCut["","BLACK FADED",0];
		_pos = position player;
		_vehi = "Lada1" createVehicle [0,0,0];
		player moveInCargo _vehi;
		deleteVehicle _vehi;
		player setPos _pos;
		titleCut["","BLACK IN",5];
	};
	
	//--- Display Parameters.
	if (MenuAction == 12) exitWith { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscDisplay_Parameters";
	};

	//--- Command Menu.
	if (MenuAction == 5) exitWith { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Command";
	};
	
	//--- Tactical Menu.
	if (MenuAction == 6) exitWith { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Tactical";
	};

	//--- Upgrade Menu.
	if (MenuAction == 7) exitWith { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "WFBE_UpgradeMenu";
	};	
	
	//--- Economy Menu.
	if (MenuAction == 8) exitWith { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Economy";
	};

	//--- Service Menu.
	if (MenuAction == 9) exitWith { //added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Service";
	};
	
	//--- Groups Menu.
	if (MenuAction == 13) exitWith {
		MenuAction = -1;
		closeDialog 0;
		createDialog "WFBE_GroupsMenu";
	};
	
	sleep 0.1;
};