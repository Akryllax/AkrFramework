_funcArray = param[0,[],[[]]];
_count = 0;
_time = time;
{
    // Current result is saved in variable _x
     missionnamespace setVariable [_x select 0, compileFinal(preprocessFileLineNumbers (_x select 1))];
     if(_x param [2,false,[false]]) then {
         _params = _x param[3,[],[[]]];
         ["init", _params] call (missionnamespace getVariable[_x select 0,{}]);
     };
    _count = _count + 1;
} forEach _funcArray;

[format ["Loaded %1 functions in %2 seconds", _count, (time - _time)]] call logthis;