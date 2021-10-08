//  
//  String Rotation:Assumeyou have a method isSubstringwhich checks if one word is a substring of another. Given two strings, sl and s2, write code to check if s2 is a rotation of sl using only one call to isSubstring (e.g.,"waterbottle" is a rotation of"erbottlewat").
//  

//  So, we need to check if there's a way to split s1 into x andy such that xy = s1 andyx = s2. Regardless of where the division between x andy is, we can see thatyx will always be a substring of xyxy.That is, s2 will always be a substring ofs1s1.
//BigO: O(N)

func stringRotation(str1: String, str2: String) -> Bool {
    var newString = str1 + str1
//      return str2.isSubstring(newString)
    return false
}
