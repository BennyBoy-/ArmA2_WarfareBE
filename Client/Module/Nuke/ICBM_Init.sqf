if (local player) then {
	Nuke = Compile preprocessFile "Client\Module\Nuke\nuke.sqf";
	NukeIncomming = Compile preprocessFile "Client\Module\Nuke\nukeincoming.sqf";
};

if (isServer) then {
	NukeDammage = Compile preprocessFileLineNumbers "Client\Module\Nuke\damage.sqf";
	NukeRadiation = Compile preprocessFileLineNumbers "Client\Module\Nuke\radzone.sqf";
};