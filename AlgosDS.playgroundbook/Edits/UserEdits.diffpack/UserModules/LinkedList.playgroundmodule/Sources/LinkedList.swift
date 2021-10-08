
public class LinkedList {
    public class Node {
        public var value: Int
        public var next: Node?
        
        public init(value: Int) {
            self.value = value
        }
    }
    
    private var head: Node?
    
    public init() {}
    
    //BigO: time: O(n) space: O(1)
    public func count() -> Int {
        var count = 0
        var node = head
        
        while node != nil {
            count += 1
            node = node?.next
        }
        return count
    }
    
    //BigO: time: O(1) space: O(1)
    public func getHead() -> Node? {
        return head
    }
    
    //BigO: time: O(n) space: O(1)
    public func getTail() -> Node? {
        var node = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        return node
    }
    
    //BigO: time: O(n) space: O(1)
    public func insert(value: Int) {
        guard let tail = getTail() else {
            head = Node(value: value)
            return
        }
        tail.next = Node(value: value)
    }
    
    //BigO: time: O(n) space: O(1)
    public func getNode(at position: Int) -> Node? {
        guard position >= 0 else { return nil }
        var node = head
        var count = position 
        
        while count > 0 {
            node = node?.next
            count -= 1
        }
        
        return node
    }
    
    //BigO: time: O(n) space: O(1)
    public func insert(value: Int, at position: Int) {
        guard position >= 0 else { return }
        if position == 0 {
            var node = head
            head = Node(value: value)
            head?.next = node
            return
        }
        guard let node = getNode(at: position - 1) else { return }
        node.next = Node(value: value)
    }
    
    public func isEmpty() -> Bool {
        return count() == 0
    }
}


extension LinkedList: CustomStringConvertible {
    public var description: String {
        var node = head
        var str = ""
        while node != nil {
            str += (node?.description ?? "") + " -> "
            node = node?.next
        }
        str += "nil"
        return str
    }
}


extension LinkedList.Node: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}
