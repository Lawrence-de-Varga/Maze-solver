# step 0: connect all nodes that are connected to the current node, to the
# => current node
# step 1: pick a random node that exists and connect it to the current node
# step 2: repeat step 1 some number of times
# step 3: for each connected node, repeat step 1, but

class Node

  attr_reader :connected

  def initialize name, pairent
    @name = name
    @connected = []
    add pairent
  end

  def add node
    connected << node
    node.connected << self unless node == "start"
  end

end

class MazeMaker

  attr_reader :max_nodes, :max_length, :loopiness, :max_branches, :nodes
  attr_accessor :current_num, :current_nodes

  def initialize maze_length=20, max_branches=3, loopiness=10
    @max_nodes = maze_length
    @max_branches = max_branches
    @loopiness = loopiness

    @nodes = []
    @current_nodes = 0
    @current_num = 0
  end

  def make_node pairent
    self.current_num += 1
    node = Node.new(current_num, pairent)
    self.current_nodes += 1
    nodes << node

    if current_nodes >= max_nodes
      return node
    else
      new_nodes = rand(0..max_branches-1)
      new_nodes.times do
        new_node = select_node node
        node.add new_node
      end
    end
      return node
  end


  def select_node pairent
    puts pairent
    make_new = rand(0..100)

    if make_new < @loopiness
      nodes.sample
    else
      make_node pairent
    end
  end

end


larry = MazeMaker.new

larry.make_node Node.new(0, "start")

p larry.nodes.length
