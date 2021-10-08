//  
//  Triple Step: A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible ways the child can run up the stairs.
//  
// we just need to count the total of number of ways to get to last 3 steps from n
// count(n-1) + count(n-2) + count(n-3)

import Foundation

//time for 25 steps: 17sec time comlexit: O(3^n) space: height of call stack tree
public func tripleStepCountToReachWithOutMemoization(steps: Int) -> Int {
    if steps == 0 { return 0 }
    if steps == 1 { return 1 }
    if steps == 2 { return 2 }
    if steps == 3 { return 4 }
    return tripleStepCountToReachWithOutMemoization(steps: steps - 1) + tripleStepCountToReachWithOutMemoization(steps: steps - 2) + tripleStepCountToReachWithOutMemoization(steps: steps - 3)
}

class Cache {
    var dict = Dictionary<Int, Int>()
}

//top down approach with memoization O(n) 
public func tripleStepCountToReachWithMemoization(steps: Int) -> Int {
    var cache = Cache()
    cache.dict[0] = 0
    cache.dict[1] = 1
    cache.dict[2] = 2
    cache.dict[3] = 4
    return tripleStepCountToReach(steps: steps, cache)
}

func tripleStepCountToReach(steps: Int, _ cache: Cache) -> Int {
    if cache.dict[steps] == nil {
        cache.dict[steps] = tripleStepCountToReach(steps: steps - 1, cache) + tripleStepCountToReach(steps: steps - 2, cache) + tripleStepCountToReach(steps: steps - 3, cache)
    }
    return cache.dict[steps]!
}

//bottom up approach
public func tripleStepCountToReachBottomUp(steps: Int) -> Int {
    var a = 1
    var b = 2
    var c = 4
    var count = 0
    
    for i in 4 ... steps {
        count = a + b + c
        a = b
        b = c
        c = count
    }
    return count
}

