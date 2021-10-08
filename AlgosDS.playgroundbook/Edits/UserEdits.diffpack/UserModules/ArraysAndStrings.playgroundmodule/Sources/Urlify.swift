//  
//  URLify: Write a method to replace all spaces in a string with '%20'. You may assume that the string has sufficient space at the end to hold the additional characters,and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)


// Brute-force: Find all white spaces and replace with new string 
// BigO: O(n + w) space: O(w)
// what the fudge

public func urlify(str: String) -> String {
    
    //find the white space indexes
    var indexes = Array<Int>()
    for (index, char) in str.enumerated() {
        if char == " " {
            indexes.append(index)
        }
    }
    
    //replace them with %20
    
    
//      let lowerBound = string.index(string.startIndex, offsetBy: string.count - 3)
//      string.removeSubrange(Range(uncheckedBounds: (lowerBound, string.endIndex)))
    return str
}
