//  
//  One Away: There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.
//  EXAMPLE
//  pal, pale -> true 
//  spale, pale -> true 
//  pale, bale -> true 
//  pale, bake -> false
//  

// Algorithm: 
// check the length of two strings -> diff > 1 -> false -> diff <=1 -> then insert, replace or delete
// diff == 1 -> loop through small string and see if is a substring of large one -> O(n^2)
// diff == 0 -> loop throgh one string and see if does not differ more than one char -> O(n^2)
// Complexity: time: O(n) space: O(1)


public func oneAway(str1: String, str2: String) -> Bool {
    let diff = findLengthDiff(str1: str1, str2: str2)
    guard diff <= 1 else { return false }
    if diff == 0 { return areStringsOneReplaceAway(str1: str1, str2: str2) }
    return str1.count > str2.count ? areStringsOneEditAway(largeString: str1, smallString: str2) : areStringsOneEditAway(largeString: str2, smallString: str1)
}

private func findLengthDiff(str1: String, str2: String) -> Int {
    return abs(str1.count - str2.count)
}

private func areStringsOneReplaceAway(str1: String, str2: String) -> Bool {
    var diffCount = 0
    for i in 0..<str1.count {
        let index1 = str1.index(str1.startIndex, offsetBy: i)
        let index2 = str2.index(str2.startIndex, offsetBy: i)
        if str1[index1] != str2[index2] {
            diffCount += 1
            if diffCount > 1 {
                return false
            }
        }
    }
    return true
}

//  pal, epal -> true 
private func areStringsOneEditAway(largeString: String, smallString: String) -> Bool {
    var diffCount = 0
    var i = 0
    var j = 0
        while(i < smallString.count && j < largeString.count) {
            var index1 = smallString.index(smallString.startIndex, offsetBy: i)
            var index2 = largeString.index(largeString.startIndex, offsetBy: j)
            if smallString[index1] != largeString[index2] {
                diffCount += 1
                if diffCount > 1 {
                    return false
                }
                j += 1
                index2 = largeString.index(largeString.startIndex, offsetBy: j)
            } else {
                j += 1
                i += 1
            }
        }
    return true
}
