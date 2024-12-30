# Rust.bat-AUTO
Привет всем! Данный .bat файл содержит в себе все что требуется для установки сервера Rust (псс установку Oxide добавил).
1. Параметр обнолвения (обновляет сервер до ново версий без вреда файлам)
2. Чистая установка сервера (Все файлы взяты с официального сайта Facepunch)
3. Установка официального Oxide (перед установкой сервер должен быть выключен : после установки установщик сам предложит запустить сервер для завершения установки Oxide)
4. Восстановление файлов сервера под чистую (Удаляет все файлы сервера затем ставит новые чистые)
5. При первом созданий сервера вместе с ним будет создан Rust_Run.bat настроенный мной (а кнопка отвечает за восстановление данного файла в исходное состояние)
6. Скачивает Официальный файл запуска без изминений Rust_DS.bat



Hello everybody!
This.The bat file contains everything that is required to install the Rust server (pss added the installation of Oxide).
1. Update option (updates the server to new versions without harming files)
2. Clean installation of the server (All files are taken from the official Facepunch website)
3. Install the official Oxide (the server must be turned off before installation: after installation, the installer will prompt you to start the server to complete the installation of Oxide)
4. Restore server files to a clean one (Deletes all server files then install new clean ones)
5. When the server is created for the first time, Just_Run will be created with it.bat configured by me (and the button is responsible for restoring this file to its original state)
6. Downloads the Official launch file without changes Rust_DS.bat


Code:
chcp 65001
echo off
color 000A
title Install Rust Server by Leshev
mode con:cols=55 lines=11
md steamCMD
md rustds
:start
cls
echo ====================================================
echo ==== Добро пожаловать в установщик сервера RUST ====
echo ====================================================
echo = Обновить сервер                     "upd"
echo = Установить сервер                   "inst"
echo = Установка Oxide                     "oxide"
echo = Запуск востановлеение файлов        "rest"
echo = Восстановить Rust_Run.bat by Leshev "rebat"
echo = Скачать Официальный Rust_DS.bat     "dobat"
echo = Для выхода нажми                    "Enter"
set /p result=
if %result% EQU upd (goto update) else if %result% EQU inst (goto install) else if %result% EQU oxide (goto oxide) else if %result% EQU rest (goto rest) else if %result% EQU rebat (goto resbat) else if %result% EQU dobat (goto dobat) else (exit)


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
echo ==== Запущено обновление ==== 	 
cd steamCMD
steamcmd.exe +force_install_dir "..\rustds" +login anonymous +app_update 258550 +quit
cd ../
del /q update_script.txt 
cls
echo ==== Обновление завершено ====
timeout /t 1 >nul
set /p startserver=Запустить сервер? "y"-да, "n"-нет :
if %startserver% EQU y (goto startserver) else (exit)
:startserver
echo ==== Запускаю сервер... ====
timeout /t 2 >nul
cd 
Rust_Run.bat
cd ../

exit

:install
echo ==== Скачиваю SteamCMD ====

powershell -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamCMD\package.zip"
powershell -command "Expand-Archive -Force '%~dp0steamCMD\package.zip' '%~dp0steamCMD\'"
del steamCMD\package.zip
echo ==== Скачивание прошло успешно ====
timeout /t 1 >nul
echo ==== Запускаю установщик ====
timeout /t 1 /nobreak >nul
cd steamCMD
steamcmd.exe +force_install_dir "..\rustds" +login anonymous +app_update 258550 +quit
cd ../
cls
echo ==== Установка прошла успешно ====
timeout /t 1 >nul
cls
echo ==== Запуск проверки файлов ====
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
echo ==== Проверка прошла успешно ====
:resbat

md rustserver
timeout /t 1 /nobreak >nul

>rustserver\Rust_Run.bat (
	echo chcp 65001
	echo echo off
	echo cls
	echo echo I======================================================I
	echo echo I////////////////////////←☺→\\\\\\\\\\\\\\\\\\\\\\\\\\\I
	echo echo I  -== Вас приветствует сервер RUST==- -=by LeShEv=-   I
	echo echo I\\\\\\\\\\\\\\\\\\\\\\\\←☻→///////////////////////////I
	echo echo I======================================================I
	echo ::Знак "::" обозначает коментарий, что означает что строки где в начале "::" сервер видеть не будет.
	echo ::Для добавления дополнительных параметров в конце каждой строки указывате " ^".
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
echo ==== Rust_Run.bat восстановлен ====
exit

:oxide
echo ==== Скачиваю Oxide ====
powershell -Command "Invoke-WebRequest https://umod.org/games/rust/download?tag=public -OutFile rustds\Oxide.Rust.zip"
echo ==== Скачивание прошло успешно 
timeout /t 1 >nul
cls
echo ==== Запускаю установщик ====
powershell -command "Expand-Archive -Force '%~dp0rustds\Oxide.Rust.zip' '%~dp0rustds\'"
timeout /t 1 >nul
echo ==== Удаляю ненужные файлы ====
del rustds\Oxide.Rust.zip
timeout /t 1 >nul
cls
echo ==== Установка Oxide прошла успешно ====
timeout /t 2 >nul
exit

:rest
echo ==== Запуск проверки файлов ====
set /p warning=Все файлы сервера будут удаленны. Согласны? "y"-да  "n"-нет :
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
echo ==== Проверка прошла успешно ====
timeout /t 1 >nul
exit

:dobat
cls
md arhive
powershell -Command "Invoke-WebRequest https://files.facepunch.com/garry/1b1011b1/Rust_Server.zip -OutFile arhive\Rust_Server.zip"
powershell -command "Expand-Archive -Force '%~dp0arhive\Rust_Server.zip' '%~dp0arhive\'"
move /Y "%~dp0arhive\Server\Run_DS.bat" "%~dp0"
rmdir arhive /q /s
echo = Удаляю ненужные файлы 
rmdir arhive /q /s
del Rust_Server.zip
cls
echo ==== Успех ====
timeout /t 2 >nul
exit
