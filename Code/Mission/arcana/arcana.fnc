#include "definitions.inc"
/*
 * File: arcana.fnc
 * Description: Arcane Warfare main file.
 */

_mode = param [0,"",[""]];
_ret = [];

_init = 
{
	arcaneLevel = 1;
	arcanePSI = 100;
	arcaneMaximPSI = 500;

	arcaneLastPSI = 0;
	arcaneUpdateDelta = 0.1;

	arcaneRecovPSI = 3;
	arcaneRecovPSI_EXP = 4;
	arcaneRecovPSI_PHA = 0;
	arcaneDelayPSI = 5;


	arcaneTOX = 0;
	arcaneMaximTOX = 120;

	arcaneRecovTOX = 1;
	arcaneRecovTOX_EXP = 5;
	arcaneRecovTOX_PHA = -1;
	arcaneDelayTOX = 10;

	arcaneLastPSI = time + 5;
	arcanePSI = 100;
	arcaneTOX = 80;

	[] spawn 
	{
		[functionArray] call compiler;
		arcaneLoop = true;
		while {arcaneLoop} do {
			if(arcanePSI < arcaneMaximPSI) then {
				if(arcaneLastPSI + arcaneDelayPSI < time) then {
					_factor = ((time - arcaneLastPSI + arcaneDelayPSI) * (1/arcaneRecovPSI_EXP)) * (arcanePSI/arcaneMaximPSI) + arcaneRecovPSI_PHA;
					arcanePSI = arcanePSI + arcaneRecovPSI * arcaneUpdateDelta * exp(_factor);

					if(arcanePSI > arcaneMaximPSI) then {
						arcanePSI = arcaneMaximPSI;
					};
				};
				(uiNamespace getVariable ['arcaneHUD_progress_psi', controlNull]) progressSetPosition (arcanePSI/arcaneMaximPSI);
				(uiNamespace getVariable ['arcaneHUD_text_psi', controlNull]) ctrlSetText (format["%1",floor arcanePSI]);
			};

			if(arcaneTOX > 0) then {
				if(arcaneLastPSI + arcaneDelayTOX < time) then {
					_factor = ((time - arcaneLastPSI + arcaneDelayTOX) * (1/arcaneRecovTOX_EXP)) * (arcaneTOX/arcaneMaximTOX) + arcaneRecovTOX_PHA;
					arcaneTOX = arcaneTOX - arcaneRecovTOX * arcaneUpdateDelta * exp(_factor);

					if(arcaneTOX <= 0) then {
						arcanePSI = 0;
					};
				};
				(uiNamespace getVariable ['arcaneHUD_progress_tox', controlNull]) progressSetPosition (arcaneTOX/arcaneMaximTOX);
				(uiNamespace getVariable ['arcaneHUD_text_tox', controlNull]) ctrlSetText (format["%1",floor (1+(arcaneTOX/arcaneMaximTOX)*100)] + " %");
			};

			sleep arcaneUpdateDelta;
		};
	};
};

switch (_mode) do {
    case "init": 
    {
        _ret = _this call _init;
	};
	default 
	{
		
	};
};