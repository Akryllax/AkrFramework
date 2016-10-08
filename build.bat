@echo off

echo Killing Arma 3...
:fuckIT
taskkill /f /im arma3.exe 2>NUL
echo Arma 3 killed.
echo Opening '@SCMB'...
cd @SCMB\Addons
for /D %%i in (*.*) do echo Processing addon %%i & FileBank.exe %%i

echo Opening '@SCMB_sys'...
cd ..\..\@SCMB_sys\Addons
for /D %%i in (*.*) do echo Processing addon %%i & FileBank.exe %%i

echo Launching Arma 3...
..\..\"Arma 3 Modded.lnk"