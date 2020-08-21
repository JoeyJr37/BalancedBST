class Node

    attr_accessor :value, :left_child, :right_child

    def initialize(value, left_child, right_child)
        @value = value
        @left_child = left_child
        @right_child = right_child
        
    end
end

class Tree
    attr_accessor :root
    def initialize(array)
        @root = build_tree(array)
    end
    # Write a #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) 
    # and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!). 
    # The #build_tree method should return the level-1 root node.
    def build_tree(array)
        sorted_array = array.sort.uniq
        # find midpoint of array
        # midpoint is level-1 node
        # from start to mid - 1 is left child
        # from mid + 1 to end is right child
        # build tree with left child
        # build tree with right child
    end

    def build_tree_helper(array, start_point, end_point)
        if start_point > end_point
            nil
        else
            mid = (start_point - end_point)/2
            


end