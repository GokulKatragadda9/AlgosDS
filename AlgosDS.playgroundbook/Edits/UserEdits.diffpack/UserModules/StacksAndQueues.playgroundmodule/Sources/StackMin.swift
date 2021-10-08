//  
//  Stack Min: How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop and min should all operate in 0(1) time.
//  min: O(1)


public class StackMin<T> where T: CustomStringConvertible, T: Comparable {
    var stack = Stack<T>()
    var minStack = Stack<T>()
    
    public init() {}
    
    //BigO: O(1)
    public var min: T? {
        return minStack.peek()
    }
    
    public func push(_ value: T) {
        stack.push(value)
        pushMinimumIfNeeded(value)
    }
    
    public func pop() -> T? {
        let value = stack.pop()
        guard value != nil else { return nil }
        popMinimumIfNeeded(value!)
        return value
    }
    
    public func peek() -> T? {
        return stack.peek()
    }
    
    private func pushMinimumIfNeeded(_ value: T) {
        guard let currentMin = minStack.peek() else { 
            minStack.push(value)
            return
        }
        if value <= currentMin {
            minStack.push(value)
        }
    }
    
    private func popMinimumIfNeeded(_ value: T) {
        guard let currentMin = minStack.peek() else { 
            return
        }
        if value == currentMin {
            minStack.pop()
        }
    }
}
