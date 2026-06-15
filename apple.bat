@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
if "%~1"=="" goto INDEX
if "%~1"=="-v" goto VERSION
if "%~1"=="-create" goto CREATE
if "%~1"=="-start" goto START
set "cmd=%~1"
:INDEX
echo Apple-CLI
echo A CLI Minecraft Server Management Tool.
echo Usage:
echo Commands:
echo -v Check the software version number.
echo -create ^<server-name^> ^<maximum-memory^> ^<minimum-memory^> ^(Create a server^)
echo -start ^<server-name^> ^<maximum-memory^> ^<minimum-memory^> ^(Start a Server^)
exit /b 0
:VERSION
echo Apple-CLI
echo Beta 0.0.1
exit /b 0
:CREATE
echo Apple-CLI
echo Note: Due to various unpredictable factors, you may encounter errors during use. If you see the ^"Error: Unable to access jarfile^" message,
echo you can safely ignore it—simply press Esc to continue.
echo Loading...
timeout /t 3 /nobreak > nul
if not exist "servers\" mkdir "servers"
if not exist "servers\%~2" mkdir "servers\%~2"
if not exist "servers\%~2\core.jar" (
echo Apple-CLI
echo Download the server JAR file into the .\servers\%~2 directory and name it core.jar.
echo It is recommended to download the Fabric Server JAR file from the official website: https://www.fabricmc.net/use/server.
echo Once you^'^ve downloaded the JAR file, simply re-run the Apple CLI command you just executed to continue.
) else (
cd ".\servers\%~2\"
java -Xmx%~3G -Xms%~4G -jar core.jar nogui
echo Loading...
timeout /t 3 /nobreak > nul
notepad.exe .\eula.txt
echo Since you^'^ve just agreed to the EULA and entered TRUE, let^'^s now run ^"apple -start %~2 %~3 %~4^" to start your server!
)
:START
echo Apple-CLI
echo Note: Due to various unpredictable factors, you may encounter errors during use. If you see the ^"Error: Unable to access jarfile^" message,
echo you can safely ignore it—simply press Esc to continue.
echo Note: If you use the stop command to shut down the server during startup,
echo you may need to press Esc to return to the command prompt.
echo Loading...
timeout /t 7 /nobreak > nul
cd ".\servers\%~2\"
java -Xmx%~3G -Xms%~4G -jar core.jar nogui
pause > nul
exit /b 0