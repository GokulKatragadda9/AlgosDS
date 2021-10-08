
// Check Permutation: Given two strings,write a method to decide if one is a permutation of the other.


//Brute-force: finding all permutations of str1 and comparing with str2.
//BigO: Time: O(n!) Space: O(1)
//Best: store the chars and count in a dictionary. iterate the other string and update the count of the chars in the dictionary.
//Another way simple: Sort the strings and see if they are equal : O(nlogn)
//BigO: Time: O(n) Space: O(n)
//Questions: Caps vs small, white spaces ignore?
//Assumptions: 
// str1: hannah
// str2: annahh
// same lengths else retun false

public func checkPermutation(str1: String, str2: String) -> Bool {
    var dict = Dictionary<Character, UInt>()
    
    if str1.count != str2.count { return false }
    
    for char in str1 {
        var count = dict[char] ?? 0
        dict[char] = count + 1
    }
    
    for char in str2 {
        var count = dict[char] ?? 0
        if count == 0 { return false }
        dict[char] = count - 1
    }
    
    return true
}

public func checkPermutationBySort(str1: String, str2: String) -> Bool {
    if str1.count != str2.count { return false }
    let sorted1 = str1.sorted()
    let sorted2 = str2.sorted()
    
    return sorted1 == sorted2
}
