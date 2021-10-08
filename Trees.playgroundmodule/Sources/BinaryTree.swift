//        1
//      2    3
//    7  8  9  10
//  3  4
//  
//  

import StacksAndQueues

public class BinaryTreeNode {
    public let value: Int
    public var left: BinaryTreeNode?
    public var right: BinaryTreeNode?
    public init(_ value: Int) {
        self.value = value
    }
}

//  BigO: time: O(n) space: O(H)
public func inOrderTraversal(_ root: BinaryTreeNode?) {
    if root == nil {
        return
    }
    inOrderTraversal(root?.left) 
    print(root?.value ?? "")
    inOrderTraversal(root?.right)
}

//  BigO: time: O(n) space: O(H)
public func preOrderTraversal(_ root: BinaryTreeNode?) {
    if root == nil {
        return
    }
    print(root?.value ?? "")
    preOrderTraversal(root?.left)
    preOrderTraversal(root?.right)
}

//  BigO: time: O(n) space: O(H)
public func postOrderTraversal(_ root: BinaryTreeNode?) {
    if root == nil {
        return
    }
    postOrderTraversal(root?.left) 
    postOrderTraversal(root?.right)
    print(root?.value ?? "")
}

//BIgO: time: O(n) space: O(n)
public func levelOrderTraversal(_ root: BinaryTreeNode?) {
    let queue = Queue<BinaryTreeNode?>()
    queue.push(root)
    while(!queue.isEmpty()) {
        let node = queue.next()
        print(node??.value)
        if(node??.left != nil) {
            queue.push(node??.left)
        }
        if(node??.right != nil) {
            queue.push(node??.right)
        }
    }
}

//  BigO: time: O(n) space: O(H)
public func heightOfNode(_ root: BinaryTreeNode?) -> Int {
    if root == nil { return -1 }
    let left = heightOfNode(root?.left)
    let right = heightOfNode(root?.right)
    return max(left, right) + 1
}

public func heightOfNode(_ root: BinaryTreeNodeWithParent?) -> Int {
    if root == nil { return -1 }
    let left = heightOfNode(root?.left)
    let right = heightOfNode(root?.right)
    return max(left, right) + 1
}

//  BigO: time: O(n) space: O(H)
public func depthOfNode(_ root: BinaryTreeNode?, _ node: BinaryTreeNode?) -> Int? {
    if root == nil || node == nil { return -1 }
    return heightOfNode(root) - heightOfNode(node)
}

public func depthOfNode(_ node: BinaryTreeNodeWithParent?) -> Int {
    var node = node
    if node == nil { return -1 }
    var depth = 0
    while node?.parentNode != nil {
        node = node?.parentNode
        depth += 1
    }
    return depth
}

enum TreeError: Error {
    case NotBalanced
}

func checkHeight(_ root: BinaryTreeNode?) throws -> Int {
    if root == nil { return -1 }
    let left = heightOfNode(root?.left)
    let right = heightOfNode(root?.right)
    let diff = abs(left - right)
    if diff > 1 {
        throw TreeError.NotBalanced
    }
    return max(left, right) + 1
}

//BigO: time: O(n) space: O(H) H is height of tree
public func isBalancedTree(_ root: BinaryTreeNode?) -> Bool {
    if root == nil { return false }
    do {
        let height = try checkHeight(root)
    } catch {
        return false
    }
    return true
}
