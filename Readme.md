<!-- markdownlint-disable MD033 MD041 -->
<img src="https://github.com/lucasOlivio/DarkMaze/blob/main/Docs/Images/tittle.png?raw=true" width="100%">

![MIT-LICENSE](https://img.shields.io/github/license/lucasOlivio/DarkMaze) ![RELEASE](https://img.shields.io/github/v/release/lucasOlivio/DarkMaze) ![RELEASE](https://img.shields.io/github/repo-size/lucasOlivio/DarkMaze)
 ---

Prepare yourself for entering the most terrifying maze, where lights don't got very far as the darkness is so dense that you almost have to push yourself ahead.
Be aware! Don't go too fast or you might find out why nobody ever came out of this maze alive...

## About the game

The evolution of Dark Cave, but now with graphics! This game was made with the pourpose of learning more about C++ and other game engines in general.
It was all written in GDScript and C++, the original idea was to write it all in C++, but as I researched a little more I realised that was a task too much, that would endup takong too long and defeating the whole purpose of the project, which is to learn more about C++ and also where it can better fit with the game engines.
The idea now is to develop it all with Godot and use the best features and tools it has to offer and then port what I can and what makes sense to C++.

[DEMO]

### Technologies

- Godot 3.5.1
- GDScript
- Microsoft Visual C++ 14.31

### Setup

To edit the game you first must create a vars.bat file with the parameters specified on the varsExample.bat

Then just run the "build" and "editor" scripts to build the game binaries and open with Unreal:

```bash
build && editor
```

#### Build Game

To build the standalone game just run the "buildGame" script:

```bash
build
```

And the .exe will be available at Binaries/Win64 folder
