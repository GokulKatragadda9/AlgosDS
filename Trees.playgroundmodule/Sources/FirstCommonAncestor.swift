//  
//  First Common Ancestor: Design an algorithm and write code to find the first common ancestor of two nodes in a binary tree. Avoid storing additional nodes in a data structure. NOTE: This is not necessarily a binary search tree.
//  

//BigO: time - O(n) space- O(h)
public func findFirstCommonAncestor(node1: BinaryTreeNodeWithParent?, node2: BinaryTreeNodeWithParent?) -> BinaryTreeNodeWithParent? {
    let depthOfNode1 = depthOfNode(node1)
    let depthOfNode2 = depthOfNode(node2)
    //find the diff of heights and route from lowest node to diff levels up 
    let diff = abs(depthOfNode1 - depthOfNode2) ?? 0
    if diff == 0 {
        return firstCommonAncestorForSameLevelNodes(node1: node1, node2: node2)
    } else if diff > 0 && depthOfNode1 > depthOfNode2 {
        let newNode = traverseUp(from: node1, levelCount: diff)
        return firstCommonAncestorForSameLevelNodes(node1: newNode, node2: node2)
    } else {
        let newNode = traverseUp(from: node2, levelCount: diff)
        return firstCommonAncestorForSameLevelNodes(node1: node1, node2: newNode)
    }
}

func traverseUp(from node: BinaryTreeNodeWithParent?, levelCount: Int) -> BinaryTreeNodeWithParent? {
    var node = node 
    var count = levelCount
    while count > 0 {
        node = node?.parentNode
        count -= 1
    }
    return node
}

func firstCommonAncestorForSameLevelNodes(node1: BinaryTreeNodeWithParent?, node2: BinaryTreeNodeWithParent?) -> BinaryTreeNodeWithParent? {
    var node1 = node1
    var node2 = node2
    while node1?.parentNode != nil && node2?.parentNode != nil {
        node1 = node1?.parentNode
        node2 = node2?.parentNode
        if node1 === node2 { return node1 }
    }
    return nil
}
