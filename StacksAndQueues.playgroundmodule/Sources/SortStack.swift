//  
//  Sort Stack: Write a program to sort a stack such that the smallest items are on the top. You can use an additional temporary stack, but you may not copy the elements into any other data structure (such as an array). The stack supports the following operations: push, pop, peek, and isEmpty.
//  BigO: time: O(n^2) space: O(n)

public func sortStack(stack: Stack<Int>) {
    let newStack = Stack<Int>()
    
    while(!stack.isEmpty) {
        let temp = stack.pop()
        while (!newStack.isEmpty && newStack.peek()! > temp!) {
            stack.push(newStack.pop()!)
        }
        newStack.push(temp!)
    }
    
    while !newStack.isEmpty {
        stack.push(newStack.pop()!)
    }
}
