chcp 65001
echo off
color 000A
title Install Rust Server by Leshev ENG
mode con:cols=55 lines=11
md steamCMD
md rustds
:start
cls
echo ====================================================
echo ==== Welcome to the server installer RUST ====
echo ====================================================
echo = Update server                         "upd"
echo = Install server                        "inst"
echo = Install Oxide                         "oxide"
echo = Starting file recovery                "recf"
echo = Recovery Rust_Run.bat by Leshev       "rebat"
echo = Download the Official Rust_DS.bat     "dobat"
echo = Exit                                  "Enter"
set /p result=
if %result% EQU upd (goto update) else if %result% EQU inst (goto install) else if %result% EQU oxide (goto oxide) else if %result% EQU recf (goto rest) else if %result% EQU rebat (goto resbat) else if %result% EQU dobat (goto dobat) else (exit)


:update
>update_script.txt (
	echo @ShutdownOnFailedCommand 1 
	echo @NoPromptForPassword 1 
	echo login anonymous 
	echo force_install_dir ../rustds 
	echo app_update 258550 validate 
	echo quit 
)
cls
echo ==== Starting update ==== 	 
cd steamCMD
steamcmd.exe +force_install_dir "..\rustds" +login anonymous +app_update 258550 +quit
cd ../
del /q update_script.txt 
cls
echo ==== Update complite ====
timeout /t 1 >nul
set /p startserver=Start Server? "y"-yes, "n"-no :
if %startserver% EQU y (goto startserver) else (exit)
:startserver
echo ==== Start... ====
timeout /t 2 >nul
cd 
Rust_Run.bat
cd ../

exit

:install
echo ==== Download SteamCMD ====

powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamCMD\package.zip"
powershell -command "Expand-Archive -Force '%~dp0steamCMD\package.zip' '%~dp0steamCMD\'"
del steamCMD\package.zip
echo ==== Download complite ====
timeout /t 1 >nul
echo ==== Starting install ====
timeout /t 1 /nobreak >nul
cd steamCMD
steamcmd.exe +force_install_dir "..\rustds" +login anonymous +app_update 258550 +quit
cd ../
cls
echo ==== Install complite ====
timeout /t 1 >nul
cls
echo ==== Starting file recovery ====
>update_script.txt (
	echo @ShutdownOnFailedCommand 1 
	echo @NoPromptForPassword 1 
	echo login anonymous 
	echo force_install_dir ../rustds 
	echo app_update 258550 validate 
	echo quit 
)
cls
timeout /t 1 /nobreak >nul
cd steamCMD
steamcmd.exe +runscript ../update_script.txt
steamcmd.exe +runscript ../update_script.txt
cd ../
del /q update_script.txt 
cls
echo ==== Recovery complite ====
:resbat

md rustserver
timeout /t 1 /nobreak >nul

>rustserver\Rust_Run.bat (
	echo chcp 65001
	echo echo off
	echo cls
	echo echo I======================================================I
	echo echo I////////////////////////←☺→\\\\\\\\\\\\\\\\\\\\\\\\\\\I
	echo echo I  -== The server welcomes you RUST==- -=by LeShEv=-   I
	echo echo I\\\\\\\\\\\\\\\\\\\\\\\\←☻→///////////////////////////I
	echo echo I======================================================I
	echo timeout /t 5 >nul
	echo :start
	echo cd rustds
	echo RustDedicated.exe -batchmode nographics ^^
	echo +system.cpu_affinity 1,2,3 ^^
	echo +server.gamemode Vanilla ^^
	echo ::+server.anticheattoken 0 ^^
	echo ::+server.ip ^^
	echo ::+server.secure 0 ^^
	echo ::+server.encryption 0 ^^
	echo +server.hostname "SRUBY " ^^
	echo +server.maxplayers 100 ^^
	echo +server.port 28082 ^^
	echo ::+app.port ^^
	echo ::+server.queryport ^^
	echo ::+rcon.port ^^
	echo +rcon.password "123456" ^^
	echo +rcon.web 1 ^^
	echo +server.identity "new_map" ^^
	echo +server.seed 1337 ^^
	echo +server.level "Procedural Map" ^^
	echo +server.worldsize 3250 ^^
	echo +fps.limit 60 ^^
	echo +server.tags monthly,vanilla ^^
	echo +server.description "Server Rust" ^^
	echo +server.saveinterval 900 ^^
	echo ::+server.url "" ^^
	echo ::+server.headerimage "" ^^
	echo +hackablelockedcrate.requiredhackseconds "120" ^^
	echo ::+server.logoimage "" ^^
	echo cd ../
	echo goto start
)
move /Y "%~dp0rustserver\Rust_run.bat" "%~dp0"
rmdir rustserver /q
echo ==== Rust_Run.bat recovery complite ====
exit

