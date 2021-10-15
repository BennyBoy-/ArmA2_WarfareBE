Private ["_side"];
_side = _this;

missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPLAY_NAME', _side], ['M119','M252','MLRS','Stryker MC']]; //--- Display Name to use in the GUI.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_WEAPONS', _side], ['M119','M252','MLRS','M120']]; //--- Weapon classname.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MIN', _side], [1000,50,1200,550]]; //--- Unit cannot fire if the target is within it's min range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MAX', _side], [7000,5500,9000,6500]]; //--- Unit max firing range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_TIME_RELOAD', _side], [7,4,2,4]]; //--- Approximate time needed for unit to fire again.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_BURST', _side], [10,4,6,6]]; //--- Burst sent per fire mission.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_VELOCITIES', _side], [500,475,550,475]]; //--- Projectile fall velocity.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPERSIONS', _side], [50,60,40,55]]; //--- Accuracy of the shell upon landing.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_LASER', _side], ['Sh_105_LASER']]; //--- LASER rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_SADARM', _side], ['Sh_105_SADARM']]; //--- SADARM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_ILLUMN', _side], ['Sh_105_ILLUM','Sh_81_ILLUM']]; //--- ILLUM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DEPLOY_SMOKE', _side], ['Sh_105_WP','Sh_105_SMOKE','Sh_81_WP']]; //--- Projectiles which deploys smoke

//--- Usable projectiles per artillery class.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMOS', _side], [
	['Sh_105_HE','Sh_105_WP','Sh_105_SADARM','Sh_105_LASER','Sh_105_SMOKE','Sh_105_ILLUM'],
	['Sh_81_HE','Sh_81_WP','Sh_81_ILLUM'],
	['R_MLRS'],
	['120mmHE_M120']
]];

//--- Special projectiles used by artillery classes.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS', _side], [
	['30Rnd_105mmWP_M119','30Rnd_105mmSADARM_M119','30Rnd_105mmLASER_M119','30Rnd_105mmSMOKE_M119','30Rnd_105mmILLUM_M119'],
	['8Rnd_81mmWP_M252','8Rnd_81mmILLUM_M252'],
	[],
	[]
]];

//--- Upgrade level required to use the special projectile.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [
	[2,3,3,1,1],
	[2,1],
	[],
	[]
]];

//--- Artillery classnames, more than one of the same family may be used.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_CLASSNAMES', _side], [
	['M119_US_EP1','M119'],
	['M252_US_EP1','M252'],
	['MLRS','MLRS_DES_EP1'],
	['M1129_MC_EP1']
]];