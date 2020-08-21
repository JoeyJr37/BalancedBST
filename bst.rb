# Build a Node class. It should have attributes for the data it stores as well as its left and right children. 
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
        if array == nil
            nil
        else
            sorted_array = array.sort.uniq
            end_point = sorted_array.length
            start_point = 0
            mid = (end_point - start_point.to_i)/2
            root = sorted_array[mid]
            # find midpoint of array
            # midpoint is level-1 node
            # from start to mid - 1 is left child
            left_array = sorted_array.slice(0, mid)
            right_array = sorted_array.slice(mid + 1, sorted_array.length)
            # left_child = build_tree(left_array)
            # right_child = build_tree(right_array)
            # puts "Sorted Array is: #{sorted_array}, Mid is: #{mid}, Left End is: #{left_end}
             #   Root is: #{root}, Left Array: #{left_array}, Left Child: #{left_child}, 
              #  Right Array: #{right_array}, Right Child: #{right_child}"
            puts "Sorted Array is: #{sorted_array}, Mid is: #{mid},
                Root is: #{root}, Left Array: #{left_array},
                Right Array: #{right_array}"
            # from mid + 1 to end is right child
            # build tree with left child
            # build tree with right child
            root
        end
    end

    def build_tree_helper(array, start_point, end_point)
        if start_point > end_point
            nil
        else
            mid = (start_point - end_point.to_i)/2
            root = array[mid]
            left_half = build_tree_helper(array, start_point, mid - 1)
            right_half = build_tree_helper(array, mid + 1, end_point)
            root
        end
    end
end