//*****************************************************************************************
//Description: Creates a small construction site.
//*****************************************************************************************
Private ["_construct","_constructed","_direction","_group","_index","_logik","_nearLogic","_objects","_position","_rlType","_side","_sideID","_site","_siteName","_startTime","_structures","_structuresNames","_time","_timeNextUpdate","_type"];
_type = _this select 0;
_side = _this select 1;
_position = _this select 2;
_direction = _this select 3;
_index = _this select 4;
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
_sideID = (_side) Call WFBE_CO_FNC_GetSideID;

_time = ((missionNamespace getVariable Format ["WFBE_%1STRUCTURETIMES",str _side]) select _index) / 2;
	
_siteName = missionNamespace getVariable Format["WFBE_%1CONSTRUCTIONSITE",str _side];

_structures = missionNamespace getVariable Format ['WFBE_%1STRUCTURES',str _side];
_structuresNames = missionNamespace getVariable Format ['WFBE_%1STRUCTURENAMES',str _side];
_rlType = _structures select (_structuresNames find _type);

_startTime = time;
_timeNextUpdate = _startTime + _time;

_objects = [];
if (WF_A2_Arrowhead) then {_objects = [[_siteName,[0,0,-0.000230789],359.997,1,0],["Paleta2",[0.416992,-5.62012,-0.305746],0.0130822,1,0],["Land_Barrel_sand",[-5.59448,3.26929,6.29425e-005],359.997,1,0],["Paleta1",[-2.62976,-6.04736,5.53131e-005],0.0130822,1,0],["Barrel4",[6.63696,0.694336,0.000753403],359.991,1,0],["Land_Barrel_sand",[-6.73267,2.06372,6.10352e-005],359.997,1,0],["Barrel5",[7.19604,2.8855,0.00028801],0.0135841,1,0],["Barrel1",[6.08984,5.5415,0.00028801],0.0135841,1,0],["Land_Barrel_sand",[-7.13452,4.40747,6.29425e-005],359.997,1,0],["RoadBarrier_long",[0.221924,-8.58496,0.00206566],0.0130822,1,0],["Land_Barrel_sand",[-8.27271,2.80054,6.10352e-005],359.997,1,0],["Barrels",[-7.91895,-4.09668,0.00037384],0.0128253,1,0],["RoadCone",[-10.4381,-8.94336,0.000131607],0.0119093,1,0],["RoadCone",[11.1655,-8.79932,0.00034523],359.991,1,0],["RoadCone",[-10.5692,12.6655,0.000509262],359.948,1,0],["RoadCone",[11.0276,12.3904,0.000509262],359.948,1,0]]};
if (WF_A2_Vanilla || WF_A2_CombinedOps) then {_objects = [[_siteName,[0,0,-0.000230789],359.997,1,0],["Paleta2",[0.416992,-5.62012,-0.305746],0.0130822,1,0],["Land_Barrel_sand",[-5.59448,3.26929,6.29425e-005],359.997,1,0],["Paleta1",[-2.62976,-6.04736,5.53131e-005],0.0130822,1,0],["Barrel4",[6.63696,0.694336,0.000753403],359.991,1,0],["Land_Ind_BoardsPack2",[6.41797,-2.52051,0.000915527],270,1,0],["Land_Barrel_sand",[-6.73267,2.06372,6.10352e-005],359.997,1,0],["Barrel5",[7.19604,2.8855,0.00028801],0.0135841,1,0],["Barrel1",[6.08984,5.5415,0.00028801],0.0135841,1,0],["Land_Barrel_sand",[-7.13452,4.40747,6.29425e-005],359.997,1,0],["RoadBarrier_long",[0.221924,-8.58496,0.00206566],0.0130822,1,0],["Land_Barrel_sand",[-8.27271,2.80054,6.10352e-005],359.997,1,0],["Barrels",[-7.91895,-4.09668,0.00037384],0.0128253,1,0],["Land_Ind_BoardsPack1",[6.40332,-7.16162,0.000520706],0.0130822,1,0],["Land_Ind_BoardsPack1",[-6.18384,-8.09961,0.000535965],50.0093,1,0],["RoadCone",[-10.4381,-8.94336,0.000131607],0.0119093,1,0],["RoadCone",[11.1655,-8.79932,0.00034523],359.991,1,0],["RoadCone",[-10.5692,12.6655,0.000509262],359.948,1,0],["RoadCone",[11.0276,12.3904,0.000509262],359.948,1,0]]};
_construct = Compile PreprocessFile "ca\modules\dyno\data\scripts\objectMapper.sqf";
_constructed = ([_position,_direction,_objects] Call _construct);

//--- Create the logic.
(createGroup sideLogic) createUnit ["LocationLogicStart",_position,[],0,"NONE"];

