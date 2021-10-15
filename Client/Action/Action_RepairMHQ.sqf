Private ["_currency","_currencySym","_currency_system","_hq","_repairPrice","_vehicle"];

_vehicle = _this select 0;

_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
if (alive _hq || (_hq distance _vehicle > 30)) exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_None")};

//--- Is HQ already being fixed?
if (WFBE_Client_Logic getVariable "wfbe_hq_repairing") exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_BeingRepaired")};

_currency_system = missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM";
_repairPrice = (missionNamespace getVariable 'WFBE_C_BASE_HQ_REPAIR_PRICE') * (WFBE_Client_Logic getVariable "wfbe_hq_repair_count");
_currency = if (_currency_system == 0) then {(sideJoined) Call GetSideSupply} else {Call GetPlayerFunds};
_currencySym = if (_currency_system == 0) then {"S"} else {"$"};
if (_currency < _repairPrice) exitWith {hint Format [localize "STR_WF_INFO_Repair_MHQ_Funds",_currencySym,_repairPrice - _currency]};

if (_currency_system == 0) then {
	[sideJoined,-_repairPrice] Call ChangeSideSupply;
} else {
	-(_repairPrice) Call ChangePlayerFunds;
};

["RequestMHQRepair", sideJoined] Call WFBE_CO_FNC_SendToServer;

WF_Logic setVariable [Format ["%1MHQRepair",sideJoinedText],true,true];

hint (localize "STR_WF_INFO_Repair_MHQ_Repair");