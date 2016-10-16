#include <Keycodes.h>
#define DEBUG
/*
	File: fn_KeyHandler.sqf
	Author: Akryllax
	Desc: All-in-One keydown handler for civilians.
	Ment to be executed once.
*/

private["_display", "_key", "_shift", "_ctrl", "_alt", "_triggered"];

_display = 	[_this, 0, displayNull, [displayNull]] call BIS_fnc_param;
_key = 		[_this, 1, -1,[-1]] call BIS_fnc_param;
_shift = 	[_this, 2, false,[false]] call BIS_fnc_param;
_ctrl = 	[_this, 3, false,[false]] call BIS_fnc_param;
_alt = 		[_this, 4, false,[false]] call BIS_fnc_param;

_triggered = false;

{
	// Current result is saved in variable _x
	if((_x select 0) isEqualTo _key) then {
		_this call (_x select 1);
		_triggered = _x param [2,false,[false]]; 
	};
} forEach keyfilter_up;

_triggered
