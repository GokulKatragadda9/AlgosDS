//  
//  Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palin­ drome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
//  EXAMPLE
//  Input: Tact Cao
//  Output: True (permutations: "taco cat", "atco eta", etc.)

//Brute-Force: Find all permutations and check if every one is palindrome
//BigO: O(n!) space: O(n)

//1: Palindrome: even count: all char should be two count; odd count: all char except one should be two count
//BigO: O(n) space: O(n)

//2. Sort the string, aacctto
//BigO: O(nlogn) space: O(1)

//Ignore white spaces

public func palindromePermutation(str: String) -> Bool {
    if str.isEmpty { return false }
    
    // find char counts
    var dict = Dictionary<Character, UInt>()
    for char in str {
        var count = dict[char] ?? 0
        dict[char] = count + 1
    }
    
    // count of char whose value is not 2 (ignore white space)
    var charCount = 0
    for key in dict.keys {
        if key == " " { continue }
        let count = dict[key]
        if(count != 2) { charCount += 1 }
    }
    
    return charCount <= 1
}
