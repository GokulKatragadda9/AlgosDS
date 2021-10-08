//  
//  8.8 Permutations with Duplicates: Write a method to compute all permutations of a string whose characters are not necessarily unique. The list of permutations should not have duplicates.
//  


public func permutationsWithDups(str: String) -> [String] {
    let dict = countCharacters(str: str)
    return getPerms(prefix: "", dict: dict, remaining: str.count)
}

func getPerms(prefix: String, dict: Dictionary<Character, Int>, remaining: Int) -> [String] {
    if remaining == 0 {
        return [prefix]
    }
    var perms = [String]()
    for char in dict.keys {
        var mutatingDict = dict
        var mutatingPrefix = prefix
        let count = mutatingDict[char]!
        if count > 0 {
            mutatingDict[char]! -= 1
            mutatingPrefix.append(char)
            let p = getPerms(prefix: mutatingPrefix, dict: mutatingDict, remaining: remaining - 1)
            perms.append(contentsOf: p)
        }
    }
    return perms
}


func countCharacters(str: String) -> Dictionary<Character, Int> {
    var dict = Dictionary<Character, Int>()
    for char in str {
        if dict[char] != nil {
            dict[char]! += 1
        } else {
            dict[char] = 1
        }
    }
    return dict
}
