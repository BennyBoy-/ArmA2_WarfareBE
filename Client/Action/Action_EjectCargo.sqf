Private ["_cargo","_vehicle"];

_vehicle = _this select 0;

//--- Get the crew.
_cargo = (crew _vehicle) - [driver _vehicle, gunner _vehicle, commander _vehicle];

{
	if (alive _x && _vehicle == vehicle _x) then {
		if (local _x) then {
			//--- Dealing with a local unit, probably an AI.
			unassignVehicle _x;
			_x action ["EJECT", _vehicle];
		} else {
			//--- Dealing with a player or a non local unit.
			if (isPlayer(leader (group _x))) then {
				// if (WF_A2_Vanilla) then {
					[getPlayerUID(leader(group _x)), "HandleSpecial", ["action-perform", _x, "EJECT", _vehicle]] Call WFBE_CO_FNC_SendToClients;
				// } else {
					// [leader (group _x), "PerformAction", [_x, "EJECT", _vehicle]] Call WFBE_CO_FNC_SendToClient;
				// };
			};
		};
	};
	sleep 1;
} forEach _cargo;