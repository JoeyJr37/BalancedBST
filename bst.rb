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
    def internal_print_tree(node, i)
        if node == nil
            nil
        else
            puts "Level #{i}: root: #{node.value}"
            puts "Right_child: #{node.right_child.value}" unless node.right_child == nil 
            puts "Left_child: #{node.left_child.value}" unless node.left_child == nil
            if has_children?(node)
                internal_print_tree(node.right_child, i + 1)
                internal_print_tree(node.left_child, i + 1)
            else
                nil
            end
        end
    end

    def print_tree
        internal_print_tree(@root, 1)
    end

    # if the value is smaller than the root node, go to left child
    # if the value is larger than the root node, go to right child
    # if the value is smaller than the root node and the left child is nil then make the value the left child
    # if the value is larger than the root node and the right child is nil then make the value the right child

    def internal_insert(node, value)
        if node.value == value
            puts "#{value} is already included in the tree."
        elsif node.value < value
            if node.right_child == nil
                node.right_child = Node.new(value, nil, nil)
            else
                internal_insert(node.right_child, value)
            end
        elsif node.value > value
            if node.left_child == nil
                node.left_child = Node.new(value, nil, nil)
            else
                internal_insert(node.left_child, value)
            end
        else
            puts "Something went wrong!"
        end
    end

    def insert(value)
        internal_insert(@root, value)
        print_tree
    end
            
    def delete_a_leaf(node)
        node = nil
    end

    def delete_node_with_one_child(parent_node, value)
        if parent_node.left_child.value == value
            parent_node.left_child = parent_node.left_child.left_child
        elsif parent_node.right_child.value == value
            parent_node.right_child = parent_node.right_child.left_child
        else
            puts "Something went wrong!"
        end
    end

    def delete_node_with_two_children(node, value)
        # node.right_child.left_child has_children? delete_node_with_two_children (node.right_child.left_child)
        # once you get to final node.left_child save that value, then delete that leaf
        # replace the value of original node with saved value of deleted leaf
    end

    def how_many_children(node)
        counter = 0
        if node.left_child != nil
            counter += 1
            if node.right_child != nil
                counter += 1
            end
        end
        counter
    end

    def delete_node(node, value)
        if how_many_children(node) == 0
            delete_a_leaf(node)
        elsif how_many_children == 1
            delete_node_with_one_child(node, value)
        elsif how_many_children == 2
            delete_node_with_two_children(node, value)
        else
            puts "Something went wrong!"
        end
    end

    def delete(value)
        # if the first node is equal to the submitted value, does it have children?
        # if no then delete_a_leaf
        # if one then delete_node_with_one_child
        # if two then delete_node_with_two_children
    end

    def find_node(node,value)
        # if node value == value, then return with that node
        if node.value == value
            node
        elsif node.right_child != nil
            if node.right_child.value == value
                node.right_child
            else
                find_node(node.right_child, value)
            end
        elsif node.left_child != nil
            if node.left_child.value == value
                node.left_child
            else
                find_node(node.left_child, value)
            end
        else
            puts "I can't find it!"
        end
    end

    def print_children(value)
        node = find_node(@root, value)
        p node
        # p how_many_children(node)
    end
end