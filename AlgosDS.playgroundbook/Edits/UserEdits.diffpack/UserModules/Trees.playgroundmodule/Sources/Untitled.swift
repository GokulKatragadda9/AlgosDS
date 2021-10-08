//  
//  Check Subtree: Tl and T2 are two very large binary trees, with Tl much bigger than T2. Create an
//  algorithm to determine if T2 is a subtree of Tl.
//  A tree T2 is a subtree of Tl if there exists a node n in Tl such that the subtree of n is identical to T2. That is, if you cut off the tree at node n, the two trees would be identical.
//  

//traverse through t1 and if any node is identical to t2 root then traverse through the subtree of t1 and t2 to see if they are identical and return if they are not.

//Complexity: time- O(nm) space: O(logn) + O(logm) worst case but not average case. Space complexity is imp  for large trees with millions of nodes.
public func checkSubTree(t1: BinaryTreeNodeWithParent?, isSubTreeOf t2: BinaryTreeNodeWithParent?) -> Bool {
    if t1 == nil || t2 == nil { return false }
    if t1 === t2 && matchTree(node1: t1, node2: t2) { return true }
    return checkSubTree(t1: t1, isSubTreeOf: t2?.left) || checkSubTree(t1: t1, isSubTreeOf: t2?.right)
}

private func matchTree(node1: BinaryTreeNodeWithParent?, node2: BinaryTreeNodeWithParent?) -> Bool {
    if node1 == nil && node2 == nil { return true }
    if node1 !== node2 { return false }
    return matchTree(node1: node1?.left, node2: node2?.left) && matchTree(node1: node1?.right, node2: node2?.right)
}
