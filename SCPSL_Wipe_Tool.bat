@echo off

:: ---- Force open in a new CMD window ----
if "%~1" neq "launched" (
    start "" cmd /k "%~f0 launched"
    exit
)

title SCPSL Appdata folder Wipe tool
color 07
setlocal EnableDelayedExpansion

:: Detect current user automatically
set USERDIR=%USERPROFILE%
set SCP_PATH=%USERDIR%\AppData\Roaming\SCP Secret Laboratory

:: ----------------- MAIN MENU -----------------
:MENU
cls
color 07

echo --------------------------------------
echo SCPSL Appdata folder Wipe tool
echo --------------------------------------
echo By IcyIcyy
echo.
echo This simple tool made with batch will help you wipe
color 0A
echo SCP: Secret Laboratory
color 07
echo Folder
echo in order to fix any issues with Mistaken Clients when
echo connecting to their Custom Central Servers.
echo.

timeout /t 3 /nobreak >nul
echo Choose Wisely.. Someone died when they chose something wrong btw.
echo.

timeout /t 2 /nobreak >nul
echo [1] Wipe Folder
echo.
echo [2] Tell me more about it
echo.
echo [3] Exit
echo.

set /p choice=Select an option: 

if "%choice%"=="1" goto WIPE
if "%choice%"=="2" goto INFO
if "%choice%"=="3" goto EXIT

goto MENU

:: ----------------- WIPE OPTION -----------------
:WIPE
cls
echo Please, backup keybinding.txt before continuing.
echo You are about to wipe also that.
echo.
echo After you completed the wipe, you can put back the
echo keybinding.txt back in the folder when you start
echo the client once again.
echo.
echo Press anything to continue with the wipe.
pause >nul

if exist "%SCP_PATH%" (
    rmdir /s /q "%SCP_PATH%"
    echo.
    echo Folder Wiped Successfully, now you can open back Mistaken Client.
) else (
    echo.
    echo Folder not found. Nothing to wipe.
)

echo.
echo Press any button to exit.
pause >nul
exit

:: ----------------- INFO OPTION -----------------
:INFO
cls
echo This tool was made in order to fix any bugs with the
echo Mistaken Client.
echo.
echo Even if this client is modified and doesn't have
echo nothing to do with Northwood.
echo It's still based on their code and functions.
echo.
echo If you Play normal SCPSL and then return to play
echo Mistaken, you will have issues to connect to their
echo Central server.
echo.
echo Even worse, there could be potentially issues when
echo trying to play.
echo.
echo This tool was made purely for wiping the SCPSL Folder
echo in AppData.
echo.
echo Yes, it can be done manually but atleast this tool
echo does all the work by itself!
echo.
echo Press anything to return to the choose menu.
pause >nul
goto MENU

:: ----------------- EXIT -----------------
:EXIT
exit
