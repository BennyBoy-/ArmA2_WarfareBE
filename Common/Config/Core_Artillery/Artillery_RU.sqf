Private ["_side"];
_side = _this;

missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPLAY_NAME', _side], ['D30','2B14','GRAD']]; //--- Display Name to use in the GUI.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_WEAPONS', _side], ['D30','2B14','GRAD']]; //--- Weapon classname.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MIN', _side], [1000,50,800]]; //--- Unit cannot fire if the target is within it's min range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MAX', _side], [7000,5500,9000]]; //--- Unit max firing range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_TIME_RELOAD', _side], [7,4,2]]; //--- Approximate time needed for unit to fire again.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_BURST', _side], [10,4,10]]; //--- Burst sent per fire mission.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_VELOCITIES', _side], [500,475,550]]; //--- Projectile fall velocity.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPERSIONS', _side], [50,60,40]]; //--- Accuracy of the shell upon landing.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_LASER', _side], ['ARTY_Sh_122_LASER']]; //--- LASER rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_SADARM', _side], ['ARTY_Sh_122_SADARM']]; //--- SADARM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_ILLUMN', _side], ['ARTY_Sh_122_ILLUM','ARTY_Sh_82_ILLUM']]; //--- ILLUM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DEPLOY_SMOKE', _side], ['ARTY_Sh_122_WP','ARTY_Sh_122_SMOKE','ARTY_Sh_82_WP']]; //--- Projectiles which deploys smoke

//--- Usable projectiles per artillery class.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMOS', _side], [
	['ARTY_Sh_122_HE','Sh_122_HE','ARTY_Sh_122_WP','ARTY_Sh_122_SADARM','ARTY_Sh_122_LASER','ARTY_Sh_122_SMOKE','ARTY_Sh_122_ILLUM'],
	['ARTY_Sh_82_HE','Sh_82_HE','ARTY_Sh_82_WP','ARTY_Sh_82_ILLUM'],
	['ARTY_R_227mm_HE_Rocket','R_GRAD']
]];

//--- Special projectiles used by artillery classes.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS', _side], [
	['ARTY_30Rnd_122mmWP_D30','ARTY_30Rnd_122mmSADARM_D30','ARTY_30Rnd_122mmLASER_D30','ARTY_30Rnd_122mmSMOKE_D30','ARTY_30Rnd_122mmILLUM_D30'],
	['ARTY_8Rnd_82mmWP_2B14','ARTY_8Rnd_82mmILLUM_2B14'],
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
	['D30_CDF'],
	['2b14_82mm_CDF'],
	['GRAD_CDF']
]];