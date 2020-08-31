require_relative 'bst'

test = Tree.new([1,5,9,13,17,21,25,29,33,37])

#  test.print_tree
# p test.level_order
# => [21, 9, 33, 5, 17, 29, 37, 1, 13, 25]
p test.inorder
# => [1, 5, 9, 13, 17, 21, 25, 29, 33, 37]
