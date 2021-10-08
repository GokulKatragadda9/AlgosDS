
// Queue.swift

//  5 4 3 2 1

public class Queue<T> {
    public class QueueNode<T> {
        let value: T
        var next: QueueNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public init() {}
    
    var head: QueueNode<T>?
    var tail: QueueNode<T>?
    
    //O(1)
    public func push(_ value: T) {
        if head == nil {
            head = QueueNode(value: value)
            tail = head
            return
        }
        tail?.next = QueueNode(value: value)
        tail = tail?.next
    }
    
    //O(1)
    public func next() -> T? {
        if head === tail {
            tail = nil
        }
        let node = head
        head = head?.next
        return node?.value
    }
    
    public func peek() -> T? {
        return head?.value
    }
    
    //O(1)
    public func isEmpty() -> Bool {
        return head === tail && head == nil
    }
}
