MenuAction = -1;

_vehi = [group player,false] Call GetTeamVehicles;
_alives = (units group player) Call GetLiveUnits;
{if (vehicle _x == _x) then {_vehi = _vehi + [_x]}} forEach _alives;
_lastUse = 0;
_typeRepair = missionNamespace getVariable Format['WFBE_%1REPAIRTRUCKS',sideJoinedText];
_sheal = missionNamespace getVariable 'WFBE_C_UNITS_SUPPORT_HEAL_TIME';
_srearm = missionNamespace getVariable 'WFBE_C_UNITS_SUPPORT_REARM_TIME';
_srefuel = missionNamespace getVariable 'WFBE_C_UNITS_SUPPORT_REFUEL_TIME';
_srepair = missionNamespace getVariable 'WFBE_C_UNITS_SUPPORT_REPAIR_TIME';

_healPrice = 0;
_repairPrice = 0;
_refuelPrice = 0;
_rearmPrice = 0;
_lastVeh = objNull;
_lastDmg = 0;
_lastFue = 0;

_buildings = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;

//--- Service Point.
_csp = objNull;
_sp = [sideJoined, missionNamespace getVariable Format ["WFBE_%1SERVICEPOINTTYPE",sideJoinedText],_buildings] Call GetFactories;
if (count _sp > 0) then {
	_csp = [vehicle player,_sp] Call WFBE_CO_FNC_GetClosestEntity;
};

