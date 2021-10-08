
//  Successor: Write an algorithm to find the "next" node (i.e., in-order successor) of a given node in a binary search tree. You may assume that each node has a link to its parent.

public class BinaryTreeNodeWithParent {
    let value: Int
    public var left: BinaryTreeNodeWithParent?
    public var right: BinaryTreeNodeWithParent?
    public var parentNode: BinaryTreeNodeWithParent?
    
    public init(_ value: Int) {
        self.value = value
    }
}

//BigO: time: O(n) space: O(H)
public func successor(of node: BinaryTreeNodeWithParent?) {
    if node == nil { return }
    let rootNode = findRoot(of: node)
    inOrderTraverse(rootNode, node)
}

func findRoot(of node: BinaryTreeNodeWithParent?) -> BinaryTreeNodeWithParent? {
    var node = node
    while node?.parentNode != nil {
        node = node?.parentNode
    }
    return node
}

var printNext = false
func inOrderTraverse(_ root: BinaryTreeNodeWithParent?, _ givenNode: BinaryTreeNodeWithParent?) {
    if root == nil || givenNode == nil { return }
    inOrderTraverse(root?.left, givenNode)
    if printNext {
        print(root?.value)
        printNext = false
    }
    if root === givenNode {
        printNext = true
    }
    inOrderTraverse(root?.right, givenNode)
}
