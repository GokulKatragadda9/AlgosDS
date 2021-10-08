
//  Three in One: Describe how you could use a single array to implement three stacks.

public enum ThreeStacks {
    case first
    case second
    case third
    
    var startIndex: Int {
        switch self {
        case .first:
            return 0
        case .second:
            return 10
        case .third:
            return 20
        }
    }
    
    var endIndex: Int {
        switch self {
        case .first:
            return 9
        case .second:
            return 19
        case .third:
            return 29
        }
    }
}
    
public class ThreeInOne {
    var array = Array(repeating: 0, count: 30)
    var firstStackCurrentIndex: Int? = nil
    var secondStackCurrentIndex: Int? = nil  
    var thirdStackCurrentIndex: Int? = nil
    
    public init() {}
    
    private func getCurrentIndex(stack: ThreeStacks) -> Int? {
        switch stack {
        case .first:
            return firstStackCurrentIndex
        case .second:
            return secondStackCurrentIndex
        case .third:
            return thirdStackCurrentIndex
        }
    }
    
    private func setCurrentIndex(stack: ThreeStacks, value: Int?) {
        switch stack {
        case .first:
            firstStackCurrentIndex = value
        case .second:
            secondStackCurrentIndex = value
        case .third:
            thirdStackCurrentIndex = value 
        }
    }
    
    public func push(value: Int, stack: ThreeStacks) {
        var index = getCurrentIndex(stack: stack)
        if index == nil {
            index = stack.startIndex
        } else {
            index! += 1
        }
        guard index! <= stack.endIndex else { return }
        array[index!] = value
        setCurrentIndex(stack: stack, value: index)
    }
    
    public func pop(from stack: ThreeStacks) -> Int? {
        guard let index = getCurrentIndex(stack: stack) else { return nil } 
        let value = array[index]
        array[index] = 0
        print("\(index) \(value)")
        if(index == stack.startIndex) {
            setCurrentIndex(stack: stack, value: nil)
        } else {
            setCurrentIndex(stack: stack, value: index - 1)
        }
        return value
    }
    
    public func peek(from stack: ThreeStacks) -> Int? {
        guard let index = getCurrentIndex(stack: stack) else { return nil } 
        return array[index]
    }
    
    public func isEmpty(stack: ThreeStacks) -> Bool {
        return getCurrentIndex(stack: stack) == nil
    }
}
