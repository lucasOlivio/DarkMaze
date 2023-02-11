using UnrealBuildTool;

public class DarkMazeTarget : TargetRules
{
	public DarkMazeTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "DarkMazeCore" } );
	}
}
