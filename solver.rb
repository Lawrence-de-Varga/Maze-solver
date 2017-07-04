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

  if doomed? maze, recorded

    return nil
  end

  #we need to work out if exit is even possible

  if node[1] == "EXIT"

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

    nxt = solve_lowest(node[3..-1], maze)

    solve(maze[nxt], recorded, maze)
  end
end


#------------------END OF MAIN SOLVER FUNCTION-----------------------------#

#-------------------------START OF DOOMED-CHECK-----------------------------#

# We want to check if all the nodes connected to all the nodes we have visited
# so far have been visited. If so, we have visited all possible nodes.

def doomed? maze, visited

  visited.each do |visited_node|

    maze[visited_node][3..-1].each do |possible_node|

      return false if !(visited.include?(possible_node))
    end
  end

  true
end

#---------------------------END OF DOOMED-CHECK-----------------------------#

#------------------START OF LOWEST SUB-FUNCTIONS-----------------------------#

# TAKES: an array containing the keys to 1 or more nodes and the maze hash
#RETURNS one of those names (the one least visited)

def solve_lowest(arr, maze)

  #if there is only one array entry, the pairent node is a dead end and there
  #is no need to compare anything

  return arr[0] if arr.length == 1

  #we need to associate each name with the marked value of that node
  arr.map! do |node|
    value = maze[node][1]
    return node if value == "EXIT"
    [value, node]
  end

  # then we sort that array (so the lowest valued node is at the start) and
  # return the name from the first entry
  arr.sort_by{|x, y| x}[0][1]

end

#------------------END OF LOWEST SUB-FUNCTIONS-----------------------------#

a = {1=>[1, "EXIT", 0], 2=>[2, 0, 0, 3], 3=>[3, 0, 0, 2, 4],
   4=>[4, 0, 0, 3, 5, 7], 5=>[5, 0, 0, 4, 6, 11],
    6=>[6, 0, 0, 5], 7=>[7, 0, 0, 4, 8, 15],
    8=>[8, 0, 0, 7, 9], 9=>[9, 0, 0, 8, 10], 10=>[10, 0, 0, 9], 11=>[11, 0, 0, 5, 12], 12=>[12, 0, 0, 11, 13], 13=>[13, 0, 0, 12, 14], 14=>[14, "EXIT", 0, 13], 15=>[15, 0, 0, 7, 16, 17], 16=>[16, 0, 0, 15], 17=>[17, 0, 0, 15, 18, 19], 18=>[18, 0, 0, 17], 19=>[19, 0, 0, 17, 20], 20=>[20, 0, 0, 19]}

p solver a, 20
