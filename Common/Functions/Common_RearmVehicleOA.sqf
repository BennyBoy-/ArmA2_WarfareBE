Private['_amount','_get','_isArtillery','_magazines','_side','_turrets','_type','_vehicle'];

_vehicle = _this select 0;
_side = _this select 1;
_type = typeOf _vehicle;

//--- Clear the vehicle first.
_vehicle setVehicleAmmo 0;

//--- Get all weapons on the vehicles (Turrets) & reload.
_turrets = (_vehicle) Call WFBE_CO_FNC_GetVehicleTurretsGear;
[_vehicle, _turrets] Call WFBE_CO_FNC_SetTurretsMagazines;

//--- Driver specific loadout.
_magazines = getArray(configFile >> "CfgVehicles" >> typeOf _vehicle >> "magazines");
{_vehicle addMagazineTurret [_x, [-1]]} forEach _magazines;

//--- Reload the vehicle.
reload _vehicle;

//--- IR Smoke
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE") > 0) then {
	//--- Make sure that the unit is defined in IRS_Init.
	_get = missionNamespace getVariable Format ["%1_IRS", _type];
	if (!isNil '_get' && !isNil {_vehicle getVariable "wfbe_irs_flares"}) then {
		if ((_vehicle getVariable "wfbe_irs_flares") != (_get select 1)) then {_vehicle setVariable ["wfbe_irs_flares", _get select 1, true]};
	};
};

//--- Are we dealing with an artillery unit ?.
_isArtillery = [_type, _side] Call IsArtillery;
if (_isArtillery != -1) then {[_vehicle, _isArtillery, _side] Call EquipArtillery};

//--- Balanced Unit.
if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {(_vehicle) Spawn BalanceInit};

if (_vehicle isKindOf "Air") then {
	if !(WF_A2_Vanilla) then {
		switch (missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") do { //--- Remove CM if needed.
			case 0: {(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures}; //--- Disabled.
			case 1: { //--- Enabled with upgrades.
				if (((_side Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_FLARESCM) == 0) then {
					(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures;
				};
			};
		};
	};
};

//--- EASA Module.
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA") > 0) then {
	if (_type in (missionNamespace getVariable 'WFBE_EASA_Vehicles')) then {
		_get = _vehicle getVariable 'WFBE_EASA_Setup';
		if !(isNil '_get') then {[_vehicle, 0] Call EASA_Equip};
	};
};