_nearLogic = objNull;
if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 0) then {
	//--- Grab the logic.
	_nearLogic = _position nearEntities [["LocationLogicStart"],15];
	_nearLogic = [_position, _nearLogic] Call WFBE_CO_FNC_GetClosestEntity;
	
	if (isNull _nearLogic) exitWith {};
	
	//--- Position the logic.
	_nearLogic setPos _position;
	
	_nearLogic setVariable ["WFBE_B_Type", _rlType];

	waitUntil {time >= _timeNextUpdate};
	_timeNextUpdate = _startTime + _time * 2;
} else {
	//--- Grab the logic.
	_nearLogic = _position nearEntities [["LocationLogicStart"],15];
	_nearLogic = [_position, _nearLogic] Call WFBE_CO_FNC_GetClosestEntity;
	
	if (isNull _nearLogic) exitWith {};
	
	//--- Position the logic.
	_nearLogic setPos _position;
	
	//--- Instanciate the logic.
	_nearLogic setVariable ["WFBE_B_Completion", 0];
	_nearLogic setVariable ["WFBE_B_CompletionRatio", 1.1];
	_nearLogic setVariable ["WFBE_B_Direction", _direction];
	_nearLogic setVariable ["WFBE_B_Position", _position];
	_nearLogic setVariable ["WFBE_B_Repair", false];
	_nearLogic setVariable ["WFBE_B_Type", _rlType];
	
	//--- Add the logic to the list.
	_logik setVariable ["wfbe_structures_logic", (_logik getVariable "wfbe_structures_logic") + [_nearLogic]];
	
	//--- Awaits for 50% of completion.
	while {true} do {
		sleep 1;
		if ((_nearLogic getVariable "WFBE_B_Completion") >= 50) exitWith {};
	};
};

if (WF_A2_Arrowhead) then {_objects = [["Land_WoodenRamp",[-2.45703,-0.593262,0.357508],270,1,0],["Land_WoodenRamp",[-2.5083,1.3811,0.357508],270,1,0],[_siteName,[4.6333,0.338135,0.00393867],90,1,0],["Land_Dirthump02_EP1",[-0.587891,8.57935,0.00207901],359.967,1,0],["Land_Dirthump01_EP1",[-3.97363,-8.49219,-4.57764e-005],29.9804,1,0],["Land_WoodenRamp",[8.8335,-0.125977,0.403545],90,1,0]]};
if (WF_A2_Vanilla || WF_A2_CombinedOps) then {_objects = [["Land_WoodenRamp",[-2.45703,-0.593262,0.357508],270,1,0],["Land_WoodenRamp",[-2.5083,1.3811,0.357508],270,1,0],[_siteName,[4.6333,0.338135,0.00393867],90,1,0],["Land_Dirthump02",[-0.587891,8.57935,0.00207901],359.967,1,0],["Land_Dirthump01",[-3.97363,-8.49219,-4.57764e-005],29.9804,1,0],["Land_WoodenRamp",[8.8335,-0.125977,0.403545],90,1,0]]};
_constructed = _constructed + ([_position,_direction,_objects] Call _construct);

if ((missionNamespace getVariable "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") == 0) then {
	waitUntil {time >= _timeNextUpdate};
	
	if !(isNull _nearLogic) then {
		_group = group _nearLogic;
		deleteVehicle _nearLogic;
		deleteGroup _group;
	};
} else {
	//--- Awaits for 100%
	while {true} do {
		sleep 1;
		if ((_nearLogic getVariable "WFBE_B_Completion") >= 100) exitWith {};
	};
	
	//--- Remove the logic from the list since it's built. Add it back if destroyed.
	_logik setVariable ["wfbe_structures_logic", (_logik getVariable "wfbe_structures_logic") + [_nearLogic]];
};
	
{if !(isNull _x) then {DeleteVehicle _x}} ForEach _constructed;

_site = createVehicle [_type, _position, [], 0, "NONE"];
_site setDir _direction;
_site setPos _position;
_site setVariable ["wfbe_side", _side];
_site setVariable ["wfbe_structure_type", _rlType];

[_side, "Constructed", ["Base", _site]] Spawn SideMessage;

if (!isNull _site) then {
	_logik setVariable ["wfbe_structures", (_logik getVariable "wfbe_structures") + [_site], true];
	
	_site setVehicleInit Format["[this,false,%1] ExecVM 'Client\Init\Init_BaseStructure.sqf'",_sideID];
	processInitCommands;
	
	_site addEventHandler ["hit",{_this Spawn BuildingDamaged}];
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE") > 0) then {
		_site addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}];
	} else {
		_site addEventHandler ['handleDamage',{[_this select 0, _this select 2] Call HandleBuildingDamage}];
	};
	Call Compile Format ["_site AddEventHandler ['killed',{[_this select 0,_this select 1,'%1'] Spawn BuildingKilled}];",_type];
	
	["INFORMATION", Format ["Construction_SmallSite.sqf: [%1] Structure [%2] has been constructed.", str _side, _type]] Call WFBE_CO_FNC_LogContent;
};

//--- Base Patrols.
if (_rlType == "Barracks" && (missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
	[_site, _side] ExecFSM 'Server\FSM\basepatrol.fsm';
	["INFORMATION", Format ["Construction_SmallSite.sqf: [%1] Base patrol has been triggered upon Barrack creation.", str _side]] Call WFBE_CO_FNC_LogContent;
}