

@echo off
setlocal EnableDelayedExpansion
set LogFolderName=%LOCALAPPDATA%\CMDLogs
set LogFileName=%date:~0,4%%date:~5,2%%date:~8,2%.log

IF NOT EXIST %LogFolderName% (md %LogFolderName%)
IF NOT EXIST %LogFolderName%\%LogFileName% (echo timestamp,command>> %LogFolderName%\%LogFileName%)

:getcmd
set Command=
set DateTime=%date:~0,4%-%date:~5,2%-%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%
set /P Command=%cd%^>
echo %DateTime%,!Command!>> %LogFolderName%\%LogFileName%
call %Command%
goto getcmd
