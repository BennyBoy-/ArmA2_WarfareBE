Private ['_easaDefault','_easaLoadout','_easaVehi','_vehicle'];

EASA_Equip = Compile preProcessFile 'Client\Module\EASA\EASA_Equip.sqf';
EASA_RemoveLoadout = Compile preProcessFile 'Client\Module\EASA\EASA_RemoveLoadout.sqf';

_easaDefault = [];
_easaLoadout = [];
_easaVehi = [];

/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */
_easaVehi = 	_easaVehi + ['Su25_TK_EP1'];
_easaDefault = 	_easaDefault + [[['AirBombLauncher','4Rnd_FAB_250'],['R73Launcher_2','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [[1200],['R-73 (6)'],['R73Launcher_2','2Rnd_R73','2Rnd_R73','2Rnd_R73']],
  [[1400],['R-73 (4) | FAB-250 (2)'],['R73Launcher_2','2Rnd_R73','2Rnd_R73'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1600],['R-73 (2) | FAB-250 (4)'],['R73Launcher_2','2Rnd_R73'],['AirBombLauncher','4Rnd_FAB_250']],
  [[1900],['FAB-250 (6)'],['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250']]
 ]
} else {
 [
  [[1900],['FAB-250 (6)'],['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250']],
  [[2100],['Ch-29 (6)'],['Ch29Launcher_Su34','6Rnd_Ch29']],
  [[2200],['Ch-29 (4) | FAB-250 (2)'],['Ch29Launcher_Su34','4Rnd_Ch29'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1800],['Ch-29 (4) | R-73 (2)'],['Ch29Launcher_Su34','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']],
  [[1700],['R-73 (6)'],['R73Launcher_2','2Rnd_R73','2Rnd_R73','2Rnd_R73']],
  [[1400],['R-73 (4) | FAB-250 (2)'],['R73Launcher','4Rnd_R73'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1600],['R-73 (2) | FAB-250 (4)'],['R73Launcher_2','2Rnd_R73'],['AirBombLauncher','4Rnd_FAB_250']]
 ]
}
];

