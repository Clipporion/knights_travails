$moves = [[-1, -2], [1, -2], [-1, 2], [1, 2], [-2, -1], [2, -1], [-2, 1], [2, 1]]
$field = []
(0..7).each do |i|
  (0..7).each do |j|
    $field.push([i,j])
  end
end

class Node
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
    add_edge(@value)
  end

  def add_edge(value)
    $moves.each do |move|
      target = [value[0]+move[0],value[1]+move[1]]
      if $field.include?(target)
        @neighbors.push(target)
      end
    end

  end
end


class Graph
  attr_accessor :nodes
  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def knight_moves(start, target)
    return 'Start or target not on the field' unless $field.include?(start) || $field.include?(target)

    queue = [[@nodes[start],[]]]
    visited = []
    until queue.empty?
      current = queue.shift
      node = current[0]
      path = current[1]
      visited.push(node.value)
      path.push(node.value)
      if node.value == target
        return puts "It took #{path.length-1} turns, #{path}"
      else
        node.neighbors.each do |child|
          queue.push([@nodes[child],path.clone]) unless visited.include?(child)
        end
      end
    end
  end
end

newgraph = Graph.new
$field.each do |field|
  node = Node.new(field)
  newgraph.nodes[node.value] = node
end
start = [0,0]
p newgraph.nodes[start].neighbors
p newgraph.nodes[start].value
newgraph.knight_moves([3,3],[4t,3])
