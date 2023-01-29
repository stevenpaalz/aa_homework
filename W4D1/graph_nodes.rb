class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new([starting_node])
    while !queue.empty?
        step = queue.shift
        return step if step.value == target_value
        step.neighbors.each do |neighbor| 
            if !visited.include?(neighbor)
                queue << neighbor
            end
        end
    end
    nil
end

require 'set'
a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