if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA") > 0) then {
	_enable = false;
	_currentUpgrades = (sideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
	_easaLevel = _currentUpgrades select WFBE_UP_EASA;
	if (!(isNull _csp) && _easaLevel > 0) then {
		if (player distance _csp < (missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_RANGE")) then {
			if (typeOf(vehicle player) in (missionNamespace getVariable 'WFBE_EASA_Vehicles')) then {
				if (driver (vehicle player) == player) then {_enable = true};
			};
		};
	};
	ctrlEnable [20010,_enable];
} else {
	ctrlEnable [20010,false];
};

_effective = [];
_nearSupport = [];
_spType = missionNamespace getVariable Format ["%1SP",sideJoinedText];
_i = 0;
{
	_closestSP = objNull;
	_add = false;
	
	_nearSupport set [_i, []];
	
	//--- Service Point.
	if (count _sp > 0) then {
		_closestSP = [_x,_sp] Call WFBE_CO_FNC_GetClosestEntity;
		if !(isNull _closestSP) then {
			if (_x distance _closestSP < (missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_RANGE")) then {
				_add = true;
				_nearSupport set [_i,(_nearSupport select _i) + [_closestSP]];
			};
		};
	};

	//--- Depots.
	_nObject = [_x, (missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_RANGE")] Call WFBE_CL_FNC_GetClosestDepot;
	
	if !(isNull _nObject) then {
		_add = true;
		_nearSupport set [_i,(_nearSupport select _i) + [_nObject]];
	};
	
	//--- Repairs Trucks.
	_checks = (getPos _x) nearEntities[_typeRepair, missionNamespace getVariable "WFBE_C_UNITS_REPAIR_TRUCK_RANGE"];
	if (count _checks > 0) then {
		_add = true;
		_nearSupport set [_i,(_nearSupport select _i) + _checks];
	};
		
	//--- Add the vehicle ?
	if (_add) then {
		_effective = _effective + [_x];
		_desc = [typeOf _x, 'displayName'] Call GetConfigInfo;
		_finalNumber = (_x) Call GetAIDigit;
		_isInVehicle = "";
		if (_x != vehicle _x) then {
			_descVehi = [typeOf (vehicle _x), 'displayName'] Call GetConfigInfo;
			_isInVehicle = " [" + _descVehi + "] ";
		};
		_txt = "["+_finalNumber+"] "+ _desc + _isInVehicle;
		lbAdd[20002,_txt];
		
		_i = _i + 1;
	};
} forEach _vehi;

_checks = (getPos player) nearEntities[_typeRepair, missionNamespace getVariable "WFBE_C_UNITS_REPAIR_TRUCK_RANGE"];
if (count _checks > 0) then {
	_repair = _checks select 0;
	_vehi = ((getPos _repair) nearEntities[["Car","Motorcycle","Tank","Air","Ship","StaticWeapon"],100]) - [_repair];
	{
		if !(_x in _effective) then {
			_effective = _effective + [_x];
			_nearSupport set [_i,[_repair]];
			_descVehi = [typeOf (vehicle _x), 'displayName'] Call GetConfigInfo;
			lbAdd[20002,_descVehi];
			
			_i = _i + 1;
		};
	} forEach _vehi;
};

if (count _effective > 0) then {lbSetCurSel[20002,0]};

while {true} do {
	sleep 0.1;
	
	if (Side player != sideJoined) exitWith {closeDialog 0};
	if (!dialog) exitWith {};
	_curSel = lbCurSel(20002);

	if (_curSel != -1) then {
		_veh = (vehicle (_effective select _curSel));
		_funds = Call GetPlayerFunds;
		
		if (_veh isKindOf "Man") then {
			{ctrlEnable [_x,false]} forEach [20003,20004,20005];
			_enabled = if (_funds >= _healPrice) then {true} else {false};
			ctrlEnable [20008,_enabled];
			//--- Healing.
			_healPrice = round((getDammage _veh)*(missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_HEAL_PRICE"));
			ctrlSetText [20011,"$0"];
			ctrlSetText [20012,"$0"];
			ctrlSetText [20013,"$0"];
			ctrlSetText [20014,"$"+str(_healPrice)];
		} else {
			//--- Prevent on the air re-supply.
			_canBeUsed = if ((getPos _veh) select 2 <= 2 && speed _veh <= 20) then {true} else {false};
			_enabled = if (_canBeUsed && _funds >= _rearmPrice) then {true} else {false};
			ctrlEnable [20003,_enabled];
			_enabled = if (_canBeUsed && _funds >= _repairPrice) then {true} else {false};
			ctrlEnable [20004,_enabled];
			_enabled = if (_canBeUsed && _funds >= _refuelPrice) then {true} else {false};
			ctrlEnable [20005,_enabled];
			_enabled = if (_canBeUsed && _funds >= _healPrice) then {true} else {false};
			ctrlEnable [20008,_enabled];
			//--- Healing.
			_healPrice = 0;
			{
				if (alive _x) then {_healPrice = _healPrice + round((getDammage _x)*(missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_HEAL_PRICE"))};
			} forEach (crew _veh);
			ctrlSetText [20014,"$"+str(_healPrice)];
			//--- Repair.
			if (_veh != _lastVeh || getDammage _veh != _lastDmg) then {
				_type = typeOf _veh;
				_lastDmg = getDammage _veh;
				_get = missionNamespace getVariable _type;
				if !(isNil '_get') then {
					_repairPrice = round((getDammage _veh)*((_get select QUERYUNITPRICE)/(missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_REPAIR_PRICE")));
				} else {
					_repairPrice = 500;
				};
			};
			ctrlSetText [20012,"$"+str(_repairPrice)];
			//--- Rearm.
			if (_veh != _lastVeh) then {
				_type = typeOf _veh;
				_get = missionNamespace getVariable _type;
				if !(isNil '_get') then {
					_rearmPrice = round((_get select QUERYUNITPRICE)/(missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_REARM_PRICE"));
				} else {
					_rearmPrice = 500;
				};
			};
			ctrlSetText [20011,"$"+str(_rearmPrice)];
			//--- Refuel.
			if (_veh != _lastVeh || fuel _veh != _lastFue) then {
				_type = typeOf _veh;
				_lastFue = fuel _veh;
				_get = missionNamespace getVariable _type;
				if !(isNil '_get') then {
					_fuel = ((fuel _veh) -1) * -1;
					_refuelPrice = round(_fuel*((_get select QUERYUNITPRICE)/(missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_REFUEL_PRICE")));
				} else {
					_refuelPrice = 200;
				};
			};
			ctrlSetText [20013,"$"+str(_refuelPrice)];
		};
		
		_lastVeh = _veh;
		
		//--- Rearm.
		if (MenuAction == 1) then {
			MenuAction = -1;
			-_rearmPrice Call ChangePlayerFunds;
			
			//--- Spawn a Rearm thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn SupportRearm;
		};	
		
		//--- Repair.
		if (MenuAction == 2) then {
			MenuAction = -1;
			-_repairPrice Call ChangePlayerFunds;
			
			//--- Spawn a Repair thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn SupportRepair;
		};
		
		//--- Refuel.
		if (MenuAction == 3) then {
			MenuAction = -1;
			-_refuelPrice Call ChangePlayerFunds;
			
			//--- Spawn a Refuel thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn SupportRefuel;
		};
		
		//--- Heal.
		if (MenuAction == 5) then {
			MenuAction = -1;
			-_healPrice Call ChangePlayerFunds;
			
			//--- Spawn a Healing thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn SupportHeal;
		};
	} else {
		{ctrlEnable[_x,false]} forEach [20003,20004,20005,20008];
	};
	
	//--- EASA. TBD: Add dialog;
	if (MenuAction == 7) then {
		MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_EASA";
	};
	
	//--- Back Button.
	if (MenuAction == 8) exitWith { //---added-MrNiceGuy
		MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};
