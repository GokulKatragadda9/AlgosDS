
// Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?


//Brute-force: iterate the string and compare all the chars.
//BigO: Time: O(n^2) Space: O(1)
//Best: iterate the string and add all chars to a set and while adding check if the char already exits in set then return false else continue.
//BigO: Time: O(n) Space: O(n)
//Assumptions: ASCII chars 128, 

public func isUnqiueString(str: String) -> Bool {
    if str.count > 128 { return false }
    var set = Set<Character>()
    for char in str {
        if set.contains(char) {   // according to swift docs, the complexity is O(1), might be implemented using good hashing under the hood
            return false
        }
        set.insert(char)
    }
    return true
}

//BigO: Space: O(1)
//iterating over next char and comparing takes O(n^2)
//sorting the string and comparing neighboring chars might take O(nlogn)



