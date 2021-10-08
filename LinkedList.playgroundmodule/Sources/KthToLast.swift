//  
//  Return Kth to Last: Implement an algorithm to find the kth to last element of a singly linked list.
//  


public extension LinkedList {
    //BigO: time: O(n) space: O(1)
    func kthToLast(k: Int) -> Int? {
        let length = count()
        guard k <= length else { return nil }
        let index = length - k
        return getNode(at: index)?.value
    }
    
    func kthToLastRecursive(head: Node?, k: Int) -> Int? {
        if(head == nil) {
            return nil
        }
        var index = kthToLastRecursive(head: head?.next, k: k) ?? 0 + 1
        if index == k {
            return head?.value
        }
        return index
    }
}
