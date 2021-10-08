//  
//  String Compression: Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return
//      the original string. You can assume the string has only uppercase and lowercase letters (a - z).
//  
//Algorithm: iterate the string and store the count
//BigO: time: O(n) space: O(1)

public func stringCompression(str: String) -> String {
    var currentChar: Character?
    var count = 0
    var compressedStr = ""
    
    for char in str {
        if currentChar == nil {
            currentChar = char
            count = 1
        } else if currentChar == char {
            count += 1
        } else {
            compressedStr.append(currentChar!)
            compressedStr.append("\(count)")
            currentChar = char
            count = 1
        }
    }
    
    compressedStr.append(currentChar!)
    compressedStr.append("\(count)")
    
    return compressedStr.count < str.count ? compressedStr : str
}
