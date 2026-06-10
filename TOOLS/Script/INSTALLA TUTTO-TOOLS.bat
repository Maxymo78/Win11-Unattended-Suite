@echo off
setlocal EnableExtensions EnableDelayedExpansion
chcp 65001 >nul

:: ═══════════════════════════════════════════════════════════════════
::  INSTALLA TUTTO-TOOLS.bat  -  Versione Open Source Universale
:: ───────────────────────────────────────────────────────────────────
::  Script di installazione silenziosa per i software principali.
:: ═══════════════════════════════════════════════════════════════════

set "TOOLSROOT="
for %%I in ("%~dp0..") do if exist "%%~fI\Apps" set "TOOLSROOT=%%~fI"
if not defined TOOLSROOT (
    for %%d in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        if exist "%%d:\TOOLS\Apps" set "TOOLSROOT=%%d:\TOOLS"
    )
)

if not defined TOOLSROOT (
    echo [ERRORE] Cartella TOOLS\Apps non trovata!
    pause
    exit /b 1
)

set "LOGDIR=%ProgramData%\AutoInstall"
set "LOGFILE=%LOGDIR%\InstallaTuttoTools.log"
if not exist "%LOGDIR%" md "%LOGDIR%" >nul 2>&1

set /a TOTAL=5
set /a STEP=0

echo ================================================== >> "%LOGFILE%"
echo [%date% %time%] INSTALLA TUTTO TOOLS avviato >> "%LOGFILE%"
echo ================================================== >> "%LOGFILE%"

cls
echo ═══════════════════════════════════════════════════════════════════
echo  INSTALLAZIONE AUTOMATICA APPLICAZIONI BASE
echo ═══════════════════════════════════════════════════════════════════
echo.

:: 1. 7-ZIP
set /a STEP+=1
call :ProgressBar %STEP% %TOTAL% "Installazione 7-Zip..."
for %%F in ("%TOOLSROOT%\Apps\7z*.exe") do (
    echo [%date% %time%] Installazione 7-Zip: %%~nxF >> "%LOGFILE%"
    start /wait "" "%%F" /S
)

:: 2. ADOBE ACROBAT READER
set /a STEP+=1
call :ProgressBar %STEP% %TOTAL% "Installazione Adobe Reader..."
for %%F in ("%TOOLSROOT%\Apps\AcroRdr*.exe") do (
    echo [%date% %time%] Installazione Adobe Reader: %%~nxF >> "%LOGFILE%"
    start /wait "" "%%F" /sAll /rs /msi EULA_ACCEPT=YES
)

:: 3. GOOGLE CHROME
set /a STEP+=1
call :ProgressBar %STEP% %TOTAL% "Installazione Google Chrome..."
for %%F in ("%TOOLSROOT%\Apps\*Chrome*.msi") do (
    echo [%date% %time%] Installazione Google Chrome: %%~nxF >> "%LOGFILE%"
    start /wait "" msiexec /i "%%F" /qn /norestart
)

:: 4. MOZILLA FIREFOX
set /a STEP+=1
call :ProgressBar %STEP% %TOTAL% "Installazione Mozilla Firefox..."
for %%F in ("%TOOLSROOT%\Apps\*Firefox*.msi") do (
    echo [%date% %time%] Installazione Mozilla Firefox: %%~nxF >> "%LOGFILE%"
    start /wait "" msiexec /i "%%F" /qn /norestart
)

:: 5. ANYDESK
set /a STEP+=1
call :ProgressBar %STEP% %TOTAL% "Installazione AnyDesk..."
for %%F in ("%TOOLSROOT%\Apps\AnyDesk*.exe") do (
    echo [%date% %time%] Installazione AnyDesk: %%~nxF >> "%LOGFILE%"
    start /wait "" "%%F" --install "%ProgramFiles(x86)%\AnyDesk" --start-with-win --silent
)

cls
echo ═══════════════════════════════════════════════════════════════════
echo  INSTALLAZIONE COMPLETATA CON SUCCESSO!
echo ═══════════════════════════════════════════════════════════════════
echo Tutti i programmi base sono stati configurati.
echo I log operativi sono disponibili in: %LOGFILE%
echo.
timeout /t 5 >nul
exit /b 0

:: ═══════════════════════════════════════════════════════════════════
::  FUNZIONE LOGICA PROGRESS BAR
:: ═══════════════════════════════════════════════════════════════════
:ProgressBar
cls
set /a percent=(%~1 * 100) / %~2
set /a filled=%percent% / 5
set /a empty=20 - %filled%
set "bar="
for /l %%i in (1,1,%filled%) do set "bar=!bar!█"
for /l %%i in (1,1,%empty%) do set "bar=!bar!░"
echo ═══════════════════════════════════════════════════════════════════
echo  Avanzamento: [%bar%] %percent%%%
echo  Stato: %~3
echo ═══════════════════════════════════════════════════════════════════
echo.
exit /b 0