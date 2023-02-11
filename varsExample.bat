::Gets the local dir
set ROOTDIR=%~dp0
::Removes the trailing slash
set ROOTDIR=%ROOTDIR:~0,-1%

set PROJECT=DarkMaze
set PROJECT_DIR=%ROOTDIR%\%PROJECT%
set UPROJECT_PATH=%PROJECT_DIR%\%PROJECT%.uproject

set UE5_DIR=<FULL PATH TO UE_5.1 folder>
set UE5EDITOR_EXE=%UE5_DIR%\Engine\Binaries\Win64\UnrealEditor.exe
set BUILD_BAT=%UE5_DIR%\Engine\Build\BatchFiles\Build.bat