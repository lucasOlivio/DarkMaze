#include "DarkMazeCore.h"
#include "Modules/ModuleManager.h"

#include "Log.h"

void FDarkMazeCore::StartupModule()
{
	UE_LOG(LogDarkMazeCore, Log, TEXT("DarkMazeCore module starting up"));
}

void FDarkMazeCore::ShutdownModule()
{
	UE_LOG(LogDarkMazeCore, Log, TEXT("DarkMazeCore module shutting down"));
}

IMPLEMENT_PRIMARY_GAME_MODULE(FDarkMazeCore, DarkMazeCore, "DarkMazeCore");
