@echo off
set currentver=1.0.0
TITLE EVA %currentver%

if /i "%~1"=="Install" if /i "%~2"=="EpicGames" goto INSTALL_EPICGAMES
if /i "%~1"=="Install" if /i "%~2"=="Keys2xinput" goto INSTALL_KEYS2XINPUT
if /i "%~1"=="Install" if /i "%~2"=="Discord" goto INSTALL_DISCORD
if /i "%~1"=="Install" if /i "%~2"=="Steam" goto INSTALL_STEAM
if /i "%~1"=="Install" if /i "%~2"=="Spotify" goto INSTALL_SPOTIFY
if /i "%~1"=="Install" if /i "%~2"=="OBS" goto INSTALL_OBS
if /i "%~1"=="Install" if /i "%~2"=="Notepad++" goto INSTALL_NOTEPAD++
if /i "%~1"=="Install" if /i "%~2"=="Lightshot" goto INSTALL_LIGHTSHOT
if /i "%~1"=="Install" if /i "%~2"=="VLC" goto INSTALL_VLC
if /i "%~1"=="Install" if /i "%~2"=="LunarClient" goto INSTALL_LUNARCLIENT
if /i "%~1"=="Install" if /i "%~2"=="RiotGames" goto INSTALL_RIOTGAMES
if /i "%~1"=="Install" if /i "%~2"=="Uplay" goto INSTALL_UPLAY
if /i "%~1"=="Install" if /i "%~2"=="VSCode" goto INSTALL_VSCODE
if /i "%~1"=="Install" if /i "%~2"=="Teams" goto INSTALL_TEAMS
if /i "%~1"=="Install" if /i "%~2"=="CapFrameX" goto INSTALL_CAPFRAMEX
if /i "%~1"=="Install" if /i "%~2"=="ThrottleStop" goto INSTALL_THROTTLESTOP
if /i "%~1"=="Install" if /i "%~2"=="OnboardMemoryManager" goto INSTALL_ONBOARDMEMORYMANAGER
if /i "%~1"=="Install" if /i "%~2"=="Legendary" goto INSTALL_LEGENDARY
if /i "%~1"=="Install" if /i "%~2"=="MSIAfterburner" goto INSTALL_MSIAFTERBURNER
if /i "%~1"=="Debloat" if /i "%~2"=="Discord" goto DEBLOAT_DISCORD
if /i "%~1"=="StringSearch" goto MISC_STRING_SEARCH
if /i "%~1"=="Xperf" goto MISC_XPERF
if /i "%~1"=="AutoGpuAffinity" goto MISC_AUTOGPUAFFINITY
if /i "%~1"=="Version" goto VERSION
if /i "%~1"=="Install" goto SYNTAX_INSTALL
if /i "%~1"=="Debloat" goto SYNTAX_DEBLOAT
if /i "%~1"=="Misc" goto SYNTAX_MISC

echo.
echo Syntax:
echo.
echo EVA Version . . . . . . . . returns the current version of EVA
echo EVA Install . . . . . . . . returns a list of installable programs
echo EVA Debloat . . . . . . . . returns a list of debloatable programs
echo EVA Misc  . . . . . . . . . returns a list of miscellaneous functions specific to EVA
exit /b

:: SYNTAX

:VERSION
echo.
echo Current version: %currentver%
exit /b

:SYNTAX_INSTALL
echo.
echo List of installable programs:
echo.
echo EpicGames
echo Keys2xinput
echo Discord
echo Steam
echo Spotify
echo OBS
echo Notepad++
echo Lightshot
echo VLC
echo LunarClient
echo RiotGames
echo Uplay
echo VSCode
echo Teams
echo CapFrameX
echo ThrottleStop
echo OnboardMemoryManager
echo Legendary
echo.
echo EVA install [PROGRAM]
exit /b

:SYNTAX_DEBLOAT
echo.
echo List of debloatable programs:
echo.
echo Discord
echo.
echo EVA debloat [PROGRAM]
exit /b

:SYNTAX_MISC
echo.
echo List of miscellaneous functions specific to EVA
echo.
echo EVA StringSearch [FILE] [STRING] - Searches for Unicode and Ascii strings in a file
echo.
echo EVA Xperf [TIME IN SECONDS] - Captures dpc/isr info over a period of time specified in seconds
echo.
echo EVA AutoGpuAffinity - Automatically benchmark the most performant core based on X% lows/percentile fps in lava-lamp.
exit /b

:: INSTALL

