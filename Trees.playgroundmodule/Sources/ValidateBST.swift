//  
//  Validate BST: Implement a function to check if a binary tree is a binary search tree.
//  

// A binary tree is a BST if left nodes <= root < right nodes

//              7 
//         4          9
//       2     5    8   10  
//    1    3  4  6

// BigO: time: O(n) space: O(logn) recursive calls in stack
public func validateBST(root: BinaryTreeNode?, min: Int?, max: Int?) -> Bool {
    if root == nil { return true }
    
    if let max = max, root!.value > max {
        return false
    }
    
    if let min = min, root!.value <= min {
        return false
    }
    
    guard validateBST(root: root?.left, min: min, max: root?.value) else { return false }
    guard validateBST(root: root?.right, min: root?.value, max: max) else { return false }
    return true
} 


//  let root = BinaryTreeNode(7)
//  let node1 = BinaryTreeNode(4)
//  let node2 = BinaryTreeNode(9)
//  let node3 = BinaryTreeNode(2)
//  let node4 = BinaryTreeNode(5)
//  let node5 = BinaryTreeNode(8)
//  let node6 = BinaryTreeNode(10)
//  let node7 = BinaryTreeNode(1)
//  let node8 = BinaryTreeNode(3)
//  let node9 = BinaryTreeNode(5)
//  let node10 = BinaryTreeNode(6)
//  
//  
//  root.left = node1
//  root.right = node2
//  
//  node1.left = node3
//  node1.right = node4
//  
//  node2.left = node5
//  node2.right = node6
//  
//  node3.left = node7
//  node3.right = node8
//  
//  node4.left = node9
//  node4.right = node10
//  
//  
//  print(validateBST(root: root, min: nil, max: nil))
