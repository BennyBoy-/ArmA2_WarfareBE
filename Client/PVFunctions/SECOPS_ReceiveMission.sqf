/*
	Client receive a secondary mission (if enabled).
	 Parameters:
		- Mission Parameters.
*/

Private ["_folder","_parameters"];
_parameters = _this;
_folder = _parameters select 0;

//--- Exclude the folder.
_parameters set [0, "**NIL**"];
_parameters = _parameters - ["**NIL**"];

//--- Call the mission with the proper parameter count now.
_parameters ExecVM Format["Client\Module\Missions\%1\m_init_client.sqf", _folder];