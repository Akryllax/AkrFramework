/*
 * File: wallet.sqf
 * Description: Money managing system.
 */

_mode = param [0,"",[""]];
_ret = [];

switch (_mode) do {
    case "init": 
    {
        if(isNil "wallet_initialized") then {
            userdata_bank = profileNamespace getVariable ["userdata_bank", []];
            userdata_wallet = profileNamespace getVariable ["userdata_wallet", ["",0]];

            wallet_initialized = "INIT_DONE";
            _ret = wallet_initialized;
        };
    };
    case "get": 
    {
        _ammount = param [1,-1,[-1]];
        _accountName = param [2,"",[""]];

        if(_accountName != "") then {
            {
                // Current result is saved in variable _x
                if((_x select 0) isEqualTo _accountName) then {
                    _ret = _x;
                };

            } forEach userdata_bank;
        } else {
            _ret = userdata_wallet;
        };
    };
    case "set":
    {
        _ammount = param [1,-1,[-1]];
        _accountName = param [2,"",[""]];

        if(_ammount < 0) exitWith { };

        if(_accountName != "") then {
            _exists = false;

            {
                // Current result is saved in variable _x
                if((_x select 0) isEqualTo _accountName) then {
                    _x set[1, _ammount];

                    userdata_bank set[_forEachIndex, _x];
                    _exists = true;
                };
            } forEach userdata_bank;
            if(!_exists) exitWith {[]};

        } else {
            userdata_wallet set[1,_ammount];
        };
    };
    case "create":
    {
        _ammount = param [1,0,[-1]];
        _accountName = param [2,"",[""]];

        if(_ammount < 0) exitWith { };

        if(_accountName != "") then {
            _exists = false;
            {
                if((_x select 0) isEqualTo _accountName) then {
                    _exists = true;
                };
            } forEach userdata_bank;
            if(!_exists) then {
                userdata_bank pushBack [_accountName, _ammount];
                _ret = [_accountName, _ammount];
            };
        };
    };
    case "delete":
    {
        _ammount = param [1,0,[-1]];
        _accountName = param [2,"",[""]];

        if(_ammount < 0) exitWith { };

        if(_accountName != "") then {
            _exists = false;
            {
                if((_x select 0) isEqualTo _accountName) then {
                    userdata_bank deleteAt _forEachIndex;
                    _exists = true;
                };
            } forEach userdata_bank;
            _ret = _exists;
        };
    };
    case "transfer":
    {
        
    };
    default //UNKNOWN COMMAND
    {
        if(true) exitWith {};
    };
};

_ret