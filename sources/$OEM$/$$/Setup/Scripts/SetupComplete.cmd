@echo off
setlocal EnableExtensions

:: ═══════════════════════════════════════════════════════════════════
::  SetupComplete.cmd  -  Versione Universale Open Source
:: ───────────────────────────────────────────────────────────────────
::  Eseguito da Windows Setup in contesto SYSTEM al termine del setup.
:: ═══════════════════════════════════════════════════════════════════

set "LOGDIR=%ProgramData%\AutoInstall"
set "LOGFILE=%LOGDIR%\SetupComplete.log"
set "POSTBAT="

if not exist "%LOGDIR%" md "%LOGDIR%" >nul 2>&1

echo [%time%] ========================================================== >> "%LOGFILE%"
echo [%time%] AUTOMAZIONE DEPLOYMENT - SetupComplete avviato >> "%LOGFILE%"

echo [%time%] Ricerca drive USB per POST-DESKTOP.cmd... >> "%LOGFILE%"
for %%D in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist "%%D:\TOOLS\Script\POST-DESKTOP.cmd" (
        set "POSTBAT=%%D:\TOOLS\Script\POST-DESKTOP.cmd"
        goto :found
    )
)

echo [%time%] ERRORE: POST-DESKTOP.cmd non trovato su alcun drive! >> "%LOGFILE%"
goto :end

:found
echo [%time%] Trovato in: %POSTBAT% >> "%LOGFILE%"
echo [%time%] Registrazione RunOnce nel Registro di sistema... >> "%LOGFILE%"

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" ^
    /v "Custom_PostDesktop" ^
    /t REG_SZ ^
    /d "\"%POSTBAT%\" AUTO" ^
    /f >> "%LOGFILE%" 2>&1

echo [%time%] Registrazione RunOnce completata con successo. >> "%LOGFILE%"

:end
exit /b 0