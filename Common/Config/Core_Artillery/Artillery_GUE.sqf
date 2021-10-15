Private ["_side"];
_side = _this;

missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPLAY_NAME', _side], ['2B14']]; //--- Display Name to use in the GUI.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_WEAPONS', _side], ['2B14']]; //--- Weapon classname.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MIN', _side], [50]]; //--- Unit cannot fire if the target is within it's min range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MAX', _side], [5500]]; //--- Unit max firing range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_TIME_RELOAD', _side], [4]]; //--- Approximate time needed for unit to fire again.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_BURST', _side], [4]]; //--- Burst sent per fire mission.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_VELOCITIES', _side], [475]]; //--- Projectile fall velocity.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPERSIONS', _side], [60]]; //--- Accuracy of the shell upon landing.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_LASER', _side], []]; //--- LASER rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_SADARM', _side], []]; //--- SADARM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_ILLUMN', _side], ['ARTY_Sh_82_ILLUM']]; //--- ILLUM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DEPLOY_SMOKE', _side], ['ARTY_Sh_82_WP']]; //--- Projectiles which deploys smoke

//--- Usable projectiles per artillery class.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMOS', _side], [
	['ARTY_Sh_82_HE','Sh_82_HE','ARTY_Sh_82_WP','ARTY_Sh_82_ILLUM']
]];

//--- Special projectiles used by artillery classes.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS', _side], [
	['ARTY_8Rnd_82mmWP_2B14','ARTY_8Rnd_82mmILLUM_2B14']
]];

//--- Upgrade level required to use the special projectile.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [
	[2,1]
]];

//--- Artillery classnames, more than one of the same family may be used.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_CLASSNAMES', _side], [
	['2b14_82mm_GUE']
]];