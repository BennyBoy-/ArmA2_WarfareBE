/*
	Initialize WFBE secondary missions module.
*/

Private ['_tpath'];
_tpath = "Server\Module\Missions\%1\m_init.sqf";

WFBE_SE_MOD_Missions_CanAssign = Compile preprocessFileLineNumbers "Server\Module\Missions\Missions_CanAssign.sqf";
WFBE_SE_MOD_Missions_CanRun = Compile preprocessFileLineNumbers "Server\Module\Missions\Missions_CanRun.sqf";

//--- Maximum amount of missions allowed per side at a time.
missionNamespace setVariable ['WFBE_MISSIONSMAXIMUM_WEST', 1];
missionNamespace setVariable ['WFBE_MISSIONSMAXIMUM_EAST', 1];
missionNamespace setVariable ['WFBE_MISSIONSMAXIMUM_GUER', 1];
//--- Time randomizer (Affect the timeout).
missionNamespace setVariable ['WFBE_MISSIONSRANDOMIZER', 160];
//--- Re-usability, after x missions, mission y is available again.
missionNamespace setVariable ['WFBE_MISSIONSREUSABILITY', 10];
//--- Time to wait between each missions.
missionNamespace setVariable ['WFBE_MISSIONSTIMEOUT', 2400];

/* 
	The missions are initialized by m_init.sqf

	- Parameter 1: The island mask (worldName)
		* -> All islands (Exemple: ['*'], will run everywhere).
		! -> All islands but those (Exemple: ['!','Chernarus','Takistan'], will run everywhere but on chernarus & takistan).
		<Name> -> Only the given islands (Exemple: ['Chernarus','Takistan'], will run only on chernarus & takistan).
	- Parameter 2: The path, this one define where the missions are stored server-side, you only have to change the mission name to match the folder name
		Server\Module\Missions\M_PLAYERS_Attack_Air -> Format [_tpath, 'M_PLAYERS_Attack_Air']
	- Parameter 3: The unique mission identifier, this one shall match the folder's name.
		Server\Module\Missions\M_PLAYERS_Attack_Air -> 'M_PLAYERS_Attack_Air'
	- Parameter 4: The unique mission incremental ID, this one shall be initialized at 0.
		0
	- Parameter 5: The scope defines if the mission shall run on everyone or only on one at a time (Parameter 6 define the sides).
		"all", [west,east] -> This will run on both west AND east at the same time.
		"all", [west,east,resistance] -> This will run on both west AND east AND resistance at the same time.
		"one", [west,east] -> This will run on west OR east at a time.
	- Parameter 6: The sides defines who shall be able to run the mission (parameter 5 define the scope).
		[east,west] -> east and west may run the mission one at a time or both at the same time depending on the scope.
	- Parameter 7: The condition, this defines the condition on when to run the mission.
		"all", [west,east], {!WF_A2_Vanilla} -> Triggered on all, Only triggered if the gamemode is not Vanilla.
		"one", [west,east], {!WF_A2_Vanilla} -> Triggered on east or west, Only triggered if the gamemode is not Vanilla.
		"one", [west,east], [{(west Call WFBE_CO_FNC_GetSideStructures) > 0}, {(east Call WFBE_CO_FNC_GetSideStructures) > 0}] -> Triggered on east or west, the condition in array-style will match the side array order ["west,"east"], [{west condition}, {east condition}]
	
	Each mission receive 3 defaults parameters, the unique identifier, the starting index and the selected index.
*/

//--- Assign a content.
missionNamespace setVariable ['WFBE_M_CONTENT',[
	// [['*'], Format [_tpath, 'M_UAV_RetrieveModule'], 'M_UAV_RetrieveModule', 0, "all", [east, west], {true}], //--- UAV Retrieving Mission
	[['*'], Format [_tpath, 'M_PLAYERS_Attack_Air'], 'M_PLAYERS_Attack_Air', 0, "one", [east, west], {!WF_A2_Vanilla && (missionNamespace getVariable 'WFBE_C_MODULE_BIS_PMC') > 0}] //--- Resistance PMC attack players, requires PMC.
]];

//--- Ensure that the re-usability is not higher than the content.
if ((missionNamespace getVariable 'WFBE_MISSIONSREUSABILITY') > count(missionNamespace getVariable 'WFBE_M_CONTENT')-1) then {
	missionNamespace setVariable ['WFBE_MISSIONSREUSABILITY', count(missionNamespace getVariable 'WFBE_M_CONTENT')];
};