########################
### CORE FILE SYSTEM ###
########################

  # Description #
	
	The core system defines the units and weapons, it's a modulable system.
	
	  # The core files > Common\Config\ #
		
		> Gear <
			 Generic file which deals with weapons/magazines/backpacks definition (price, upgrade level...), more than one may be called. by side 
			 Vanilla gamemode will have Gear_USMC, Gear_RU, Gear_GUE called for all sides. You may create more like Gear_ACE for instance.
			  > Magazines properties are defined here [classname, picture, label, price, upgrade level].
			  > Magazines labels may be changed (if != "").
			  > Magazines pictures may be changed (if != "").
			  > Each magazines list Calls "Common\Config\Config_Magazines.sqf" ([_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Magazines.sqf";)
			  > Weapons properties are defined here [classname, picture, label, price, upgrade level, magazines].
			  > Weapons labels may be changed (if != "").
			  > Weapons pictures may be changed (if != "").
			  > Weapons magazines may be changed (if != -1, like _m = _m + [["30Rnd_9x19_UZI","30Rnd_9x19_UZI_SD"]]), -1 will get the magazines from the config.
			  > Each weapons list Calls "Common\Config\Config_Weapons.sqf" ([_faction, _u, _p, _n, _o, _z, _m] Call Compile preprocessFile "Common\Config\Config_Weapons.sqf";)
			  > Backpacks properties are defined here [classname, picture, label, price, upgrade level].
			  > Backpacks labels may be changed (if != ""), using a "+" in front will add a custom text after the actual backpack config name like '+(Ammo SAW)' will give "Assault Backpack (Ammo SAW)"
			  > Backpacks pictures may be changed (if != "").
			  > Each backpacks list Calls "Common\Config\Config_Backpack.sqf" ([_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Backpack.sqf";)
			  
	    > Core_Groups <
			 Generic file which deals with groups which are being used in towns, only one Core_Groups may be called by side.
			  > Town groups properties are defined here [group label, group units]
			  > A list of group calls "Common\Config\Config_Groups.sqf"
			  > Groups uses per town is defined in "Server\Functions\Server_GetTownGroups.sqf"
	  
	    > Loadout <
			 Generic file which defines the loadouts to use in the Gear Menu, more than one Loadout file may be called per side like Loadout_US & Loadout_USMC, those files are commonly called in Core_Root ones.
			  > Magazines classnames are defined here.
			  > Magazines calls "Common\Config\Config_SortMagazines.sqf" (_m = [_m, _side] Call Compile preprocessFile "Common\Config\Config_SortMagazines.sqf";) which set or update the magazines, note that the returned values is a list of non-side-defined magazines used by SortWeapons.sqf (for the WFBE_%1_All).
		  	  > Weapons classnames are defined here.
			  > Weapons calls "Common\Config\Config_SortWeapons.sqf" ([_u, _m, _side] Call Compile preprocessFile "Common\Config\Config_SortWeapons.sqf";) which set or update the weapons. Note that _m is the non-side-defined magazines returned by SortMagazines.sqf
			  > Templates are defined here.
			  > Only one template per side may be used by default, see below in order to add others.
			  > Templates calls "Common\Config\Config_SetTemplates.sqf" ([_u, _side] Call Compile preprocessFile "Common\Config\Config_SetTemplates.sqf";), you may add an extra "false" parameter to allow multiple template usage in case of multiple Loadout_x files call per side.
		  	  
	    > Core_Models <
			 Generic file which deals with models, only one Core_Models may be called by a side.
			  > Camps and their properties (direction, position, model...) are defined here.
			  > Depots and their properties (direction, position, distance, model...) are defined here.
			  > Airports and their properties (direction, position, distance, model...) are defined here.
		  
		> Core_Root <
			 Generic file which deals with the sides general properties, only one Core_Root may be called by side.
			  > Soldiers/pilots/crew models are defined here.
			  > Flag textures are defined here.
			  > Radio announcers are defined here.
			  > Support (Ambulances/Repair/Rearm/Refuel) are defined here.
			  > UAV model is defined here (nil means none).
			  > Town inter-patrols models are defined here.
			  > Base patrols models are defined here.
			  > Paratroopers models are defined here.
			  > Paratroopers vehicle models are defined here.
			  > Ammo paradropping models are defined here.
			  > Server AI playable units loadout is defined here.
			  > Client default loadout is defined here.
			  > Default buy faction filter is defined here.
			  > Core_Loadout is called from here (Gear menu items display), more than one may be called. You may Call Loadout_US & Loadout_USMC for instance. You may create your own aswell.
