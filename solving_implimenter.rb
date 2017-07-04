# --------------------- TO              DO -------------------------------#

# (1) make the assigning of start and end values less rickety and shit

# --------------------- TO              DO -------------------------------#

require "./converter.rb"
require "./solver.rb"
require "./numberer.rb"
require "./tourist.rb"

maze =  converter "maze-desc.txt"

start = generate_start maze

p start

ext = solver maze, start

p ext


num_wrapper maze, start, maze[ext]

path = start_tour maze, start, ext

p path
