//  
//  Partition: Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
//  EXAMPLE
//  Input: 3 -> 2 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1[partition=5] Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
//  

//BigO: time: O(n) space: O(1)
//ANotherway would be to create two seperate lists with less and greater than partition and merge them... would require more space
public func partition(head: LinkedList.Node?, value: Int) -> LinkedList.Node? {
    var node = head?.next
    var previous = head
    var newHead = head
    
    while node != nil {
        if node!.value < value {
            previous?.next = node?.next
            let newNode = LinkedList.Node(value: node!.value)
            newNode.next = newHead
            newHead = newNode
        } else {
            previous = node
        }
        node = node?.next
    }
    return newHead
}
