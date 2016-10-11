#define __GETNAME__(funcname) funcname =
#include "definitions.inc"

_count = 0;
_time = time;
{
    // Current result is saved in variable _x
     missionnamespace setVariable [_x select 0, compileFinal(preprocessFileLineNumbers (_x select 1))];
    _count = _count + 1;
} forEach functionArray;

[format ["Loaded %1 functions in %2 seconds", _count, (time - _time)]] call logthis;
