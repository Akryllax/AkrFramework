_source = "#particlesource" createVehicleLocal getPos player;
_source setParticleParams
[
    [
        "\A3\data_f\ParticleEffects\Universal\Refract.p3d",
        1,
        0,
        1,
        0
    ],
    "",
    "Billboard",
    1,
    4,
    [
        0,
        0,
        0
    ],
    [
        0,
        0,
        0.5
    ],
    1,
    1.30,
    1,
    .2,
    [
        0.03,
        0.03,
        0.03,
        0
    ],
    [
        [
            1,
            1,
            1,
            1
        ],
        [
            1,
            1,
            1,
            1
        ]
    ],
    [
        1.5,
        0.5
    ],
    0.01,
    0.08,
    "",
    "",
    _this,
    0,
    true,
    0.5,
    [
        [
            .5,
            .5,
            1,
            1
        ]
    ]
];


_source setParticleRandom
		[
            2,
		    [   
                2,
                2,
                0.25
            ],
	        [
                0,
                0,
                0
            ],
		    1,
		    5,
		    [
                .3,
                .3,
                1,
                0.5
            ],
	        0.01,
	        0.03,
		    10
        ];

_source setParticleCircle
[
	5,
	[
        0,
        0,
        0.5
    ]
];

_source setDropInterval 0.003;

_source spawn {
    keepTrack = true;

    _this spawn {
        sleep 3;
        _this enableSimulation false;
        sleep 10;
        keepTrack = false;
        deleteVehicle _this; 
    };

    while {keepTrack} do {
        _this setPos getPos player;
    }
}