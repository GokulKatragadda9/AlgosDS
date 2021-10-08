//  
//  Boolean Evaluation: Given a boolean expression consisting of the symbols 0 (false), 1 (true), & (AND), I (OR), and /\ (XOR), and a desired boolean result value result, implement a function to count the number of ways of parenthesizing the expression such that it evaluates to result.
//  EXAMPLE
//  countEval("l /\01011", false) -> 2 countEval("0&0&0&1/\ll0", true) -> 10
//  

import Foundation

extension String {
    var boolValue: Bool {
        return (self as NSString).boolValue
    }
}

public func booleanEvaluation(_ expression: String, _ result: Bool, _ dict: inout Dictionary<String, Int>) -> Int {
    if expression.count == 0 { return 0 }
    if expression.count == 1 {
        return expression.boolValue == result ? 1 : 0
    }
    if let count = dict[expression + "\(result)"] {
        return count
    }
    var ways = 0
    var i = 1
    while i < expression.count {
        let left = String(expression.prefix(upTo: expression.index(expression.startIndex, offsetBy: i)))
        let right = String(expression.suffix(from: expression.index(expression.startIndex, offsetBy: i + 1)))
        let leftTrue = booleanEvaluation(left, true, &dict)
        let rightTrue = booleanEvaluation(right, true, &dict)
        let leftFalse = booleanEvaluation(left, false, &dict)
        let rightFalse = booleanEvaluation(right, false, &dict)
        let total = (leftTrue + leftFalse) * (rightTrue + rightFalse)
        
        let operatorIndex = expression.index(expression.startIndex, offsetBy: i)
        let operatorChar = expression[operatorIndex]
        
        var totalTrue = 0
        switch operatorChar {
        case "&":
            totalTrue += leftTrue * rightTrue
        case "|":
            totalTrue += leftTrue * rightTrue +
                leftTrue * rightFalse +
                leftFalse * rightTrue
        case "^":
            totalTrue += leftTrue * rightFalse  + leftFalse * rightTrue
        default: 
            break
        }
        i = i + 2
        ways += result ? totalTrue : total - totalTrue
    }
    dict[expression + "\(result)"] = ways
    return ways
}


