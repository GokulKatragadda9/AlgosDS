//  
//  Queue via Stacks: Implement a MyQueue class which implements a queue using two stacks.
//  

public class QueueWithStacks {
    let newStack = Stack<Int>()
    let oldStack = Stack<Int>()
    
    public init() {}
    
    public func push(_ value: Int) {
        newStack.push(value)
    }
    
    public func pop() -> Int? {
        if oldStack.isEmpty {
            switchFromNewToOld()
        }
        return oldStack.pop()
    }
    
    public func peek() -> Int? {
        if oldStack.isEmpty {
            switchFromNewToOld()
        }
        return oldStack.peek()
    }
    
    func switchFromNewToOld() {
        while(!newStack.isEmpty) {
            oldStack.push(newStack.pop()!)
        }
    }
}
