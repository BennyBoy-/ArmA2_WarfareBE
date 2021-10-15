Private ['_ammo','_currentUpgrades','_extMagUpgr','_i','_index','_side','_unit'];
_unit = _this select 0;
_index = _this select 1;
_side = _this select 2;

//--- Browse for extended Mags (WP, SADARM... )
_ammo = (missionNamespace getVariable Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS',_side]) select _index;
if (count _ammo == 0) exitWith {};

_extMagUpgr = missionNamespace getVariable Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE',_side];

//--- Retrieve the Artillery upgrade level.
_currentUpgrades = ((_side) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_ARTYAMMO;

for [{_i = 0},{_i < count(_ammo)},{_i = _i + 1}] do {
	if (_currentUpgrades >= ((_extMagUpgr select _index) select _i)) then {
		_unit addMagazine (_ammo select _i);
	};
};