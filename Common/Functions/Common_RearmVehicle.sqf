Private["_amount","_get","_isArtillery","_magazines","_side","_type","_vehicle"];

_vehicle = _this select 0;
_side = _this select 1;
_type = typeOf _vehicle;

//rearming turrets.
{_vehicle removeMagazine _x} forEach magazines _vehicle;

_magazines = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "Magazines");
_magazines = _magazines + getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Magazines");

{_vehicle addMagazine _x} forEach _magazines;

//--- CM Parameter.
if (_vehicle isKindOf "Air") then {
	switch (missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") do { //--- Add CM if needed.
		case 1: { //--- Enabled with upgrades.
			if (((_side Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_FLARESCM) > 0) then {
				_amount = if (_vehicle isKindOf "Plane") then {missionNamespace getVariable 'WFBE_C_UNITS_COUNTERMEASURE_PLANES'} else {missionNamespace getVariable 'WFBE_C_UNITS_COUNTERMEASURE_CHOPPERS'};
				_vehicle setVariable ["FlareCount", _amount];
			};
		};
		case 2: { //--- Enabled.
			_amount = if (_vehicle isKindOf "Plane") then {missionNamespace getVariable 'WFBE_C_UNITS_COUNTERMEASURE_PLANES'} else {missionNamespace getVariable 'WFBE_C_UNITS_COUNTERMEASURE_CHOPPERS'};
			_vehicle setVariable ["FlareCount", _amount];
		};
	};
};

//--- IR Smoke
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE") > 0) then {
	//--- Make sure that the unit is defined in IRS_Init.
	_get = missionNamespace getVariable Format ["%1_IRS", _type];
	if (!isNil '_get' && !isNil {_vehicle getVariable "wfbe_irs_flares"}) then {
		if ((_vehicle getVariable "wfbe_irs_flares") != (_get select 1)) then {_vehicle setVariable ["wfbe_irs_flares", _get select 1, true]};
	};
};

_vehicle setVehicleAmmo 1;
reload _vehicle;

/* Are we dealing with an artillery unit ? */
_isArtillery = -1;
_isArtillery = [_type,_side] Call IsArtillery;
if (_isArtillery != -1) then {[_vehicle,_isArtillery,_side] Call EquipArtillery};

/* Balanced Unit */
if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {(_vehicle) Spawn BalanceInit};

/* EASA Module */
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA") > 0) then {
	if (_type in (missionNamespace getVariable 'WFBE_EASA_Vehicles')) then {
		_get = _vehicle getVariable 'WFBE_EASA_Setup';
		if !(isNil '_get') then {[_vehicle,0] Call EASA_Equip};
	};
};