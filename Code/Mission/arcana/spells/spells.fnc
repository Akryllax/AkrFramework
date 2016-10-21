#include "Keycodes.h"
/*
 * File: spells.fnc
 * Description: Spells manager.
 */

_mode = param [0,"",[""]];
_ret = [];

_init = 
{
	all_spells = "true" configClasses (missionConfigFile >> "CfgSpells" >> "Primary");
	all_spells = all_spells + ("true" configClasses (missionConfigFile >> "CfgSpells" >> "Secondary"));

	_tempTrans = [];

	{
		_id = getNumber (_x >> "id");           		//0
		_name = getText (_x >> "name");         		//1
		_desc = getText (_x >> "description");  		//2
		_type = getText (_x >> "type");					//3
		_category = getText (_x >> "category");			//4
		_requires = getArray (_x >> "requires");		//5
		_psicost = getNumber (_x >> "psicost"); 		//6
		_deltapsi = getNumber (_x >> "deltapsi");		//7
		_toxicity = getNumber (_x >> "toxicity");		//8
		_active = if(getNumber (_x >> "active") > 0);	//9
		_activeEffect = getText (_x >> "activeEffect");	//10
		_pasiveEffect = getText (_x >> "pasiveEffect");	//11
		_duration = getNumber (_x >> "duration");		//12
		_userefresh = getNumber (_x >> "userefresh");	//13
		_spellinit = getText (_x >> "spellinit");		//14

		if(count _spellinit > 0) then {
			_this call (compile (preprocessFileLineNumbers (format["arcana\spells\%1.spell",_spellinit])));
		};
		if(count _activeEffect > 0) then {
			[[[_activeEffect, format["arcana\spells\%1.spell",_activeEffect]]]] call compiler;
		};
		if(count _pasiveEffect > 0) then {
			[[[_pasiveEffect, format["arcana\spells\%1.spell",_pasiveEffect]]]] call compiler;
		};

		_tempTrans pushBack [_id,_name,_desc,_type,_category,_requires,_psicost,_deltapsi,_toxicity,_active,_activeEffect,_pasiveEffect,_duration,_userefresh];
	} forEach (all_spells);

	all_spells = _tempTrans;

	//Set player's spell inventory
	primary_spell = teleport;
	secondary_spell = {};

	//Set KeyHandler
	["add", DIK_TAB, primary_spell, true, "up"] call keyhandler;
	["add", DIK_TAB, teleport_passive, true, "down"] call keyhandler;
	["add", DIK_F1, {player setPos [10000,10000,0];}, true] call keyhandler;
};

_get = 
{
	_param=param[1,-1,[-1,""]];
	_return = [];

	if(typeName _param == "STRING") then {
		{
			if((_x select 1) isEqualTo _param) then {
				_return = _x;
			};
		} forEach (all_spells);
	} else {
		{
			if((_x select 0) == _param) then {
				_return = _x;
			};
		} forEach (all_spells);
	};
	_return
};

_fireprimary = 
{
	if(!isNil "primary_spell") then {
		[] call primary_spell;
	};
};

switch (_mode) do {
    case "init": 
    {
        _this call _init;
	};
	case "get":
	{
		_ret = (_this call _get);
	};
	case "fireprimary":
	{
		_this call _fireprimary;
	};
	default 
	{

	};
};

_ret