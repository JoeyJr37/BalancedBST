require_relative 'bst'

# test = Tree.new([1,5,9,13,17,21,25,29,33,37])

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
random_array = Array.new(15) {rand(1..100)}
p random_array
test = Tree.new(random_array)
# test.print_tree
# 2. Confirm that the tree is balanced by calling `#balanced?`
    # test.balanced?
# 3. Print out all elements in level, pre, post, and in order
    # puts "Level order: #{test.level_order}"
    # puts "Preorder: #{test.preorder}"
    # puts "Postorder: #{test.postorder}"
    # puts "Inorder: #{test.inorder}"
# 4. try to unbalance the tree by adding several numbers > 100
    test.insert(104)
    test.insert(106)
    test.insert(107)
    test.insert(108)
    test.insert(115)
    test.insert(120)
    # test.print_tree
    # test.inorder
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
    test.balanced?
    # test.print_tree
    # test.find(106)
# 6. Balance the tree by calling `#rebalance`
# 7. Confirm that the tree is balanced by calling `#balanced?`
# 8. Print out all elements in level, pre, post, and in order