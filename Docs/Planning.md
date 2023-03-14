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

Our hero is a renowned tresure hunter, trying to find the biggest treasure of all. The only things he has are a torch and courage, his only actions are moving up/down/right/left and hoping to find the treasure without touching any mummy, then after finding the treasure he must leave the maze by the same path he came and this time faster, because the Pharao will be chasing him all the time.

##### Villains

- **Mummy:** The basic monster in the maze, its very slow but if you are inattentive it will catch you. When the mummy spots the player it will follow him for a short while then come back to the respawn.

- **Pharao:** The big boss. Will relentless chase the player, its only motivation is to get revenge for the lost treasure. Its not as fast as the player but is faster than the mummies, so the player must hurry to leave and be careful to not get cornered.
  - **Problem:** Finding the best(fastest) path to the player (constantly moving) in a static maze.
    - **Initial states:** The player will always be right in front of the Pharao initially, since the treasure must always be placed in front of it and the Pharao will only wake up (start moving) when the treasure is collected.
    - **Actions:** The Pharao is limited to go up/down/right/left, but can't go through walls.
    - **Transition model:** The pharao must play its groaning sound and its walking animation whenever its moving. When the player dies the pharao must stop.
    - **Goal state:** Reach the player before he gets to the exit.
    - **Action cost:** Each cell costs 1.

#### The maze

The maze is 32x32 tiles size for the easy level, 48x48 for the medium level and 64x64 for the hard level.

### Credits

- Images:
  - Menu background: [Pixelweentomb](https://pixeljoint.com/files/icons/full/pixelweentomb.png)

- Sounds:
  - Menu background: [Pixabaya](https://pixabay.com/sound-effects/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=16883)
  - Mummy: [Pixabaya](https://pixabay.com/sound-effects/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=102585)
  - Player walking: [Pixabaya](https://pixabay.com/sound-effects/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6404)
  - Ambient and torch: [Pixabaya](https://pixabay.com/sound-effects//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=123930)
  - Pharao sound and steps: [Pixabaya](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6172) [Pixabaya](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=39193)
  - Chest sound: [Pixabaya](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=37191)