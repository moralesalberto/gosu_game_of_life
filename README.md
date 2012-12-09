gosu_game_of_life
=================

Having spent yesterday at CodeRetreat, I could not help but finish the exercise
This implementation slaps a GUI with Gosu.

Gosu has two methods update and draw that run at every tick. This approach works
with the Game of Life, as the tick traversing is already implemented.

The main.rb file gets the Window going, and you pass a seed.