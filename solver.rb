#this takes a hash as input (I'll make another damn file for the converter) and
#where keys are nodes and the values are connections.
#This will also take a starting position and and exit.
#it will map the nodes traversed to reach the exit, and return them in an array

EXAMPLE_HASH = { one: [:one, 0, :two, :three], two:[:two, 0, :one, :five],
  three:[:three, 0, :one, :seven], four: [:four, 0, :seven, :nine],
   five: [:five, 0, :two, :eight], six: [:six, 0, :seven],
   seven:[:seven, 0, :three, :four, :six], eight:[:eight, 0, :five, :nine],
   nine:[:nine, -10, :eight, :four]}


def wrapper maze
  solve(maze[:one], [], maze)
end

#------------------START OF MAIN SOLVER FUNCTION-----------------------------#

#TAKES: hash representing maze
#RETURNS: array representing nodes passed to reach exit in order
def solve node, recorded, maze

  recorded << node[0]

  if node[1] < 0

    # Fun Fact: the name of the current node has to be in node. We can;t use
    # values to find keys because there could be multiple versions of the
    # same value

    recorded
  else
    analyse(node, maze)

    # this should select the node from those connected that has been tried the
    # lowest number of times
    nxt = lowest(node[2..-1], maze)

    solve(maze[nxt], recorded, maze)
  end
end


#------------------END OF MAIN SOLVER FUNCTION-----------------------------#

#------------------START OF ANALYSE SUB-FUNCTIONS-----------------------------#

#we want to be able to record how many times we have visited each node
#we also want to record which nodes are dead ends


# TAKES: maze hash, and current node
# RETURNS: it modifies the node and/or the maze
#This checks if the node is a dead end, we remove that node as a connection from
#its connected nodes in hash
#otherwise, we mark how many times it has been visited
def analyse node, maze

  if node.length == 3
    kull(maze, node[0])
  else
    node[1] = mark(node[1])
  end

end

#removes all instances of node (the name of a node) from maze values
def kull maze, node_name

  maze.each do |k, v|
    if v.include?(node_name)
      v.delete(node_name)
    end
  end

end

# simply adds 1 to the current value (count of times visited), or, if the node
# has never been visited, it turns the X into a 1s
def mark value
    value += 1
end

#------------------END OF ANALYSE SUB-FUNCTIONS-----------------------------#

#------------------START OF LOWEST SUB-FUNCTIONS-----------------------------#

# TAKES: an array containing the keys to 1 or more nodes and the maze hash
#RETURNS one of those names (the one least visited)

def lowest(array, maze)

  p array

  #if there is only one array entry, the pairent node is a dead end and there
  #is no need to compare anything
  return array[0] if array.length == 1

  #we need to associate each name with the marked value of that node
  array.map! do |node|
    [maze[node][1], node]
  end

  p array

  # then we sort that array (so the lowest valued node is at the start) and
  # return the name from the first entry

  array.sort_by{|x, y| x}[0][1]

end

p wrapper(EXAMPLE_HASH)
