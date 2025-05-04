# NasuPollo
A tiny fangame for Frapollo94.
It has been inspired by [Frapollo94](https://www.youtube.com/@frapollo94) playing Nasu in Yume Nikki on some of his recent streams.

## Game Design
_(This game will be small enough, that I will just use this .md file for writting down the game design for this game. Please be understanding, I am still a beginner to this.)_

### The idea for the game loop
- Player starts the game and is tasked to control a creature that catches falling objects.
- Each time player doesn't catch non-bonus falling object, player looses a life point. There will be a limited amount of life point.
- If player runs out of the life points, the game ends and the score is summed up and displayed to player.
- Player can decide to try again.

### Primary mechanics

#### Movement
Player is able to run in horizontal directions. 
Player can jump. 
The horizontal momentum won't die out instantly. It will be lost even slower if player happend to be in mids-air. 
While in air, player horizontal control is much worse than on ground.

#### Collectable objects
Collectable objects can be of bonus and non-bonus type. Non-bouns collectable object, if not caught, cause the player to loose 1 life point.
Types of non-bonus collectable objects:
- A collectable object falling from the top edge of the screen.
Types of bonus collectable objects:
- A collectable object, that is jumping from 1 side of screen to another.
- Parachute bonus object, that similat to the non-bonus one, falls from the top of the screen, but it falls significantly slower while sway from side to side. It will be vulnerable to changes in wind.

#### Wind and rain
During game, every couple of seconds there will be a chance for the weather to change. 
It can be:
- default weather
- windy
- rainy
- stormy -> windy + rainy
Rain makes the ground more slippery.
Wind pushes player towards 1 horizontal direction.

#### Bubbles
From time to time there may spawn a bubble. If player collides with it, player gets pushed upwards, as if they have jumped. Bubbles are not affected by weather, they just bounce of screen edges.

#### Falling rocks
From time to time a boulder/rock will fall instead of collectable object. Player has to just not touch it, until it disapears. Rock after hitting ground should make terrain voxels do a wave displacement animation.

#### Bomb flowers
From time to time, a flower will grow. Then every couple of times it has a chance to mature into a bomb flower. Bomb flower will explode and push away whatever hits it. This may push away player, collectable objects and falling stones.

### Graphics 
Graphics will be done in simple 3d, with use of blender and .glb or .gltf files. No need for anything more than this in this game.

The terrain should be build up from simple blocks, like a cheap voxel implementation. Those voxels may be slightly animated if needed. Those voxels should react to what's happening on screen. 
For example, an explosion should make a ripple effect in voxel displacement.

For the time of development, all objects and player model will be simple shapes, until the mechanics will get properly implemented. 
