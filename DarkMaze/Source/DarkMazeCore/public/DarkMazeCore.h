#pragma once

#include "CoreMinimal.h"
#include "Modules/ModuleInterface.h"

class FDarkMazeCore : public IModuleInterface
{
public:
	static inline FDarkMazeCore& Get()
	{
		return FModuleManager::LoadModuleChecked<FDarkMazeCore>("DarkMazeCore");
	}

	static inline bool IsAvailable()
	{
		return FModuleManager::Get().IsModuleLoaded("DarkMazeCore");
	}

	virtual void StartupModule() override;
	virtual void ShutdownModule() override;
};
