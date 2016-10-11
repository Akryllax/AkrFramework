enableSaving[false,false];

waitUntil { time > 0; };

_h = [param1,param2] execVM "core\initializator.sqf";

waitUntil {scriptDone _h};

//DELETE this
player setPos (getMarkerPos "marker_0")