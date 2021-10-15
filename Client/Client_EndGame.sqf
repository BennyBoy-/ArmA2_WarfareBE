Private ['_HQ','_base','_blist','_camShotOrder','_camera','_nvgstate','_position','_secTarget','_side','_track','_vehi'];

_side = _this;

//todo improve that script, _side is the looser.

if (_side == west) then {
	_side = east;
} else {
	if (_side == east) then {_side = west};
};

[_side] ExecVM "Client\GUI\GUI_EndOfGameStats.sqf";
//_track = if (WF_A2_Vanilla) then {"Track21_Rise_Of_The_Fallen"} else {"EP1_Track15"}; //---old
_track = if (WF_A2_Vanilla) then {["Track21_Rise_Of_The_Fallen",41]} else {["EP1_Track13",91]}; //---changed-MrNiceGuy
playMusic _track;

_track_hq = [];
_track = [];
{
	if (missionNamespace getVariable Format["WFBE_%1_PRESENT", _x]) then {
		_logik = (_x) Call WFBE_CO_FNC_GetSideLogic;
		_hq = _logik getVariable "wfbe_hq";
		_track_hq = _track_hq + [_hq];
		_track = _track + ([_hq, (_x) Call WFBE_CO_FNC_GetSideStructures] Call SortByDistance);
	};
} forEach ([west,east,resistance] - [_side]);

_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
_blist = [_hq] + _track_hq + ([_hq, (_side) Call WFBE_CO_FNC_GetSideStructures] Call SortByDistance) + _track;

// _base = WestMHQ;
// _secTarget = EastMHQ;
// if (_side == West) then {_base = EastMHQ;_secTarget = WestMHQ};
// _position = getPos _base;

// _blist = [_secTarget,_blist] Call SortByDistance;
// _blist = [_secTarget] + _blist;

//--- Safety Pos.
_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
_vehi = vehicle player;
if (_vehi != player) then {player action ["EJECT", _vehi];_vehi = player};
_vehi setVelocity [0,0,-0.1];
_vehi setPos ([getPos _hq,20,30] Call GetRandomPosition);

if (!isNil "DeathCamera") then {
	DeathCamera cameraEffect["TERMINATE","BACK"];
	camDestroy DeathCamera;
	"colorCorrections" ppEffectEnable false;
	"dynamicBlur" ppEffectEnable false;
};

_camera = "camera" camCreate (getPos (_blist select 0));
_camera camSetDir 0;
_camera camSetFov 0.200;
_camera cameraEffect["Internal","back"];
_camera camSetTarget getPos (_blist select 0);
_camera camSetRelPos [160.80,130.29,140.07];
_camera camCommit 0;
_nvgstate = if (daytime > 18.5 || daytime < 5.5) then {true} else {false};
camUseNVG _nvgstate;

waitUntil {camCommitted _camera};

_camera camSetRelPos [-190.71,190.55,180.94];
_camera camCommit 10;

waitUntil {camCommitted _camera};

_camShotOrder = [[0,100,35],[50,0,20],[0,-50,20],[-50,0,20]];

{
	_camera camSetPos getPos _x;
	_camera camSetTarget getPos _x;
	
	{
		_camera camSetRelPos _x;
		_camera camCommit 5;
		waitUntil {camCommitted _camera};
	} forEach _camShotOrder;
	
	_camera camSetRelPos [0,100,35];
	_camera camCommit 5;
	waitUntil {camCommitted _camera};
} forEach _blist;

sleep 3;
failMission "END1";