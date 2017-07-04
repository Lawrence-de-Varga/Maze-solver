# --------------------- TO              DO -------------------------------#

# (1) find a way to exit all the children of the first numberer as soon as
#     we find the exit

# --------------------- TO              DO -------------------------------#


=begin
this guy starts at the exit and recursively numbers each tile depending on it's
distance (in nodes) from the exit. When all nodes are numbered, we can
find the quickest path simply by choosing the lowest possible node at every
junction.


this program should

1. check the mark of the current square.
  1. if it is the entrance, exit or an already numbered square, return
     something arbetrary
  2.otherwise:
    1. mark the square with the current number
    2. run itself on all the connections of the current number (excepting the)
        node we just came from with:
          1. an incrimented number,




That's all i think...
=end


# each instance needs:
# => current (EXIT) node_name
# => number (distance from exit)
# => the pervious node (for efficiency's sake)
# => the maze
def numberer maze, node, number = 1, prev_node = nil


  # we want all numberer calls to stop when one of them hits start, but for now
  # we'll just return nil before we start comparing shit
  if node[2] == "START"
    return nil
  end

  if node[2] > 0
    return nil

  else

    node[2] = number

    number += 1

    node[3..-1].each do |name|
      unless name == prev_node
        numberer(maze, maze[name], number, node[0])
      end

    end

  end

end

# this just mutates maze so that the start and end are both labelled so that
# numberer will understand them
def reformat maze, start
  maze[start][2] = "START"
end

def num_wrapper maze, start, ext_node
  p start
  reformat maze, start

  numberer maze, ext_node
end
