@echo off

:: Call project variables
call %~dp0\vars.bat

call "%BUILD_BAT%" %PROJECT%Editor Win64 Development "%UPROJECT_PATH%" -waitmutext -NoHotReload 
