@echo off

:: Call project variables
call %~dp0\vars.bat

start "" "%UE5EDITOR_EXE%" "%UPROJECT_PATH%" %*
