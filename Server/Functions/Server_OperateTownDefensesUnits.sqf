/*
	Oeprate the defenses in a town, spawn or despawn.
	 Parameters:
		- Town.
		- Side.
		- Action ("spawn"/"remove").
*/

Private ["_action","_defense","_mortars","_side","_spawn","_town","_units"];

_town = _this select 0;
_side = _this select 1;
_action = _this select 2;

switch (_action) do {
	case "spawn": {
		_mortars = if !(isNil {_town getVariable "wfbe_mortars_spawned"}) then {(_town getVariable "wfbe_mortars_spawned") select 0} else {[]};
		//--- Man the mortars.
		_units = [];
		{
			if !(alive gunner _x) then {
				if (locked _x) then {_x lock false};
				_unit = [missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side],missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side], getPos _x, _side] Call WFBE_CO_FNC_CreateUnit;
				_unit assignAsGunner _x;
				[_unit] orderGetIn true;
				_unit moveInGunner _x;
				_x lock true;
				[_units, _unit] Call WFBE_CO_FNC_ArrayPush;
			};
		} forEach _mortars;
		
		if (count _units > 0) then {_town setVariable ["wfbe_mortars_operators", _units]}; //--- Track the original mortar gunners.
		
		//--- Man the defenses.
		{
			_defense = _x getVariable "wfbe_defense";
			
			if !(isNil '_defense') then {
				if !(alive gunner _defense) then { //--- Make sure that the defense gunner is null or dead.
					_unit = [missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side],missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side], getPos _x, _side] Call WFBE_CO_FNC_CreateUnit;
					_unit assignAsGunner _defense;
					[_unit] orderGetIn true;
					_unit moveInGunner _defense;
					[group _unit, 175, getPos _defense] spawn WFBE_CO_FNC_RevealArea;
					_x setVariable ["wfbe_defense_operator", _unit]; //--- Track the original gunner.
				};
			};
		} forEach (_town getVariable "wfbe_town_defenses");
		
		//--- Reveal the town area to the statics.
		if (count (_town getVariable "wfbe_town_defenses") > 0) then {
			[missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side], _town getVariable "range", _town] Call RevealArea;
		};
		
		//--- If we have more mortars, we spawn a targeting thread.
		if (count _mortars > 0) then {[_town, _mortars] spawn WFBE_SE_FNC_MortarSupport};
		
		["INFORMATION", Format ["Server_OperateTownDefensesUnits.sqf : Town [%1] defenses were manned for [%2] defenses on [%3].", _town getVariable "name", count (_town getVariable "wfbe_town_defenses") + count _mortars,_side]] Call WFBE_CO_FNC_LogContent;
	};
	case "remove": {
		_mortars = if !(isNil {_town getVariable "wfbe_mortars_spawned"}) then {(_town getVariable "wfbe_mortars_spawned") select 0} else {[]};
	
		//--- De-man the mortars.
		{
			_unit = gunner _x;
			if !(isNull _unit) then { //--- Make sure that we do not remove a player's unit.
				if (alive _unit) then {
					if (isNil {(group _unit) getVariable "wfbe_funds"}) then {_unit setPos (getPos _x);	deleteVehicle _unit};
				} else {
					_unit setPos (getPos _x); deleteVehicle _unit;
				};
			};
		} forEach _mortars;
		
		if !(isNil {_town getVariable "wfbe_mortars_operators"}) then { //--- Delete the mortars crews if they are still around.
			{if (alive _x) then {deleteVehicle _x}} forEach (_town getVariable "wfbe_mortars_operators");
			_town setVariable ["wfbe_mortars_operators", nil];
		};
		
		//--- De-man the defenses.
		{
			_defense = _x getVariable "wfbe_defense";
			
			if !(isNil '_defense') then {
				_unit = gunner _defense;
				if !(isNull _unit) then { //--- Make sure that we do not remove a player's unit.
					if (alive _unit) then {
						if (isNil {(group _unit) getVariable "wfbe_funds"}) then {_unit setPos (getPos _x);	deleteVehicle _unit};
					} else {
						_unit setPos (getPos _x); deleteVehicle _unit;
					};
				};
			};
			if !(isNil {_x getVariable "wfbe_defense_operator"}) then { //--- Delete the original gunner if he's still around.
				if (alive(_x getVariable "wfbe_defense_operator")) then {deleteVehicle (_x getVariable "wfbe_defense_operator")};
				_x setVariable ["wfbe_defense_operator", nil];
			};
		} forEach (_town getVariable "wfbe_town_defenses");
		
		["INFORMATION", Format ["Server_OperateTownDefensesUnits.sqf : Town [%1] defenses units were removed for [%2] defenses.", _town getVariable "name", count (_town getVariable "wfbe_town_defenses") + count _mortars]] Call WFBE_CO_FNC_LogContent;
	};
};