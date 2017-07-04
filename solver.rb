#this takes a hash as input (I'll make another damn file for the converter) and
#where keys are nodes and the values are connections.
#This will also take a starting position and and exit.
#it will map the nodes traversed to reach the exit, and return them in an array

# --------------------- TO              DO -------------------------------#

# (1) make it so we can work out if there is no exit

# --------------------- TO              DO -------------------------------#

def generate_start maze

  rand_start = maze.keys.sample

end

def solver maze, start

  solve(maze[start], [], maze)
end


#------------------START OF MAIN SOLVER FUNCTION-----------------------------#

#TAKES: hash representing maze
#RETURNS: the key of the exit
def solve node, recorded, maze

  recorded << node[0]


  #we need to work out if exit is even possible

  if node[1] < 0

    return node[0]
  else

    #point out the fact we just visited a node (nodes connected to dead ends
    #will automatically get visited lots, so that's good)
    #NOTE: no need to worry about modifyng the maze, we have another spare
    # 0 to be used with numberer and tourist
    node[1] += 1

    # this should select the node from those connected that has been tried the
    # lowest number of times
    # this is conveniant because it automatically makes the node we just
    # came from a lower priority than future nodes
    nxt = lowest(node[3..-1], maze)

    solve(maze[nxt], recorded, maze)
  end
end


#------------------END OF MAIN SOLVER FUNCTION-----------------------------#

#------------------START OF ANALYSE SUB-FUNCTIONS-----------------------------#

#turns out these actually only came down to a single line of code...

#------------------END OF ANALYSE SUB-FUNCTIONS-----------------------------#

#------------------START OF LOWEST SUB-FUNCTIONS-----------------------------#

# TAKES: an array containing the keys to 1 or more nodes and the maze hash
#RETURNS one of those names (the one least visited)

def lowest(array, maze)

  #if there is only one array entry, the pairent node is a dead end and there
  #is no need to compare anything
  return array[0] if array.length == 1

  #we need to associate each name with the marked value of that node
  array.map! do |node|
    [maze[node][1], node]
  end

  # then we sort that array (so the lowest valued node is at the start) and
  # return the name from the first entry

  array.sort_by{|x, y| x}[0][1]

end

#------------------END OF LOWEST SUB-FUNCTIONS-----------------------------#
