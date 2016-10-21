#include "core\definitions.inc"
enableSaving[false,false];
player enableFatigue false;

waitUntil { time > 0; };

compiler = compileFinal (preprocessFileLineNumbers "core\initializator.sqf");
_h = [functionArray] spawn compiler;

waitUntil {scriptDone _h};

//DELETE this
//player setPos (getMarkerPos "marker_0");
player setPos [14699.8,16693,0]; 