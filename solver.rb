#this takes a hash as input (I'll make another damn file for the converter) and
#where keys are nodes and the values are connections.
#This will also take a starting position and and exit.
#it will map the nodes traversed to reach the exit, and return them in an array

EXAMPLE_HASH = { one: [:one, "X", :two, :three], two:[:two, "X", :one, :five],
  three:[:three, "X", :one, :seven], four: [:four, "X", :seven, :nine],
   five: [:five, "EXIT", :two, :eight], six: [:six, "X", :seven],
   seven:[:seven, "X", :three, :four, :six], eight:[:eight, "X", :five, :nine],
   nine:[:nine, "X", :eight, :four]}


def wrapper maze
  solve(maze[:one], [], maze)
end


#TAKES: hash representing maze
#RETURNS: array representing nodes passed to reach exit in order
def solve node, recorded, maze

  recorded << node[0]

  if node[1] == "EXIT"

    # Fun Fact: the name of the current node has to be in node. We can;t use
    # values to find keys because there could be multiple versions of the
    # same value

    recorded
  else
    analyse(node, maze)

    nxt = node[2..-1].sample

    solve(maze[nxt], recorded, maze)
  end
end

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
    mark(node[1])
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
  if value.class == Fixnum
    value += 1
  elsif value == "X"
    value = 1
  end

end

p wrapper(EXAMPLE_HASH)
