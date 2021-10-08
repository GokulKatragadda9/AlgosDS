//  
//  Palindrome: Implement a function to check if a linked list is a palindrome.
//  2 3 4 3 2

public extension LinkedList {
    //BigO: time- O(n^2) space: O(1)
    func isPalindrome1() -> Bool {
        var counter = count()/2
        var node = getHead()
        var count = 1
        
        while counter > 0 {
            let valueFromLast = kthToLast(k: count)
            if (node?.value != valueFromLast) {
                return false
            }
            counter -= 1
            count += 1
            node = node?.next
        }
        return true
    }
    
    //BigO: time- O(n) space: O(n)
    func isPalindrome2() -> Bool {
        let reversedHead = reverse()
        let head = getHead()
        return isEqual(first: head, second: reversedHead)
    }
    
    //2 2
    //BigO: time- O(n) space: O(n/2)
    func isPalindrome() -> Bool {
        var array = [Int]()
        var slowRunner = getHead()
        var fastRunner = getHead()
        
        guard slowRunner != nil, fastRunner != nil else { return  false }
        
        while(fastRunner?.next != nil) {
            array.append(slowRunner?.value ?? 0)
            slowRunner = slowRunner?.next
            fastRunner = fastRunner?.next?.next
        }
        
        if (fastRunner != nil) {
            slowRunner = slowRunner?.next
        } 
        
        while(slowRunner != nil) {
            if array.removeLast() != slowRunner?.value {
                return false
            }
            slowRunner = slowRunner?.next
        }
        return true
    }
    
    // 2 3 4 5 6  ->  6 5 4 3 2
    //BigO: time: O(n) space: O(n)
    func reverse1() -> LinkedList.Node? {
        var node = getHead()
        var head: LinkedList.Node? = nil
        
        guard node != nil else { return nil }
        
        while(node != nil) {
            let newNode = Node(value: node!.value)
            newNode.next = head
            head = newNode
            node = node?.next
        }
        return head
    }
    
    func reverse() -> LinkedList.Node? {
        var previous: LinkedList.Node? = nil
        var current = getHead()
        var next = current?.next
        
        while(next != nil) {
            current?.next = previous
            previous = current
            current = next
            next = next?.next
        }
        current?.next = previous
        return current
    }
    
    //BigO: time: O(n) space: O(1)
    func isEqual(first: LinkedList.Node?, second: LinkedList.Node?) -> Bool {
        var head1 = first
        var head2 = second
        guard head1 != nil, head2 != nil else { return false }
        while(head1 != nil && head2 != nil) {
            if(head1?.value != head2?.value) {
                return false
            }
            head1 = head1?.next
            head2 = head2?.next
        }
        return true
    }
}

public func reverseRecursive(node: LinkedList.Node?) -> LinkedList.Node? {
    if node == nil { return nil }
    let head = reverseRecursive(node: node?.next)
    if head == nil {
        return node
    }
    node?.next = nil
    return addToTail(head: head, node: node)
}

public func addToTail(head: LinkedList.Node?, node: LinkedList.Node?) -> LinkedList.Node? {
    guard head != nil else { return node }
    var temp = head
    while(temp?.next != nil) {
        temp = temp?.next
    }
    temp?.next = node
    return head
}