_easaVehi = 	_easaVehi + ['Su25_Ins'];
_easaDefault = 	_easaDefault + [[['AirBombLauncher','4Rnd_FAB_250'],['R73Launcher_2','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[1900],['FAB-250 (6)'],['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250']],
  [[2100],['Ch-29 (6)'],['Ch29Launcher_Su34','6Rnd_Ch29']],
  [[2200],['Ch-29 (4) | FAB-250 (2)'],['Ch29Launcher_Su34','4Rnd_Ch29'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1800],['Ch-29 (4) | R-73 (2)'],['Ch29Launcher_Su34','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']],
  [[1700],['R-73 (6)'],['R73Launcher_2','2Rnd_R73','2Rnd_R73','2Rnd_R73']],
  [[1400],['R-73 (4) | FAB-250 (2)'],['R73Launcher','4Rnd_R73'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1600],['R-73 (2) | FAB-250 (4)'],['R73Launcher_2','2Rnd_R73'],['AirBombLauncher','4Rnd_FAB_250']]
 ]
];

_easaVehi = 	_easaVehi + ['Su39'];
_easaDefault = 	_easaDefault + [[['Ch29Launcher','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[1900],['FAB-250 (6)'],['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250']],
  [[2100],['Ch-29 (6)'],['Ch29Launcher_Su34','6Rnd_Ch29']],
  [[2200],['Ch-29 (4) | FAB-250 (2)'],['Ch29Launcher_Su34','4Rnd_Ch29'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1800],['Ch-29 (4) | R-73 (2)'],['Ch29Launcher_Su34','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']],
  [[1700],['R-73 (6)'],['R73Launcher_2','2Rnd_R73','2Rnd_R73','2Rnd_R73']],
  [[1400],['R-73 (4) | FAB-250 (2)'],['R73Launcher','4Rnd_R73'],['AirBombLauncher','2Rnd_FAB_250']],
  [[1600],['R-73 (2) | FAB-250 (4)'],['R73Launcher_2','2Rnd_R73'],['AirBombLauncher','4Rnd_FAB_250']]
 ]
];

_easaVehi = 	_easaVehi + ['Su34'];
_easaDefault = 	_easaDefault + [[['Ch29Launcher_Su34','6Rnd_Ch29'],['R73Launcher','4Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3200],['FAB-250 (10)'],['AirBombLauncher','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']],
  [[2950],['FAB-250 (8) | R-73 (2)'],['AirBombLauncher','4Rnd_FAB_250','4Rnd_FAB_250'],['R73Launcher_2','2Rnd_R73']],
  [[2800],['FAB-250 (6) | R-73 (4)'],['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250'],['R73Launcher','4Rnd_R73']],
  [[3100],['FAB-250 (6) | Ch-29 (4)'],['AirBombLauncher','4Rnd_FAB_250','2Rnd_FAB_250'],['Ch29Launcher_Su34','4Rnd_Ch29']],
  [[3400],['FAB-250 (4) | Ch-29 (4) | R-73 (2)'],['AirBombLauncher','4Rnd_FAB_250'],['Ch29Launcher_Su34','4Rnd_Ch29'],['R73Launcher_2','2Rnd_R73']],
  [[2700],['FAB-250 (4) | R-73 (6)'],['AirBombLauncher','4Rnd_FAB_250'],['R73Launcher_2','2Rnd_R73'],['R73Launcher','4Rnd_R73']],
  [[2500],['FAB-250 (4) | Ch-29 (6)'],['AirBombLauncher','4Rnd_FAB_250'],['Ch29Launcher_Su34','6Rnd_Ch29']],
  [[2400],['FAB-250 (2) | R-73 (8)'],['AirBombLauncher','2Rnd_FAB_250'],['R73Launcher','4Rnd_R73','4Rnd_R73']],
  [[2600],['FAB-250 (2) | R-73 (4) | Ch-29 (4)'],['AirBombLauncher','2Rnd_FAB_250'],['R73Launcher','4Rnd_R73'],['Ch29Launcher_Su34','4Rnd_Ch29']],
  [[2700],['FAB-250 (2) | R-73 (2) | Ch-29 (6)'],['AirBombLauncher','2Rnd_FAB_250'],['R73Launcher_2','2Rnd_R73'],['Ch29Launcher_Su34','6Rnd_Ch29']],
  [[2200],['R-73 (10)'],['R73Launcher','4Rnd_R73','4Rnd_R73'],['R73Launcher_2','2Rnd_R73']],
  [[2900],['Ch-29 (6) | R-73 (4)'],['Ch29Launcher_Su34','6Rnd_Ch29'],['R73Launcher','4Rnd_R73']],
  [[3500],['Ch-29 (10)'],['Ch29Launcher_Su34','6Rnd_Ch29','4Rnd_Ch29']]
 ]
];

_easaVehi = 	_easaVehi + ['Mi24_P'];
_easaDefault = 	_easaDefault + [[['HeliBombLauncher','2Rnd_FAB_250']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[500],['FAB-250 (2)'],['HeliBombLauncher','2Rnd_FAB_250']],
  [[300],['R-73 (2)'],['R73Launcher_2','2Rnd_R73']]
 ]
];

if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {
	_easaVehi = 	_easaVehi + ['Ka52'];
	_easaDefault = 	_easaDefault + [[['AT9Launcher','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]];
	_easaLoadout = 	_easaLoadout + [
	 [
	  [[2150],['AT-9 (4) | AIM-9L (8)'],['AT9Launcher','4Rnd_AT9_Mi24P'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
	  [[2250],['AT-9 (8) | AIM-9L (4)'],['AT9Launcher','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
	  [[2400],['AT-9 (12)'],['AT9Launcher','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']],
	  [[1900],['AIM-9L (12)'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]
	 ]
	];

	_easaVehi = 	_easaVehi + ['Ka52Black'];
	_easaDefault = 	_easaDefault + [[['AT9Launcher','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]];
	_easaLoadout = 	_easaLoadout + [
	 [
	  [[2150],['AT-9 (4) | AIM-9L (8)'],['AT9Launcher','4Rnd_AT9_Mi24P'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
	  [[2250],['AT-9 (8) | AIM-9L (4)'],['AT9Launcher','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
	  [[2400],['AT-9 (12)'],['AT9Launcher','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']],
	  [[1900],['AIM-9L (12)'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]
	 ]
	];
};

_easaVehi = 	_easaVehi + ['F35B'];
_easaDefault = 	_easaDefault + [[['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_F35','2Rnd_Sidewinder_F35']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[1950],['GBU-12 (4)'],['BombLauncherA10','4Rnd_GBU12']],
  [[1500],['GBU-12 (2) | AIM-9L (2)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_F35','2Rnd_Sidewinder_F35']],
  [[1750],['GBU-12 (2) | AGM-65 (2)'],['BombLauncherF35','2Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[2250],['AGM-65 (4)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[1200],['AIM-9L (4)'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']]
 ]
];

_easaVehi = 	_easaVehi + ['AV8B'];
_easaDefault = 	_easaDefault + [[['BombLauncher','6Rnd_GBU12_AV8B']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3600],['Mk82 (6)'],['Mk82BombLauncher_6','6Rnd_Mk82']],
  [[3500],['GBU-12 (6)'],['BombLauncher','6Rnd_GBU12_AV8B']],
  [[2900],['GBU-12 (4) | AIM-9L (2)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3400],['GBU-12 (4) | AGM-65 (2)'],['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[2700],['GBU-12 (2) | AIM-9L (4)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3000],['GBU-12 (2) | AIM-9L (2) | AGM-65 (2)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[2200],['AIM-9L (6)'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3800],['AGM-65 (6)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]
 ]
];

_easaVehi = 	_easaVehi + ['AV8B2'];
_easaDefault = 	_easaDefault + [[['Mk82BombLauncher_6','6Rnd_Mk82'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[4200],['GBU-12 (8)'],['BombLauncherA10','4Rnd_GBU12','4Rnd_GBU12']],
  [[4100],['GBU-12 (6) | AGM-65 (2)'],['BombLauncher','6Rnd_GBU12_AV8B'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3800],['GBU-12 (6) | AIM-9L (2)'],['BombLauncher','6Rnd_GBU12_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[4300],['GBU-12 (4) | AGM-65 (4)'],['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3400],['GBU-12 (4) | AIM-9L (4)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3600],['GBU-12 (4) | AIM-9L (2) | AGM-65 (2)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3200],['GBU-12 (2) | AIM-9L (4) | AGM-65 (2)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3500],['GBU-12 (2) | AIM-9L (2) | AGM-65 (4)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3100],['GBU-12 (2) | AIM-9L (6)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3600],['GBU-12 (2) | AGM-65 (6)'],['BombLauncherF35','2Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3900],['Mk82 (6) | AIM-9L (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[4400],['Mk82 (6) | AGM-65 (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[4550],['Mk82 (6) | GBU-12 (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['BombLauncherF35','2Rnd_GBU12']],
  [[4600],['AGM-65 (8)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3700],['AGM-65 (4) | AIM-9L (4)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3900],['AGM-65 (6) | AIM-9L (2)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3200],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH64','8Rnd_Sidewinder_AH64']],
  [[3300],['AIM-9L (6) | AGM-65 (2)'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']]
 ]
];

_easaVehi = 	_easaVehi + ['A10'];
_easaDefault = 	_easaDefault + [[['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[4200],['GBU-12 (8)'],['BombLauncherA10','4Rnd_GBU12','4Rnd_GBU12']],
  [[4100],['GBU-12 (6) | AGM-65 (2)'],['BombLauncher','6Rnd_GBU12_AV8B'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3800],['GBU-12 (6) | AIM-9L (2)'],['BombLauncher','6Rnd_GBU12_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[4300],['GBU-12 (4) | AGM-65 (4)'],['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3400],['GBU-12 (4) | AIM-9L (4)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3600],['GBU-12 (4) | AIM-9L (2) | AGM-65 (2)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3200],['GBU-12 (2) | AIM-9L (4) | AGM-65 (2)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3500],['GBU-12 (2) | AIM-9L (2) | AGM-65 (4)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3100],['GBU-12 (2) | AIM-9L (6)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3600],['GBU-12 (2) | AGM-65 (6)'],['BombLauncherF35','2Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3900],['Mk82 (6) | AIM-9L (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[4400],['Mk82 (6) | AGM-65 (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[4550],['Mk82 (6) | GBU-12 (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['BombLauncherF35','2Rnd_GBU12']],
  [[4600],['AGM-65 (8)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3700],['AGM-65 (4) | AIM-9L (4)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3900],['AGM-65 (6) | AIM-9L (2)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3200],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH64','8Rnd_Sidewinder_AH64']],
  [[3300],['AIM-9L (6) | AGM-65 (2)'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']]
 ]
];

_easaVehi = 	_easaVehi + ['A10_US_EP1'];
_easaDefault = 	_easaDefault + [[['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [[4200],['GBU-12 (8)'],['BombLauncherA10','4Rnd_GBU12','4Rnd_GBU12']],
  [[4300],['GBU-12 (4) | AGM-65 (4)'],['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3400],['GBU-12 (4) | AIM-9L (4)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3600],['GBU-12 (4) | AIM-9L (2) | AGM-65 (2)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[4600],['AGM-65 (8)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3700],['AGM-65 (4) | AIM-9L (4)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3900],['AGM-65 (6) | AIM-9L (2)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3200],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3300],['AIM-9L (6) | AGM-65 (2)'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']]
 ]
} else {
 [
  [[4200],['GBU-12 (8)'],['BombLauncherA10','4Rnd_GBU12','4Rnd_GBU12']],
  [[4100],['GBU-12 (6) | AGM-65 (2)'],['BombLauncher','6Rnd_GBU12_AV8B'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3800],['GBU-12 (6) | AIM-9L (2)'],['BombLauncher','6Rnd_GBU12_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[4300],['GBU-12 (4) | AGM-65 (4)'],['BombLauncherA10','4Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3400],['GBU-12 (4) | AIM-9L (4)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3600],['GBU-12 (4) | AIM-9L (2) | AGM-65 (2)'],['BombLauncherA10','4Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3200],['GBU-12 (2) | AIM-9L (4) | AGM-65 (2)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[3500],['GBU-12 (2) | AIM-9L (2) | AGM-65 (4)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3100],['GBU-12 (2) | AIM-9L (6)'],['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3600],['GBU-12 (2) | AGM-65 (6)'],['BombLauncherF35','2Rnd_GBU12'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3900],['Mk82 (6) | AIM-9L (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[4400],['Mk82 (6) | AGM-65 (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['MaverickLauncher','2Rnd_Maverick_A10']],
  [[4550],['Mk82 (6) | GBU-12 (2)'],['Mk82BombLauncher_6','6Rnd_Mk82'],['BombLauncherF35','2Rnd_GBU12']],
  [[4600],['AGM-65 (8)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']],
  [[3700],['AGM-65 (4) | AIM-9L (4)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B']],
  [[3900],['AGM-65 (6) | AIM-9L (2)'],['MaverickLauncher','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z']],
  [[3200],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH64','8Rnd_Sidewinder_AH64']],
  [[3300],['AIM-9L (6) | AGM-65 (2)'],['SidewinderLaucher','4Rnd_Sidewinder_AV8B'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10']]
 ]
}
];

_easaVehi = 	_easaVehi + ['AH64D'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher','8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [[2900],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]
 ]
} else {
 [
  [[2900],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH64','8Rnd_Sidewinder_AH64']]
 ]
}
];

_easaVehi = 	_easaVehi + ['AH64D_EP1'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher','8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [[2900],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]
 ]
} else {
 [
  [[2900],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH64','8Rnd_Sidewinder_AH64']]
 ]
}
];

_easaVehi = 	_easaVehi + ['AH1Z'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher','8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2900],['AGM-114 (8)'],['HellfireLauncher','8Rnd_Hellfire']],
  [[3100],['AIM-9L (8)'],['SidewinderLaucher_AH64','8Rnd_Sidewinder_AH64']]
 ]
];

missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];
missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];
missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];