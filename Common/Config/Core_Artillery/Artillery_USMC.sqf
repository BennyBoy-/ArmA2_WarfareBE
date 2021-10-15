Private ["_side"];
_side = _this;

missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPLAY_NAME', _side], ['M119','M252','MLRS']]; //--- Display Name to use in the GUI.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_WEAPONS', _side], ['M119','M252','MLRS']]; //--- Weapon classname.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MIN', _side], [1000,50,1200]]; //--- Unit cannot fire if the target is within it's min range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MAX', _side], [7000,5500,9000]]; //--- Unit max firing range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_TIME_RELOAD', _side], [7,4,2]]; //--- Approximate time needed for unit to fire again.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_BURST', _side], [10,4,6]]; //--- Burst sent per fire mission.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_VELOCITIES', _side], [500,475,550]]; //--- Projectile fall velocity.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPERSIONS', _side], [50,60,40]]; //--- Accuracy of the shell upon landing.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_LASER', _side], ['ARTY_Sh_105_LASER']]; //--- LASER rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_SADARM', _side], ['ARTY_Sh_105_SADARM']]; //--- SADARM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_ILLUMN', _side], ['ARTY_Sh_105_ILLUM','ARTY_Sh_81_ILLUM']]; //--- ILLUM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DEPLOY_SMOKE', _side], ['ARTY_Sh_105_WP','ARTY_Sh_105_SMOKE','ARTY_Sh_81_WP']]; //--- Projectiles which deploys smoke

//--- Usable projectiles per artillery class.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMOS', _side], [
	['ARTY_Sh_105_HE','Sh_105_HE','ARTY_Sh_105_WP','ARTY_Sh_105_SADARM','ARTY_Sh_105_LASER','ARTY_Sh_105_SMOKE','ARTY_Sh_105_ILLUM'],
	['ARTY_Sh_81_HE','Sh_81_HE','ARTY_Sh_81_WP','ARTY_Sh_81_ILLUM'],
	['ARTY_R_227mm_HE_Rocket','R_MLRS']
]];

//--- Special projectiles used by artillery classes.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS', _side], [
	['ARTY_30Rnd_105mmWP_M119','ARTY_30Rnd_105mmSADARM_M119','ARTY_30Rnd_105mmLASER_M119','ARTY_30Rnd_105mmSMOKE_M119','ARTY_30Rnd_105mmILLUM_M119'],
	['ARTY_8Rnd_81mmWP_M252','ARTY_8Rnd_81mmILLUM_M252'],
	[]
]];

//--- Upgrade level required to use the special projectile.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [
	[2,3,3,1,1],
	[2,1],
	[]
]];

//--- Artillery classnames, more than one of the same family may be used.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_CLASSNAMES', _side], [
	['M119'],
	['M252'],
	['MLRS']
]];