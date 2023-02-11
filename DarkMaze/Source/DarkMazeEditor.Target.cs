using UnrealBuildTool;

public class DarkMazeEditorTarget : TargetRules
{
	public DarkMazeEditorTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "DarkMazeCore" } );
	}
}
