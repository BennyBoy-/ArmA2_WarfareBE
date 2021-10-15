switch (typeOf _this) do {
	case "HMMWV_Avenger": {
		if (WF_A2_Vanilla) then {
			_this removeWeapon "SidewinderLaucher_AH1Z";
			_this removeWeapon "StingerLaucher";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addMagazine "2Rnd_Sidewinder_AH1Z";
			_this addWeapon "SidewinderLaucher_AH1Z";
		};
	};
	case "M6_EP1": {
		_this removeWeapon "StingerLaucher_4x";
		_unit addMagazine "4Rnd_Sidewinder_AV8B";
		_unit addMagazine "4Rnd_Sidewinder_AV8B";
		_unit addWeapon "SidewinderLaucher";
	};
	case "Ka52": {
		_this removeWeapon "AT9Launcher";
		_this removeWeapon "VikhrLauncher";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addWeapon "AT9Launcher";
		_this addMagazine "2Rnd_Sidewinder_AH1Z";
		_this addMagazine "2Rnd_Sidewinder_AH1Z";
		_this addWeapon "SidewinderLaucher_AH1Z";
	};
	case "Ka52Black": {
		_this removeWeapon "AT9Launcher";
		_this removeWeapon "VikhrLauncher";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addWeapon "AT9Launcher";
		_this addMagazine "2Rnd_Sidewinder_AH1Z";
		_this addMagazine "2Rnd_Sidewinder_AH1Z";
		_this addWeapon "SidewinderLaucher_AH1Z";
	};
	// case "2S6M_Tunguska": {
		// _this addMagazine "4Rnd_Stinger";
		// _this addMagazine "4Rnd_Stinger";
		// _this addWeapon "StingerLaucher_4x";
	// };
	case "An2_TK_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addWeapon "TwinVickers";
		_unit addMagazine "60Rnd_CMFlareMagazine";
		_unit addWeapon "CMFlareLauncher";
	};
	case "An2_1_TK_CIV_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addWeapon "TwinVickers";
		_unit addMagazine "60Rnd_CMFlareMagazine";
		_unit addWeapon "CMFlareLauncher";
	};
	case "An2_2_TK_CIV_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addWeapon "TwinVickers";
		_unit addMagazine "60Rnd_CMFlareMagazine";
		_unit addWeapon "CMFlareLauncher";
	};
};