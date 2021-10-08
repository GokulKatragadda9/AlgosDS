//  
//  Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
//  EXAMPLE
//  lnput:the node c from the linked lista->b->c->d->e->f
//  Result: nothing is returned, but the new linked list looks likea->b->d->e- >f
//  
// BigO: time: O(n) space: O(1)

public extension LinkedList {
    func deleteMiddleNode(node: LinkedList.Node) {
        var middleNode: LinkedList.Node? = node
        var previous: LinkedList.Node? = node
        while(middleNode!.next != nil) {
            previous = middleNode
            middleNode?.value = middleNode!.next!.value
            middleNode = middleNode?.next
        }
        previous?.next = nil
    }
}

