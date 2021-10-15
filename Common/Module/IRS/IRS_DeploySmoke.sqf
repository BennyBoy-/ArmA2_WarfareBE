/*ArmA 2 smokscreen, by Maddmatt
Uses code from VBS2 Smoke launcher by Philipp Pilhofer (raedor) & Andrew Barron
*/

Private ["_vehicle"];

_vehicle = _this;
_shells = [];

//Read values from config
_smoke_count = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "smokeLauncherGrenadeCount");
_smoke_velocity = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "smokeLauncherVelocity");
_smoke_turret = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "smokeLauncherOnTurret");
_smoke_angle = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "smokeLauncherAngle");

_dir = direction _vehicle;
if (_smoke_turret == 1 && (count weapons _vehicle) > 0) then {
	_dir = _vehicle weaponDirection ((weapons _vehicle) select 0);
	_dir = (((_dir select 0) atan2 (_dir select 1))+360)%360;
};

_delta = _smoke_angle / _smoke_count; //degrees between grenades.
_arc = _delta * (_smoke_count-1);	//total arc to cover, in degrees

//distance from vehicle center where grenades are created; base it on vertical height
_initDist = (((boundingBox _vehicle) select 1) select 2) - (((boundingBox _vehicle) select 0) select 2);

for "_i" from 0 to (_smoke_count - 1) do {
	//find starting parameters
	_Hdir = (_i * _delta) - (_arc / 2); //relative direction around vehicle
	_Vdir = 30;	//angle of elevation. Temporary: launch all grenades at same angle

	//derive velocity
	_vH = _smoke_velocity * cos _Vdir; //horizontal component of velocity
	_vV = _smoke_velocity * sin _Vdir; //vertical component
	_Gvel = [_vH*sin (_Hdir+_dir), _vH*cos (_Hdir+_dir), _vV]; //initial grenade velocity
	
	//find starting position for grenades
	_pH = _initDist * cos _Vdir; //initial distance horizontally away from vehicle center to create grenade
	_pV = _initDist * sin _Vdir; //vertical distance

	//create / launch the grenade
	_smokeg = "SmokeShellVehicle" createVehicle (_vehicle modelToWorld [_pH * sin _Hdir, _pH * cos _Hdir, _pV]);
	_smokeg setVelocity _Gvel;
	_smokeg setVectorDir _Gvel;
	_shells = _shells + [_smokeg];
};

[nil, "HandleSpecial", ["irsmoke-createfx", _shells]] Call WFBE_CO_FNC_SendToClients;
if (isMultiplayer) then {{_x Spawn WFBE_CO_MOD_IRS_CreateSmoke} forEach _shells};

sleep 55;

{deleteVehicle _x} forEach _shells;