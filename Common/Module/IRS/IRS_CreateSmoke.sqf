/*
	Create smoke at the desired location.
*/

Private ["_shell", "_source2", "_trails", "_wp"];

_shell = _this;

sleep (1.5 + random 0.5);

_trails = "#particlesource" createVehicleLocal getPosASL _shell;
_trails setDropInterval 0.02;
_trails setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 0, 1], "", "Billboard", 0.1, 1, [0,0,0], [0, 0, 7], 0, 15, 7.9, 0.075, [0.4], [[1, 1, 1, 1]], [0], 1, 0, "\CA\Data\ParticleEffects\SCRIPTS\WPTrail.sqf", "", _shell];
_trails setParticleRandom [0.1, [0.25, 0.25, 0], [15, 15, 7], 0, 0.15, [0, 0, 0, 0], 0, 0];

_wp = "#particlesource" createVehicleLocal getPosASL _shell;
_wp setDropInterval 0.02;
_wp setParticleParams [["\Ca\Data\Cl_basic.p3d", 1, 0, 1], 	"", "Billboard", 1, 10, [0,0,0], [0, 0, 0], 0, 10, 7.9, 0.075, [5, 10, 15,20], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], [0], 1, 0, "", "", _shell];
_wp setParticleRandom [4, [3, 3, 3], [0.1, 0.1, 0.1], 0, 0.25, [0, 0, 0, 0], 0, 0];
	
sleep 0.15;
{deleteVehicle _x} forEach [_trails, _wp];

_source2 = "#particlesource" createVehicleLocal getPosASL _shell;
_source2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8, 0], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 1, 0.025, [0.5, 8, 12, 15], [[1, 1, 1, 1],[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.2], 1, 0.04, "", "", _shell];
_source2 setParticleRandom [2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 0, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
_source2 setDropInterval 0.1;

sleep (55 + random 3);
deleteVehicle _source2;	