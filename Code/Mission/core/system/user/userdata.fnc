_mode = param [0,"",[""]];
_ret = [];

_userLoad = compileFinal 
'playerProfile = profileNamespace getVariable ["playerProfile", []];
	if((count playerProfile) == 0) then {
		playerProfile = 
		[
			["name",profileNameSteam],	//Username, always pulled from here if exists.
			["extra",				//Save addons data here if needed through "add" and "remove" arguments.
				[

				]
			];
		];
	};

	playerProfile;
';

_userSave = compileFinal
	'if((count playerProfile) == 0) then {
		playerProfile = 
		[
			["name",profileNameSteam],	//Username, always pulled from here if exists.
			["extra",				//Save addons data here if needed through "add" and "remove" arguments.
				[

				]
			];
		];
	};
	playerProfile = profileNamespace setVariable ["playerProfile", playerProfile];
	saveProfileNamespace;

	playerProfile;
';

_userAddExtra = compileFinal
	'_data = param [0,[],[[]]];
	_extraInfo = [];
	{
		// Current result is saved in variable _x
		if((_x select 0) isEqualTo "extra") then {
			_extraInfo = [_x,_forEachIndex];
		}
	} forEach playerProfile;
	if((count _extraInfo) == 0) exitWith {_ret = []};
	_extraRow = playerProfile select (_extraInfo select 1);
	_extraData = _extra select 1;
	_extraData pushBack _data;
	_extraRow set [1, _extraData];

	playerProfile set [_extraInfo select 1, _extraRow];
	saveProfileNamespace;
	_ret = playerProfile;
';

switch (_mode) do 
{
	case "load":
	{
		_ret = _this call _userLoad;
	};
	case "save":
	{
		_ret = _this call _userSave;
	};
	case "sync":
	{

	};
	case "add":
	{
		_param = param [1,[],[[]]];
		_ret = [_param] call _userAddExtra;
	};
	case "remove":
	{

	};
	default
	{

	};
};

_ret