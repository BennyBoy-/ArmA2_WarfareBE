Private["_oldScore","_newScore","_playerChanged"];

_playerChanged = _this select 0;
_newScore = _this select 1;

_oldScore = score _playerChanged;
_playerChanged addScore -_oldScore;
_playerChanged addScore _newScore;

// WFBE_ChangeScore = [nil,'CLTFNCCHANGESCORE',[_playerChanged,_newScore]];
// publicVariable 'WFBE_ChangeScore';
// if (isHostedServer) then {[nil,'CLTFNCCHANGESCORE',[_playerChanged,_newScore]] Spawn HandlePVF};
[nil, "ChangeScore", [_playerChanged,_newScore]] Call WFBE_CO_FNC_SendToClients;