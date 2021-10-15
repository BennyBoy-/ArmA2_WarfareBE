Private ["_index"];
_index = _this select 0;

switch (_index) do {
	case 0: {
		// None.
		"colorCorrections" ppEffectEnable false;
		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		"filmGrain" ppEffectEnable false; 
	};
	case 1: {
		// High contrast postprocess added.
		"colorCorrections" ppEffectAdjust [1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
	};
	case 2: {
		// Blue color corrections added (movie night style).
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 0.6, 1.8, 0.7],  [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
	};			
	case 3: {
		// Color corrections.
		"colorCorrections" ppEffectAdjust [1, 0.8, -0.002, [0.0, 0.0, 0.0, 0.0], [0.6, 0.7, 0.8, 0.65],  [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
	};
	case 4: {
		// Color corrections.
		"colorCorrections" ppEffectAdjust [1, 1, -0.0045, [0.0, 0.0, 0.0, 0.0], [1, 0.6, 0.4, 0.4],  [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
		// Light film grain.
		"filmGrain" ppEffectEnable true;
		"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
		"filmGrain" ppEffectCommit 1;
	};
	case 5: {
		// Color corrections.
		"colorCorrections" ppEffectAdjust [1, 1, -0.002, [0.1, 0.05, 0.0, 0.02], [1.2, 1.0, 0.8, 0.666], [0.5, 0.5, 0.5, 0.0]];
		"colorCorrections" ppEffectCommit 1;
		"colorCorrections" ppEffectEnable true;
		// Light film grain.
		"filmGrain" ppEffectEnable true;
		"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
		"filmGrain" ppEffectCommit 1;
	};
};