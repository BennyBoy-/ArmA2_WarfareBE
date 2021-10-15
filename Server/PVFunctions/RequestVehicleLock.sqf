Private["_client","_locked","_side","_vehicle"];

_vehicle = _this select 0;
_locked = _this select 1;

_vehicle lock _locked;

// WFBE_SetVehicleLock = [nil,'CLTFNCSETVEHICLELOCK',[_vehicle,_locked]];
// publicVariable 'WFBE_SetVehicleLock';
// if (isHostedServer) then {[nil,'CLTFNCSETVEHICLELOCK',[_vehicle,_locked]] Spawn HandlePVF};
[nil, "SetVehicleLock", [_vehicle,_locked]] Call WFBE_CO_FNC_SendToClients;