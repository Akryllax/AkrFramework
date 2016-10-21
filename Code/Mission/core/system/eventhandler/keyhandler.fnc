#include "Keycodes.h"
/*
 * File: keyhandler.fnc
 * Description: Spells manager.
 */

_mode = param [0,"",[""]];
_ret = [];

_init = 
{
	keyfilter_down = 
	[
		[DIK_F2, {hint "Nigga";},true]
	];
	keyfilter_up = [];
	down_handler = ((findDisplay 46) displayAddEventHandler ["KeyDown", compile (preprocessFileLineNumbers "core\system\eventhandler\subdownkeyhandler.fnc")]);
	up_handler = ((findDisplay 46) displayAddEventHandler ["KeyUp", compile (preprocessFileLineNumbers "core\system\eventhandler\subupkeyhandler.fnc")]);
	_ret = [];
};
_add =
{
	_key = param[1,-1,[-1]];
	_fnc = param[2,{},[{},""]];
	_triggered = param[3,false,[false]];
	_down = param [4,"down",[""]];

	if(_key > 0) then {
		if(_down == "down") then {
			if(typeName _fnc == "STRING") then {
				_fnc = compile preprocessFileLineNumbers _fnc;
			};

			keyfilter_down pushBack [_key,_fnc,_triggered];
		} else {
			if(typeName _fnc == "STRING") then {
				_fnc = compile preprocessFileLineNumbers _fnc;
			};

			keyfilter_up pushBack [_key,_fnc,_triggered];
		};
	};

	_ret = [];
};

switch (_mode) do {
    case "init": 
    {
        _this call _init;
	};
	case "add":
	{
		_this call _add;
	};
	default 
	{

	};
};

_ret