/* Structures */
missionNamespace setVariable ['WFBE_NEURODEF_BARRACKS_WALLS',[
	['Land_HBarrier_large',[8,0,0],90],
	['Land_HBarrier_large',[8,10,0],90],
	['Land_HBarrier_large',[8,-7.5,0],90],
	['Land_HBarrier_large',[5,-11,0],180],
	['Land_HBarrier_large',[0.5,-11,0],180],
	['Land_HBarrier_large',[-6,-11,0],180],
	['Land_HBarrier_large',[-9.5,-7.5,0],90],
	['Land_HBarrier_large',[-9.5,2.5,0],90],
	['Land_HBarrier_large',[5,13,0],180],
	['Land_HBarrier_large',[0.5,13,0],180],
	['Land_HBarrier_large',[-6,13,0],180],
	['Land_HBarrier_large',[-9.5,9.5,0],90]
]];

missionNamespace setVariable ['WFBE_NEURODEF_LIGHT_WALLS',[
	['Land_HBarrier_large',[10,-1,0],90],
	['Land_HBarrier_large',[10,9,0],-90],
	['Land_HBarrier_large',[10,-8.5,0],90],
	['Land_HBarrier_large',[7,-12,0],180],
	['Land_HBarrier_large',[0,-12,0],180],
	['Land_HBarrier_large',[-7,-12,0],180],
	['Land_HBarrier_large',[7,12,0],180],
	['Land_HBarrier_large',[0,12,0],180],
	['Land_HBarrier_large',[-7,12,0],180],
	['Land_HBarrier_large',[-11,-9,0],90],
	['Land_HBarrier_large',[-11,-1.5,0],90],
	['Land_HBarrier_large',[-11,6,0],90],
	['Land_HBarrier_large',[-11,9,0],90]
]];

missionNamespace setVariable ['WFBE_NEURODEF_COMMANDCENTER_WALLS',[
	['Land_HBarrier_large',[4,-3.5,0],90],
	['Land_HBarrier_large',[4,4,0],90],
	['Land_HBarrier_large',[1,7.5,0],180],
	['Land_HBarrier_large',[-2.5,7.5,0],180],
	['Land_HBarrier_large',[-5.5,4,0],90],
	['Land_HBarrier_large',[-5.5,-3.5,0],90],
	['Land_HBarrier5',[4,-6.5,0],180]
]];

missionNamespace setVariable ['WFBE_NEURODEF_SERVICEPOINT_WALLS',[
	['Land_HBarrier_large',[4,-3.5,0],90],
	['Land_HBarrier_large',[4,4,0],90],
	['Land_HBarrier_large',[1,7.5,0],180],
	['Land_HBarrier_large',[-2.5,7.5,0],180],
	['Land_HBarrier_large',[-5.5,4,0],90],
	['Land_HBarrier_large',[-5.5,-3.5,0],90],
	['Land_HBarrier5',[4,-6.5,0],180]
]];

missionNamespace setVariable ['WFBE_NEURODEF_HEAVY_WALLS',[
	['Land_HBarrier_large',[14,-1,0],90],
	['Land_HBarrier_large',[14,9,0],-90],
	['Land_HBarrier_large',[14,-8.5,0],90],
	['Land_HBarrier_large',[14,-11,0],90],
	['Land_HBarrier_large',[11,-14.5,0],180],
	['Land_HBarrier_large',[4.5,-14.5,0],180],
	['Land_HBarrier_large',[-3,-14.5,0],180],
	['Land_HBarrier_large',[-10.5,-14.5,0],180],
	['Land_HBarrier_large',[-14,-11,0],90],
	['Land_HBarrier_large',[-14,-3.5,0],90],
	['Land_HBarrier_large',[-14,4,0],90],
	['Land_HBarrier_large',[-14,9.5,0],90],
	['Land_HBarrier_large',[11,13,0],180],
	['Land_HBarrier_large',[3.5,13,0],180],
	['Land_HBarrier_large',[-4,13,0],180],
	['Land_HBarrier_large',[-11,13,0],-180]
]];

missionNamespace setVariable ['WFBE_NEURODEF_AIRCRAFT_WALLS',[
	['Land_HBarrier_large',[10,-1,0],90],
	['Land_HBarrier_large',[10,9,0],-90],
	['Land_HBarrier_large',[10,-8.5,0],90],
	['Land_HBarrier_large',[7,-12,0],180],
	['Land_HBarrier_large',[0,-12,0],180],
	['Land_HBarrier_large',[-7,-12,0],180],
	['Land_HBarrier_large',[7,12,0],180],
	['Land_HBarrier_large',[0,12,0],180],
	['Land_HBarrier_large',[-7,12,0],180],
	['Land_HBarrier_large',[-11,-9,0],90],
	['Land_HBarrier_large',[-11,-1.5,0],90],
	['Land_HBarrier_large',[-11,6,0],90],
	['Land_HBarrier_large',[-11,9,0],90]
]];

missionNamespace setVariable ['WFBE_NEURODEF_MG',[
	[if (WF_A2_Vanilla) then {'Land_fortified_nest_small'} else {'Land_fortified_nest_small_EP1'},[0.25,0,0],180],
	['Land_fort_bagfence_corner',[-1,-3,0],0]
]];

missionNamespace setVariable ['WFBE_NEURODEF_AAPOD',[
	['Land_fort_bagfence_round',[0,2,0],0],
	['Land_fort_bagfence_long',[-2.8,-1.7,0],90],
	['Land_fort_bagfence_long',[2.8,-1.7,0],90],
	['Land_fort_bagfence_long',[1.4,-5.5,0],0],
	['Land_fort_bagfence_corner',[-1.8,-5,0],0]
]];

missionNamespace setVariable ['WFBE_NEURODEF_MASH',[
	['Land_fort_bagfence_corner',[-3,3,0],270],
	['Land_fort_bagfence_long',[-3.5,-0.2,0],90],
	['Land_fort_bagfence_corner',[-2.5,-3.5,0],0],
	['Land_fort_bagfence_long',[0.5,-4,0],0],
	['Land_fort_bagfence_corner',[3.5,-3,0],90],
	['Land_fort_bagfence_long',[4,-0.2,0],90],
	['Land_fort_bagfence_corner',[3,3.5,0],180]
]];