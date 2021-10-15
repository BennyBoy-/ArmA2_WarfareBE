Private ["_buildings","_closest","_defense","_direction","_distance","_index","_position","_side","_soldier","_team","_type","_unit"];
_defense = _this select 0;
_side = _this select 1;
_team = _this select 2;
_closest = _this select 3;

while {alive _defense} do {
	if (isNull(gunner _defense) || !alive gunner _defense) then {
	
		sleep 7;
		
		if (alive _closest && !(isNull _closest )) then {
			_type = typeOf _closest;
			_index = (missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",str _side]) find _type;
			_distance = (missionNamespace getVariable Format["WFBE_%1STRUCTUREDISTANCES",str _side]) select _index;
			_direction = (missionNamespace getVariable Format["WFBE_%1STRUCTUREDIRECTIONS",str _side]) select _index;
			_position = [getPos _closest,_distance,getDir (_closest) + _direction] Call GetPositionFrom;
			
			_type = missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side];
			_soldier = [_type,_team,_position,_side] Call WFBE_CO_FNC_CreateUnit;
			[_soldier] allowGetIn true;
			_soldier assignAsGunner _defense;
			[_soldier] orderGetIn true;
			
			[str _side,'UnitsCreated',1] Call UpdateStatistics;
			
			["INFORMATION", Format ["Server_HandleDefense.sqf: [%1] Unit has been dispatched to a [%2] defense.", str _side,_type]] Call WFBE_CO_FNC_LogContent;
			
			//--- Calculate the average time in function of the distance and the speed.
			sleep ((((_soldier distance _defense)/(14*1000))*3600)+20);
			
			if ((vehicle _soldier != _defense)&& alive _soldier &&(!isNull _soldier)) then {
				if ((_defense emptyPositions "gunner" > 0) && alive _defense && (!isNull _defense)) then {_soldier moveInGunner _defense} else {deleteVehicle _soldier};
			};
		} else {
			["INFORMATION", "Server_HandleDefense.sqf: Canceled auto manning, the barracks is destroyed."] Call WFBE_CO_FNC_LogContent;
		};
	};
	sleep 420;
};