:INSTALL_EPICGAMES
echo.
echo Installing EpicGames
echo.
curl -L "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi" -o "%temp%\EpicGames.msi" --progress-bar
"%temp%\EpicGames.msi" /qn /norestart ALLUSERS=2 /L* "%temp%\Epic Games Launcher 1.1.195.0.log"
del /f /q "%temp%\EpicGames.msi" > NUL 2>&1
Reg.exe delete "HKLM\System\ControlSet001\Services\EpicOnlineServices" /f > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_KEYS2XINPUT
echo.
echo Installing Keys2xinput
echo.
curl -L -H "Referer: https://www.embenco.nl/keys2xinput" https://www.embenco.nl/Keys2XInputSetup_x64.exe -o "%temp%\Keys2xinput.exe" --progress-bar
"%temp%\Keys2xinput.exe" /quiet /norestart
del /f /q "%temp%\Keys2xinput.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_DISCORD
echo.
echo Installing Discord
echo.
curl -L "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86" -o "%temp%\Discord.exe" --progress-bar
"%temp%\Discord.exe" -s
del /f /q "%temp%\Discord.exe" > NUL 2>&1
echo.
echo Operation complete.
echo suggested command: EVA debloat discord
exit /b

:INSTALL_STEAM
echo.
echo Installing Steam
echo.
curl -L "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -o "%temp%\Steam.exe" --progress-bar
"%temp%\Steam.exe" /S
del /f /q "%temp%\Steam.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_SPOTIFY
echo.
echo Installing Spotify
echo.
curl -L "http://download.spotify.com/SpotifyFullSetup.exe" -o "%temp%\Spotify.exe" --progress-bar
"%temp%\Spotify.exe" /silent
del /f /q "%temp%\Spotify.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_OBS
echo.
echo Installing OBS
echo.
curl -L "https://github.com/obsproject/obs-studio/releases/download/27.1.1/OBS-Studio-27.1.1-Full-Installer-x64.exe" -o "%temp%\OBS.exe" --progress-bar
"%temp%\OBS.exe" /S
del /f /q "%temp%\OBS.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_NOTEPAD++
echo.
echo installing Notepad++
echo.
curl -L "https://notepad-plus-plus.org/repository/7.x/7.0/npp.7.Installer.exe" -o "%temp%\Notepad.exe" --progress-bar
"%temp%\Notepad.exe" /S
del /f /q "%temp%\Notepad.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_LIGHTSHOT
echo.
echo Installing Lightshot
echo.
curl -L "https://app.prntscr.com/build/setup-lightshot.exe" -o "%temp%\Lightshot.exe" --progress-bar
"%temp%\Lightshot.exe" /VERYSILENT /NORESTART
del /f /q "%temp%\Lightshot.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_VLC
echo.
echo Installing VLC
echo.
curl -L "https://www.mirrorservice.org/sites/videolan.org/vlc/3.0.16/win64/vlc-3.0.16-win64.exe" -o "%temp%\VLC.exe" --progress-bar
"%temp%\VLC.exe" /S
del /f /q "%temp%\VLC.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_LUNARCLIENT
echo.
echo Installing LunarClient
echo.
curl -L "https://launcherupdates.lunarclientcdn.com/Lunar%%20Client%%20v2.7.3.exe" -o "%temp%\LC.exe" --progress-bar
"%temp%\LC.exe" /S
del /f /q "%temp%\LC.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_RIOTGAMES
echo.
echo Installing RiotGames
echo.
curl -L "https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe" -o "%temp%\riotgames.exe" --progress-bar
"%temp%\riotgames.exe" /S
del /f /q "%temp%\riotgames.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b 

:INSTALL_UPLAY
echo.
echo Installing Uplay
echo.
curl -L "https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe" -o "%temp%\uplay.exe" --progress-bar
"%temp%\uplay.exe" /S
del /f /q "%temp%\uplay.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_VSCODE
echo.
echo Installing VSCode
echo.
curl -L "https://az764295.vo.msecnd.net/stable/3a6960b964327f0e3882ce18fcebd07ed191b316/VSCodeUserSetup-x64-1.62.2.exe" -o "%temp%\VSCode.exe" --progress-bar
"%temp%\VSCode.exe" /VERYSILENT /NORESTART /MERGETASKS=!runcode
del /f /q "%temp%\VSCode.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b 

:INSTALL_TEAMS
echo.
echo Installing Teams
echo.
curl -L "https://statics.teams.cdn.office.net/production-windows-x64/1.4.00.29469/Teams_windows_x64.exe" -o "%temp%\teams.exe" --progress-bar
"%temp%\teams.exe" /S
del /f /q "%temp%\teams.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b 