:oxide
echo ==== Download Oxide ====
powershell -Command "Invoke-WebRequest https://umod.org/games/rust/download?tag=public -OutFile rustds\Oxide.Rust.zip"
echo ==== Download complite 
timeout /t 1 >nul
cls
echo ==== Starting install Oxide ====
powershell -command "Expand-Archive -Force '%~dp0rustds\Oxide.Rust.zip' '%~dp0rustds\'"
timeout /t 1 >nul
echo ==== Deleting unnecessary files ====
del rustds\Oxide.Rust.zip
timeout /t 1 >nul
cls
echo ==== The installation of Oxide was successful ====
timeout /t 2 >nul
exit

:carbon
echo ==== Download Carbon ====
powershell -Command "Invoke-WebRequest https://github.com/CarbonCommunity/Carbon.Core/releases/download/production_build/Carbon.Windows.Release.zip -OutFile rustds\Carbon.Windows.Release.zip"
echo ==== Conplite ==== 
timeout /t 1 >nul
cls
echo ====Install Carbon====
powershell -command "Expand-Archive -Force '%~dp0rustds\Carbon.Windows.Release.zip' '%~dp0rustds\'"
timeout /t 1 >nul
echo ==== Deleting unnecessary files ====
del rustds\Carbon.Windows.Release.zip
timeout /t 1 >nul
cls
echo ==== The installation of Carbon was successful ====
timeout /t 2 >nul
exit

:rest
echo ==== Starting file verification ====
set /p warning=All server files will be deleted. Do you agree? "y"-yes, "n"-no :
if %warning% EQU y (goto startdel) else (goto start)
:startdel
del rustds /q
del steamCMD /q
timeout /t 1 /nobreak >nul
cls
md rustds
md steamCMD

timeout /t 1 /nobreak >nul
powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamCMD\package.zip"
powershell -command "Expand-Archive -Force '%~dp0steamCMD\package.zip' '%~dp0steamCMD\'"
del steamCMD\package.zip
cls
cd steamCMD
steamcmd.exe +force_install_dir "..\rustds" +login anonymous +app_update 258550 +quit
cd ../
cls
cd steamCMD
steamcmd.exe +runscript ../update_script.txt
steamcmd.exe +runscript ../update_script.txt
cd ../
cls
echo ==== The check was successful ====
timeout /t 1 >nul
exit

:dobat
cls
md arhive
powershell -Command "Invoke-WebRequest https://files.facepunch.com/garry/1b1011b1/Rust_Server.zip -OutFile arhive\Rust_Server.zip"
powershell -command "Expand-Archive -Force '%~dp0arhive\Rust_Server.zip' '%~dp0arhive\'"
move /Y "%~dp0arhive\Server\Run_DS.bat" "%~dp0"
rmdir arhive /q /s
echo = Deleting unnecessary files 
rmdir arhive /q /s
del Rust_Server.zip
cls
echo ==== Complite ====
timeout /t 2 >nul
exit
