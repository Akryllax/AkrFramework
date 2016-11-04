_position = param [0,[0,0,0],[[]]];
cloak_duration = param [1, 0, [0]]; 
keepTrack = param [2, false, [false]];

_source = "#particlesource" createVehicle _position;

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
    _this spawn {
        _tsta = time;
        _audioTsp = time;
        _this say3D "frozen_time";
        while {_tsta + cloak_duration*0.95 > time} do {
            if(time > _audioTsp + 7) then {
                _audioTsp = time;
                _this say3D "frozen_time";
            };
        };
        keepTrack = false;
        deleteVehicle _this; 
    };

    while {keepTrack} do {
        _this setPos (getPos player);
        sleep 0.5;
    }
}
