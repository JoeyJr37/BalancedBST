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

    def internal_print_tree(node, i)
        if node == nil
            nil
        else
            puts "Level #{i} Root: #{node.value}"
            puts "Right_child: #{node.right_child.value}" unless node.right_child == nil 
            puts "Left_child: #{node.left_child.value}" unless node.left_child == nil
            if how_many_children(node) != 0
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

    def delete_a_leaf(value)
        parent_node = find_parent_node(@root, value)
        if parent_node.right_child == nil
            if parent_node.left_child.value == value
                parent_node.left_child = nil
                puts "#{value} has been removed!"
            else
                puts "Something went wrong!"
            end
        else
            if parent_node.right_child.value == value
                parent_node.right_child = nil
            else
                parent_node.left_child.value = nil
            end
        end
    end

    def delete_node_with_one_child(value)
        parent_node = find_parent(value)
        node = find(value)
        # puts "Parent Right Child: #{parent_node.right_child.value}"
        # puts "Parent Left Child: #{parent_node.left_child.value}"
        # puts "Node Right Child: #{node.right_child.value}"
        # puts "Node Left Child: #{node.left_child.value}"
        if parent_node.right_child.value == node.value
            if node.right_child == nil
                puts "#{node.value} was removed!"
                parent_node.right_child = node.left_child
            else
                puts "#{node.value} was removed!"
                parent_node.right_child = node.right_child
            end
        elsif parent_node.left_child.value == node.value
            if node.right_child == nil
                puts "#{node.value} was removed!"
                parent_node.left_child = node.left_child
            else
                puts "#{node.value} was removed!"
                parent_node.left_child = node.right_child
            end
        else
            puts "Something went wrong!"
        end
    end

    def has_left_child?(node)
        if node.left_child != nil
            true
        else
            false
        end
    end

    def find_left_most_value(node)
        if has_left_child?(node)
            find_left_most_value(node.left_child)
        else
            node
        end
    end

    def delete_node_with_two_children(node, value)
        node = find(value)
        parent_node = find_parent(value)
        right_sub_tree = node.right_child
        left_most_node = find_left_most_value(right_sub_tree)
        puts "#{node.value} has been removed!"
        replacement_value = left_most_node.value
        delete_a_leaf(left_most_node.value)
        node.value = replacement_value
    end

    def delete(value)
        node = find_node(@root, value)
        if node == nil
            puts "#{value} is not in this tree."
        elsif how_many_children(node) == 0
            delete_a_leaf(value)
        elsif how_many_children(node) == 1
            delete_node_with_one_child(value)
        else
            delete_node_with_two_children(node, value)
        end
    end

    def find_parent_node(node, value)
        if node == nil
            nil
        elsif how_many_children(node) == 2
            if node.right_child.value == value
                node
            elsif node.left_child.value == value
                node
            else
                right_child = find_parent_node(node.right_child, value)
                left_child = find_parent_node(node.left_child, value)
                if right_child == nil
                    if left_child == nil
                        nil
                    else
                        left_child
                    end
                else
                    right_child unless left_child == value
                end
            end
        elsif how_many_children(node) == 1
            if node.right_child == nil
                if node.left_child.value == value
                    node
                else
                    find_parent_node(node.left_child, value)
                end
            else
                if node.right_child.value == value
                    node
                else
                    find_parent_node(node.right_child, value)
                end
            end
        else
            nil
        end
    end

    def find_parent(value)
        node = find_parent_node(@root, value)
        if node == nil
            puts "#{value} is not in this tree."
        else
            node
        end
    end

    def find_node(node,value)
        if node == nil
            nil
        elsif node.value == value
            node
        else
            right_child = find_node(node.right_child, value)
            left_child = find_node(node.left_child, value)
            if right_child == nil
                if left_child == nil
                    nil
                else
                    left_child
                end
            else
                right_child
            end
        end
    end

    def find(value)
        node = find_node(@root, value)
        if node == nil
            puts "#{value} is not in this tree."
        else
            node
        end
    end

end