//  
//  Paths with Sum: You are given a binary tree in which each node contains an integer value (which might be positive or negative). Design an algorithm to count the number of paths that sum to a given value. The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//  


public func countPaths(node: BinaryTreeNodeWithParent?, targetSum: Int) -> Int {
    return paths(node: node, runningSum: 0, hash: Dictionary<Int, Int>(), targetSum: targetSum)
}

private func paths(node: BinaryTreeNodeWithParent?, runningSum: Int, hash: Dictionary<Int, Int>, targetSum: Int) -> Int {
    if node == nil { return 0 }
    var runningS = runningSum + (node?.value ?? 0)
    var sum = runningS - targetSum
    var dict = hash
    var total = dict[sum] ?? 0
    
    if runningS == targetSum {
        total += 1
    }
    
    dict[runningS] = (dict[runningS] ?? 0) + 1
    total += paths(node: node?.left, runningSum: runningS, hash: dict, targetSum: targetSum)
    total += paths(node: node?.right, runningSum: runningS, hash: dict, targetSum: targetSum)
    dict[runningS] = (dict[runningS] ?? 0) - 1
    return total
}
