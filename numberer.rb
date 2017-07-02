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


EXAMPLE_HASH = { one: [:one, 0, :two, :three], two:[:two, "START", :one, :five],
  three:[:three, 0, :one, :seven], four: [:four, 0, :seven, :nine],
   five: [:five, 0, :two, :eight], six: [:six, "EXIT", :seven],
   seven:[:seven, 0, :three, :four, :six], eight:[:eight, 0, :five, :nine],
   nine:[:nine, 0, :eight, :four]}

# each instance needs:
# => current node_name
# => number
# => the maze
# => the pervious node (for efficiency's sake)
def numberer node, number, prev_node, maze

  unless node[1] == 0
    return nil

  else
    node[1] = number

    number += 1

    node[2..-1].each do |name|
      unless name == prev_node
        numberer(maze[name], number, node[0], maze)
      end
    end

  end

end


numberer EXAMPLE_HASH[:seven], 1, "bob", EXAMPLE_HASH

puts "all numbered"

p EXAMPLE_HASH
