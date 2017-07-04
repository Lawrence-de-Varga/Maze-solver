=begin

This is a really dumb version of solver to be used on the maze once numberer
has done his thing. it just starts from the start and chooses the lowest
node at every branch and appends it to an array which it returns. This array
will be the fastest path for reaching the exit.

=end


def start_tour maze, start, ext
  tour_reformat maze, maze[ext]

  tourist(maze[start], [], maze)
end

#------------------START OF MAIN SOLVER FUNCTION-----------------------------#

#TAKES: hash representing maze that's already been mapped
#RETURNS: array representing nodes passed to reach exit in order

#does 2 things:
# =>  checks if it has reached the exit
# =>  if not, sends a clone with the same array to the lowest scored connecting
#     node. (There won't be any dead ends. )
def tourist node, recorded, maze

  recorded << node[0]

  if node[2] == "EXIT"


    recorded
  else

    nxt = lowest(node[3..-1], maze)

    tourist(maze[nxt], recorded, maze)
  end
end


#------------------END OF MAIN SOLVER FUNCTION-----------------------------#

#------------------START OF LOWEST SUB-FUNCTIONS-----------------------------#

# TAKES: an array containing the keys to 1 or more nodes and the maze hash
#RETURNS one of those names (the one least visited)

def lowest(array, maze)

  #if there is only one array entry, the pairent node is a dead end and there
  #is no need to compare anything
  return array[0] if array.length == 1

  #we need to associate each name with the marked value of that node
  array.map! do |node|
    [maze[node][0], node]
  end

  # then we sort that array (so the lowest valued node is at the start) and
  # return the name from the first entry


  array.sort_by{|x, y| x}[0][1]

end

#------------------END OF LOWEST SUB-FUNCTIONS-----------------------------#


#we need this so that tourist knows when it has reached the exit
def tour_reformat maze, ext
  ext[2] = "EXIT"
end
