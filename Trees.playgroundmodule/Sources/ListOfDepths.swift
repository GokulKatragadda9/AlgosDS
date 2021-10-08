//  
//  List of Depths: Given a binary tree, design an algorithm which creates a linked list of all the nodes
//  at each depth (e.g., if you have a tree with depth D, you'll have D linked lists).
//  

import StacksAndQueues

private class LinkedList<T> {
    class Node<T> {
        public let value: T
        public var next: Node<T>?
        init(value: T) {
            self.value = value
        }
    }
    var head: Node<T>?
    
    func getTail() -> Node<T>? {
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        return node
    }
    
    //BigO: time: O(n) space: O(1)
    func insert(value: T) {
        guard let tail = getTail() else {
            head = Node(value: value)
            return
        }
        tail.next = Node(value: value)
    }
    
    var isEmpty: Bool {
        return head == nil
    }
}

//BIgO: time: O(n) touching the nodes once space: O(n) return linkedlists with total n nodes
private func listOfDepths(root: BinaryTreeNode?) -> [LinkedList<BinaryTreeNode>] {
    guard let rootNode = root else { return [] }
    var lists: [LinkedList<BinaryTreeNode>] = []
    var current = LinkedList<BinaryTreeNode>()
    current.insert(value: rootNode)
    
    while(!current.isEmpty) {
        lists.append(current)
        var parentNode = current.head
        current = LinkedList()
        
        while parentNode != nil {
            if let leftNode = parentNode!.value.left {
                current.insert(value: leftNode)
            }
            if let rightNode = parentNode!.value.right {
                current.insert(value: rightNode)
            }
        }
        parentNode = parentNode?.next
    }
    return lists
}