:INSTALL_CAPFRAMEX
echo.
echo Installing CapFrameX
echo.
curl -L "https://cxblobs.blob.core.windows.net/releases/CapFrameX_v1.6.6_Setup.zip" -o "%temp%\capframex.zip" --progress-bar
7z.exe x -y -o"%temp%" "%temp%\capframex.zip" > NUL 2>&1
"%temp%\CapFrameXBootstrapper.exe" /install /quiet /norestart
del /f /q "%temp%\capframex.zip" > NUL 2>&1
del /f /q "%temp%\CapFrameXBootstrapper.exe" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_THROTTLESTOP
echo.
echo Downloading ThrottleStop to the desktop
echo.
curl -L "https://files02.tchspt.com/temp/ThrottleStop_9.4.zip" -o "%temp%\ThrottleStop.zip" --progress-bar
7z.exe x -y -o"%userprofile%\Desktop" "%temp%\ThrottleStop.zip" "ThrottleStop.exe" > NUL 2>&1
del /f /q "%temp%\ThrottleStop.zip" > NUL 2>&1
echo.
echo Operation complete.
exit /b

:INSTALL_ONBOARDMEMORYMANAGER
echo.
echo Downloading OnboardMemoryManager to the desktop
echo.
curl -L "https://download01.logi.com/web/ftp/pub/techsupport/gaming/OnboardMemoryManager.exe" -o "%userprofile%\Desktop\OnboardMemoryManager.exe" --progress-bar
echo.
echo Operation complete.
exit /b

:INSTALL_LEGENDARY
echo.
echo Downloading legendary and adding it to PATH
echo.
curl -L "https://github.com/derrod/legendary/releases/download/0.20.18/legendary.exe" -o "%windir%\EVA\legendary.exe" --progress-bar
echo Reboot required to complete installation.
echo Operation complete.
exit /b

:INSTALL_MSIAFTERBURNER
@echo off
echo.
echo Installing MSIAfterburner
echo.
curl -L "https://files03.tchspt.com/temp/MSIAfterburnerSetup463.exe" -o "%temp%\MSIAfterburner.exe" --progress-bar
"%temp%\MSIAfterburner.exe" /S
echo.
echo Operation complete.
exit /b

:: DEBLOAT

:DEBLOAT_DISCORD
set discordver=1.0.9003
echo.
if not exist "%userprofile%\AppData\Local\Discord" (
	echo Discord is not installed!
	exit /b
)

for %%a in ("%userprofile%\AppData\Local\Discord\app-*") do (
	if not exist "%userprofile%\AppData\Local\Discord\app-%%a\modules" (
		echo ERROR: can not find discord install path.
		exit /b
	)
)
taskkill /F /IM Discord.exe > NUL 2>&1
echo Debloating Discord...

del /f /q "%userprofile%\AppData\Local\Discord\Update.exe" > NUL 2>&1
del /f /q "%userprofile%\AppData\Local\Discord\SquirrelSetup.log" > NUL 2>&1
del /f /q "%userprofile%\AppData\Local\Discord\Discord_updater_rCURRENT.log" > NUL 2>&1
rd /s /q "%userprofile%\AppData\Local\Discord\packages" > NUL 2>&1
rd /s /q "%userprofile%\AppData\Local\Discord\download" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_cloudsync-1" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_erlpack-1" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_game_utils-1" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_krisp-1" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_overlay2-1" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_rpc-1" > NUL 2>&1
RD /s /q "%userprofile%\AppData\Local\Discord\app-%discordver%\modules\discord_spellcheck-2" > NUL 2>&1
del /f /q "%userprofile%\Desktop\Discord.lnk" > NUL 2>&1

set TARGET='%userprofile%\AppData\Local\Discord\app-%discordver%\Discord.exe'
set SHORTCUT='%userprofile%\Desktop\Discord.exe.lnk'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.Save()"
echo.
echo Operation complete.
exit /b

:: MISC

:MISC_STRING_SEARCH
echo.
if "%~2"=="" goto LIST_MISC
if "%~3"=="" goto LIST_MISC
strings %~2 | findstr /i %~3
echo.
echo Operation complete. 
exit /b

:MISC_XPERF
echo.
if "%~2"=="" goto LIST_MISC
cd "C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit"
echo Starting in 5 seconds.
timeout 5
echo Recording...
xperf -on base+interrupt+dpc
timeout %~2
xperf -stop
xperf -i "C:\kernel.etl" -o "C:\report.txt" -a dpcisr
timeout 2 > NUL 2>&1
notepad C:\report.txt
echo.
echo Operation complete. 
exit /b

:MISC_AUTOGPUAFFINITY
echo.
curl -L "https://github.com/amitxvv/AutoGpuAffinity/releases/download/v1.0.0/AutoGpuAffinity.exe" -o "%temp%\AutoGpuAffinity.exe --progress-bar
echo Downloading AutoGpuAffinity to the desktop
echo.
echo Operation complete.
exit /b