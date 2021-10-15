//--- ArmA 2 countermeasures, by Maddmatt.
Private ["_dirpos","_div","_emmiters","_flare","_flarecount","_flares","_flarevel","_i","_launchercount","_li","_muzzzlevel","_relpos","_sm","_sp","_vehicle","_vvel"];
_vehicle = _this select 0;
_flares = [];
_emmiters = [];
_muzzzlevel = 25;
if (_vehicle isKindOf "Plane") then {_muzzzlevel = 150};
_launchercount = 0;
while {([0,0,0] distance (_vehicle selectionPosition (format ["flare_launcher%1",_launchercount+1]))) != 0} do {_launchercount = _launchercount+1};

for "_i" from 1 to (_launchercount) do {
	_flarecount = (_vehicle getVariable "FlareCount") - 1;
	_vehicle setVariable ["FlareCount", _flarecount];
	_relpos = _vehicle modelToWorld (_vehicle selectionPosition format["flare_launcher%1",_i]);
	_dirpos = _vehicle modelToWorld (_vehicle selectionPosition format["flare_launcher%1_dir",_i]);
	_flare = "FlareCountermeasure" createVehicleLocal _relpos;
	_dirpos = [(_dirpos select 0) - (_relpos select 0),(_dirpos select 1) - (_relpos select 1),(_dirpos select 2) - (_relpos select 2)];
	_div = abs(_dirpos select 0)+abs(_dirpos select 1)+abs(_dirpos select 2);
	_flarevel = [(_dirpos select 0)/_div*_muzzzlevel,(_dirpos select 1)/_div*_muzzzlevel,(_dirpos select 2)/_div*_muzzzlevel];
	_vvel = velocity _vehicle;

	_flare setVelocity [(_flarevel select 0) + (_vvel select 0),(_flarevel select 1) + (_vvel select 1),(_flarevel select 2) + (_vvel select 2)];
	_flares = _flares + [_flare];

	_sm = "#particlesource" createVehicleLocal getpos _flare;
	_sm setParticleRandom [0.5, [0.3, 0.3, 0.3], [0.5, 0.5, 0.5], 0, 0.3, [0, 0, 0, 0], 0, 0,360];
	_sm setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8,0],"", "Billboard", 1, 3, [0, 0, 0],[0,0,0], 1, 1, 0.80, 0.5, [1.3,4],[[0.9,0.9,0.9,0.6], [1,1,1,0.3], [1,1,1,0]],[1],0.1,0.1,"","",_flare];
	_sm setDropInterval 0.02;

	_sp = "#particlesource" createVehicleLocal getpos _flare;
	_sp setParticleRandom [0.03, [0.3, 0.3, 0.3], [1, 1, 1], 0, 0.2, [0, 0, 0, 0], 0, 0,360];
	_sp setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2,0],"", "Billboard", 1, 0.1, [0, 0, 0],[0,0,0], 1, 1, 0.80, 0.5, [1.5,0],[[1,1,1,-4], [1,1,1,-4], [1,1,1,-2],[1,1,1,0]],[1000],0.1,0.1,"","",_flare,360];
	_sp setDropInterval 0.001;

	_li = "#lightpoint" createVehicleLocal getpos _flare;
	_li setLightBrightness 0.1;
	_li setLightAmbient [0.8, 0.6, 0.2];
	_li setLightColor [1, 0.5, 0.2];
	_li lightAttachObject [_flare, [0,0,0]];
	_emmiters = _emmiters + [_sm,_sp,_li];
};

(_emmiters + _flares) spawn {
	sleep 4.5 + random 1;
	{deletevehicle _x} forEach _this;
};