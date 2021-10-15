Private ["_count","_destination","_index","_type","_units"];

_destination = _this select 0;
_index = _this select 1;

_units = [group player, false, _index, WFBE_Client_SideJoinedText] Call GetTeamArtillery;
_type = ((missionNamespace getVariable Format ['WFBE_%1_ARTILLERY_CLASSNAMES', WFBE_Client_SideJoinedText]) select _index) find (typeOf (_units select 0));

if (count _units < 1 || _type < 0) exitWith {};

{[_x, _destination, WFBE_Client_SideJoined, artyRange] Spawn WFBE_CO_FNC_FireArtillery} forEach _units;

//Keep weapons reloaded.
// _units = [Group player,true,_index,sideJoinedText] Call GetTeamArtillery;
// {if (!someAmmo _x) then {[_x, sideJoined] Call RearmVehicle}} forEach _units;