//  
//  Minimal Tree: Given a sorted (increasing order) array with unique integer elements, write an algo­
//  rithm to create a binary search tree with minimal height.
//  
//  
//  To create a tree of minimal height, we need to match the number of nodes in the left subtree to the number of nodes in the right subtree as much as possible. This means that we want the root to be the middle of the array, since this would mean that half the elements would be less than the root and half would be greater than it.
//  We proceed with constructing our tree in a similar fashion. The middle of each subsection of the array becomes the root of the node. The left half of the array will become our left subtree, and the right half of the array will become the right subtree.

// BigO: time O(n) space: O(logn) recursive stack
public func cosntructBST(array: [Int]) -> BinaryTreeNode? {
    return constructBST(array: array, start: 0, end: array.count - 1)
}


func constructBST(array: [Int], start: Int, end: Int) -> BinaryTreeNode? {
    if end < start { return nil }
    let mid = (start + end) / 2
    let node = BinaryTreeNode(array[mid])
    node.left = constructBST(array: array, start: start, end: mid - 1)
    node.right = constructBST(array: array, start: mid + 1, end: end)
    return node
}
