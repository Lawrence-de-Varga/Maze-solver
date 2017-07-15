# NOTE: mazes generates by this program cannot (except by chance) be drawn in 2-dimensions
# Will have to work on that... cough cough... never going to happen.

# The algorithm as currently conceived (not implemented) goes something like this:
# STEP 1: Generates first path or branch. Branches are comprised of some number of connected nodes.
# Each node has the potential to become another branch (or branches)
# Each branch (much like a tree) has other branches coming off it, and may loop back to
# itself directly or via other branches
# STEP 2: Go to first node, select (by some mysterious process), some number of branches to 
# sprout from the nodes, and the run a generic make_branch function for each new branch
# NOTE: not sure how deep we want the trees to go, might just make that another input.
# NOTE: Also not sure how to control tree depth
# STEP 3: errr, repeat STEP 2 until satisfied
# I think I have bitten off more than I can chew with this 'generate' a maze problem

# $nodes is a list of extant nodes used to check whether the node we are generating already exists
$nodes = []
def may_i(num)
  false if $nodes.include?(num)
end

# $max_branch_len is the largest number of nodes a branch may have (give or take a few perhaps)
puts "What is the longest possible branch length for this maze?"
$max_branch_len = gets.chomp.to_i

# $node_range is a range used to grab random numbers from, i.e all new nodes will be grabbed 
# from (1..$node_range ** 3)
$node_range = (1..($max_branch_length ** 3))

# gen_node_key takes a number (e.g. 5) and returns :node5
def gen_node_key(num)
  return "node#{num}".to_sym
end

# takes a limit to pass to rand and an array of numbers that cannot be returned
def gen_uniq_rand(limit, unuseable)
  random = rand(limit)
  !(unuseable.include?(random)) ? random : gen_uniq_rand(limit, unuseable)
end
   

# just to make code clearer, this function wraps gen_uniq_rand to specifically make
# a new value for a node.
def gen_new_node_num()
  gen_uniq_rand($node_range, $nodes)
end

# 'connect_to_old_branch' will with some currently undetermined method, decide whether to make
# a new path or connect the current node to an extant node.
def connect_to_old_branch(current_node,


=begin 
def gen_path(options = {})
  path = Array.new(options[:length])
  
   
# Takes path length and returns scrambled path to base the rest of the maze on
# the number will later be used in generating node designators of the form 
# :nodeNum where Num is replaced by some int
# These will be used in a self refrencing hash
def gen_first_path(path_length)
  # we will now generate an array with path_length number of elements
  # the elements will be randomly selected numbers from (1.. path_length ^ 2)
  # to avoid duplicate numbers we will kepp track of which ones have already been used 
  # in another local array

  used = []

  path = Array.new(path_length) # -> [nil,nil,nil....,nil]

  path.map! do |el|
    random = gen_uniq_rand(path_length ** 2, used)
    used << random
    index = path.index(el)
    path[index] = random
  end
end 









=end
