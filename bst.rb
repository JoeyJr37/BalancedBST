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
        if array == []
            nil
        else
            sorted_array = array.sort.uniq
            # find midpoint of array
            # midpoint is level-1 node
            mid = (sorted_array.length - 0.to_i)/2
            root = sorted_array[mid]
            # from start to mid - 1 is left child
            # from mid + 1 to end is right child
            left_array = sorted_array.slice(0, mid)
            right_array = sorted_array.slice(mid + 1, sorted_array.length)
            # build tree with left child
            # build tree with right child
            left_child = build_tree(left_array)
            right_child = build_tree(right_array)
            # puts "Sorted Array is: #{sorted_array}, Mid is: #{mid},
            #    Root is: #{root}, Left Array: #{left_array}, Left Child: #{left_child}, 
            #    Right Array: #{right_array}, Right Child: #{right_child}"
            root_node = Node.new(root, left_child, right_child)
            # puts "Root is: #{root_node.value}, Left Child is: #{root_node.left_child}, Right Child is: #{root_node.right_child}"
            root_node
        end
    end
    def test
        p @root
    end
    # Write an #insert and #delete method which accepts a value to insert/delete 
    # (you’ll have to deal with several cases for delete such as when a node has children or not). 
    # If you need additional resources, check out these two articles on inserting and deleting, 
    # or this video with several visual examples.
    def internal_insert(root_node, value)
        # if the value is smaller than the root node, go to left child
        # if the value is larger than the root node, go to right child
        # if the value is smaller than the root node and the left child is nil then make the value the left child
        # if the value is larger than the root node and the right child is nil then make the value the right child
        if root_node == nil
            root_node = Node.new(value, nil, nil)
        elsif root_node.value == value
            puts "#{value} is already included in this tree."
        elsif root_node.value > value
            internal_insert(root_node.left_child, value)
        elsif root_node.value < value
            internal_insert(root_node.right_child, value)
        else
            puts "Something went wrong."
        end
    end

    def traverse_tree(root_node, new_node)
        if root_node == nil
            root_node = new_node
        elsif root_node.value < new_node.value
            traverse_tree(root_node.right_child, new_node)
        elsif root_node.value > new_node.value
            traverse_tree(root_node.left_child, new_node)
        else
            puts "Something went wrong!"
        end
    end

    def insert(value)
        new_node = internal_insert(@root, value)
        traverse_tree(@root, new_node)
        p @root
    end
end