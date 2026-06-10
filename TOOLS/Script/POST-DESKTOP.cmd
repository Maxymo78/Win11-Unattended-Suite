@echo off
setlocal EnableExtensions

:: ═══════════════════════════════════════════════════════════════════
::  POST-DESKTOP.cmd - Versione Universale Open Source
:: ───────────────────────────────────────────────────────────────────
::  Eseguito al primo login dell'utente Administrator via RunOnce.
:: ═══════════════════════════════════════════════════════════════════

set "LOGDIR=%ProgramData%\AutoInstall"
set "LOGFILE=%LOGDIR%\PostDesktop.log"
set "DONEFILE=%LOGDIR%\PostDesktop.done"

if not exist "%LOGDIR%" md "%LOGDIR%" >nul 2>&1

:: Guard - evita esecuzioni multiple accidentali
if exist "%DONEFILE%" exit /b 0
echo %date% %time% > "%DONEFILE%"

echo [%time%] ========================================================== >> "%LOGFILE%"
echo [%time%] AUTOMAZIONE DEPLOYMENT - POST-DESKTOP avviato >> "%LOGFILE%"

:: Identifica la radice dei TOOLS risalendo di una cartella
for %%I in ("%~dp0..") do set "TOOLSROOT=%%~fI"
set "APPS_BAT=%TOOLSROOT%\Script\INSTALLA TUTTO-TOOLS.bat"

echo [%time%] Avvio dello script principale di installazione programmi... >> "%LOGFILE%"
if not exist "%APPS_BAT%" (
    echo [%time%] ERRORE: INSTALLA TUTTO-TOOLS.bat non trovato! >> "%LOGFILE%"
) else (
    call "%APPS_BAT%" AUTO
    echo [%time%] Installazione programmi completata. Ritorno: %errorlevel% >> "%LOGFILE%"
)

echo [%time%] POST-DESKTOP COMPLETATO CON SUCCESSO >> "%LOGFILE%"
echo [%time%] Apertura maschera cambio nome computer... >> "%LOGFILE%"

start "" "%SystemRoot%\System32\SystemPropertiesComputerName.exe"
exit /b 0