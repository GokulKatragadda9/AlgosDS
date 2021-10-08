
//  Stack of Plates: Imagine a (literal) stack of plates. If the stack gets too high, it might topple.
//  Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOfStacks that mimics this. SetO-fStacks should be composed of several stacks and should create a new stack once the previous one exceeds capacity. SetOfStacks. push() and SetOfStacks. pop() should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack).
//  FOLLOW UP
//  Implementafunction popAt(int index) which performs a pop operation on a specific sub-stack.
//  


public class SetOfStacks<T> where T: CustomStringConvertible, T: Comparable {
    private var array = [Stack<T>()]
    public init() {}
    public func push(_ value: T) {
        if (array[array.count - 1].isFull) {
            array.append(Stack<T>())
        }
        print(value)
        array[array.count - 1].push(value)
    }
    
    public func pop() -> T? {
        let value = array[array.count - 1].pop()
        if(array[array.count - 1].isEmpty) {
            array.removeLast()
        }
        return  value
    }
    
    public func pop(index: Int) -> T? {
        guard index < array.count else { return nil }
        let value =  array[index].pop()
        if(array[index].isEmpty) {
            array.remove(at: index)
        }
        return  value
    }
    
    public func peek() -> T? {
        return array[array.count - 1].peek()
    }
}

extension Stack {
    var isFull: Bool {
        return count == 3
    }
}
