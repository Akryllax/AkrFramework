/*
 * File: gui.sqf
 * Description: GUI manager.
 */

_mode = param [0,"",[""]];
_ret = [];

_init = 
{
    _args = param [1,[],[[]]];
    {
        _name = _x select 0;
        switch (_x select 1) do
        {
            case "hud":
            {
                88 cutRsc [_name,"PLAIN"];
            };
            case "disp":
            {
                
            };
            default {};
        };
    } forEach _args;
};

switch (_mode) do {
    case "init": 
    {
        _ret = _this call _init;
	};
    case "addstacked":
    {
        
    };
    default 
    {

    };
};