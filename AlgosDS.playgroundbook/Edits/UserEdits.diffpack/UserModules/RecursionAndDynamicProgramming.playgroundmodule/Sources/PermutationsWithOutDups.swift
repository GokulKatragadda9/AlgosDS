//  8.7 Permutations without Dups: Write a method to compute all permutations of a string of unique characters.


// Compelxity: greater than O(n!)

public func permutationsWithOutDups(str: String) -> [String] {
    var str = str
    if str.count == 1 {
        return [str]
    }
    let lastChar = str.removeLast()
    let allPermutations = permutationsWithOutDups(str: str) 
    
    let newP = allPermutations.flatMap({ permutation -> [String] in
        return appendAllPossibleWays(char: lastChar, to: permutation)
    })
    return newP
}

private func appendAllPossibleWays(char: Character, to str: String) -> [String] {
    var permutations = [String]()
    for i in 0...str.count {
        var mutatingStr = str
        let index = mutatingStr.index(mutatingStr.startIndex, offsetBy: i)
        mutatingStr.insert(char, at: index)
        permutations.append(mutatingStr)
    }
    return permutations
}


public func permutationsWithOutDups2(str: String) -> [String] {
    if str.count == 1 {
        return [str]
    }
    var allPermutations = [String]()
    for i in 0..<str.count {
        var string = str
        let index = string.index(string.startIndex, offsetBy: i)
        let char = string.remove(at: index)
        let permutations = permutationsWithOutDups2(str: string).map({ permutation -> String in
            var mutatingPermutation = permutation
            mutatingPermutation.insert(char, at: mutatingPermutation.startIndex)
            return mutatingPermutation
        })
        allPermutations.append(contentsOf: permutations)
    }
    return allPermutations
}
