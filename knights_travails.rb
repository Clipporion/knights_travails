class Node
  attr_accessor :value, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eighth

  def initialize(value)
    @value = value
    @first = nil
    @second = nil
    @third = nil
    @fourth = nil
    @fifth = nil
    @sixth = nil
    @seventh = nil
    @eighth = nil
  end
end

class Knight
  attr_reader :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eighth
  attr_accessor :tree, :turns, :steps, :board, :nodes

  def initialize
    @first = [-1, -2]
    @second = [1, -2]
    @third = [-1, 2]
    @fourth = [1, 2]
    @fifth = [-2, -1]
    @sixth = [2, -1]
    @seventh = [-2, 1]
    @eighth = [2, 1]
    @tree = nil
    @turns = 0
    @steps = nil
    @board = []
    @nodes = []

    8.times do |i|
      8.times do |j|
        @board.push([i, j])
      end
    end
  end

  # def build_tree(root_node, target, board = @board.clone)
  #   return nil unless @board.include?(root_node)
  #   return find_node(root_node) unless board.include?(root_node)

  #   node = Node.new(root_node)
  #   board.delete(root_node)
  #   node.first = build_tree([root_node[0] + @first[0], root_node[1] + @first[1]], target, board)
  #   node.second = build_tree([root_node[0] + @second[0], root_node[1] + @second[1]], target, board)
  #   node.third = build_tree([root_node[0] + @third[0], root_node[1] + @third[1]], target, board)
  #   node.fourth = build_tree([root_node[0] + @fourth[0], root_node[1] + @fourth[1]], target, board)
  #   node.fifth = build_tree([root_node[0] + @fifth[0], root_node[1] + @fifth[1]], target, board)
  #   node.sixth = build_tree([root_node[0] + @sixth[0], root_node[1] + @sixth[1]], target, board)
  #   node.seventh = build_tree([root_node[0] + @seventh[0], root_node[1] + @seventh[1]], target, board)
  #   node.eighth = build_tree([root_node[0] + @eighth[0], root_node[1] + @eighth[1]], target, board)
  #   @nodes.push(node)
  #   node
  # end

  def build_tree
    @board.each do |node|
      @nodes.push(Node.new(node))
    end
    @nodes.each do |node|
      node.first = find_node([node.value[0] + @first[0], node.value[1] + @first[1]])
      node.second = find_node([node.value[0] + @second[0], node.value[1] + @second[1]])
      node.third = find_node([node.value[0] + @third[0], node.value[1] + @third[1]])
      node.fourth = find_node([node.value[0] + @fourth[0], node.value[1] + @fourth[1]])
      node.fifth = find_node([node.value[0] + @fifth[0], node.value[1] + @fifth[1]])
      node.sixth = find_node([node.value[0] + @sixth[0], node.value[1] + @sixth[1]])
      node.seventh = find_node([node.value[0] + @seventh[0], node.value[1] + @seventh[1]])
      node.eighth = find_node([node.value[0] + @eighth[0], node.value[1] + @eighth[1]])
    end
  end
    

  def find_node(value)
    return nil unless @board.include?(value)

    counter = 0
    node = @nodes[counter]

    until node.value == value
      node = @nodes[counter]
      counter += 1
    end
    node
  end

  def count_turns(start, target)
    start_node = find_node(start)
    queue = [start_node]
    counter = 0

    until queue.empty?
      search = queue.shift
      if search.is_a?(Array)
        node = search.select {|search_value| search_value.value == target}
      elsif search.is_a?(Node)
        node = search
      end
      return if node.value == target
      queue.push([node.first, node.second, node.third, node.fourth, node.fifth, node.sixth, node.seventh, node.eighth])
      counter += 1
    end
    counter
  end
end

knight = Knight.new
p knight.board
knight.tree = knight.build_tree
p knight.count_turns([0,0], [3,3])

