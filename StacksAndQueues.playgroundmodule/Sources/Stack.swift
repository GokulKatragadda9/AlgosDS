
// Stack using LinkedList

// Push: O(1)
// Peek: O(1)
// Pop: O(1)

//Last In First Out
//  4 5


public class Stack<T> where T: CustomStringConvertible, T: Comparable {
    var head: StackNode<T>?
    public private(set) var count = 0
    
    public class StackNode<T> {
        let value: T
        var next: StackNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public init() {}
    
    public func push(_ value: T) {
        count += 1
        if head == nil {
            head = StackNode(value: value)
            return
        }
        let newNode = StackNode(value: value)
        newNode.next = head
        head = newNode
    }
    
    public func pop() -> T? {
        guard !isEmpty else { return nil }
        count -= 1
        let value = head?.value
        head = head?.next
        return value
    }
    
    public func peek() -> T? {
        guard !isEmpty else { return nil }
        return head?.value
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var description: String {
        var str = ""
        while(head != nil) {
            str.append(head?.value.description ?? "")
            str.append(" ")
            head = head?.next
        }
        return str
    }
}
