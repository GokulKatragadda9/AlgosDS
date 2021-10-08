
//  10.2 Group Anagrams: Write a method to sort an array ot strings so that all tne anagrnms are next to
//  each other.
//  Well, anagrams are words that have the same characters but in different orders. 

//WIP

public func groupAnagrams(arr: [String]) -> [String] {
    return arr.sorted(by: { s1, s2 in 
        return areAnagrams(s1, s2)
    })
}

private func areAnagrams(_ s1: String, _ s2: String) -> Bool {
    return s1.sorted() != s2.sorted()
}
