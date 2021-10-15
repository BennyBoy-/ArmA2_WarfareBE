Private["_args","_driver","_gunner","_playerTeam","_side","_uav"];

_args = _this;
_side = _args select 1;

_uav = (_args select 2);
_driver = driver _uav;
_gunner = gunner _uav;
_playerTeam = (_args select 3);

["INFORMATION", Format ["Server_HandleSpecial.sqf: [%1] Team [%2] [%3] called in an UAV.", str _side, _playerTeam, name (leader _playerTeam)]] Call WFBE_CO_FNC_LogContent;

while {true} do {
	sleep 5;
	if (!(isPlayer (leader _playerTeam)) || !alive _uav) exitWith {};
};

if (!isNull _driver) then {if (alive _driver) then {_driver setDammage 1};if (isNil {_driver getVariable "wfbe_trashed"}) then {_driver setVariable ["wfbe_trashed", true];_driver Spawn TrashObject}};
if (!isNull _gunner) then {if (alive _gunner) then {_gunner setDammage 1};if (isNil {_gunner getVariable "wfbe_trashed"}) then {_gunner setVariable ["wfbe_trashed", true];_gunner Spawn TrashObject}};
if (!isNull _uav) then {if (alive _uav) then {_uav setDammage 1};if (isNil {_uav getVariable "wfbe_trashed"}) then {_uav setVariable ["wfbe_trashed", true];_uav Spawn TrashObject}};