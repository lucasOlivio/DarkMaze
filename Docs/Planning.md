# Game planning

---

## About the game

All planning before the game development are written here for better understand of how the game will work and better decision of the next steps.

### History resume

An treasure hunter ends up in a dark piramid, looking for a treasure worth more than any furtune in the world. Now he must explore this maze to find its gold and hopefully leave, but soon he finds out that the piramid holds more terrifying things than just darkness...

### Basic gameplay

The player starts at the piramid's entrance and all of the maze is completly black. The only ilumination is from the torch the player holds, everithing else is always black, even the path already traveled.
Often when the player chooses a wrong path he can encounter a mummy, that will follow him just a little, but if it touches the player he dies and the game ends.
Also the ilumination doesn't shows too much ahead, so the player must be careful walking, because at any time he can enccounter a mummy and die.
Eventually the player will find the treasure, but as soon as he reaches it the pharao's mummy wakes up to revenge its lost treasure. Now the player must hurry and remember his path to leave the maze before its too late.

### Details

- **Genre:** puzzle exploration, horror.
- **Graphics:** 2D Top-down.
- **Engine:** Godot 3.5.1.
- **Programming language:** GDScript, C++

#### Heroes and villains

##### Hero

Our hero is a renowned tresure hunter, trying to find the biggest treasure of all. The only things he has are a torch and courage, his only actions are moving around and hoping to find the treasure soon enough.

##### Villains

- **Mummy:** The basic monster in the maze, its very slow but if you are inattentive it will catch you. When the mummy spots the player it will follow him for a short while then come back to the respawn.

- **Pharao:** The big boss. Will relentless chase the player, its only motivation is to get revenge for the lost treasure. Its not as fast as the player but is faster than the mummies, so the player must hurry to leave and be careful to not get cornered.

#### The maze

The maze is auto-generated, must be about 32x32 tiles.
