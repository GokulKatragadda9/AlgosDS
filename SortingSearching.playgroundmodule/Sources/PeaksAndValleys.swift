//  
//  PeaksandValleys:Inanarrayofintegers,a"peak"isanelementwhichisgreaterthanorequalto the adjacent integers and a "valley" is an element which is less than or equal to the adjacent inte­gers. For example, in the array {5, 8, 6, 2, 3, 4, 6}, {8, 6} are peaks and {5, 2} are valleys. Given an array of integers, sort the array into an alternating sequence of peaks and valleys.
//  EXAMPLE
//  Input: {5, 3, 1, 2, 3}
//  Output: {5, 1, 3, 2, 3}
//  

//Time: O(nlogn) bcaz of sorting
public func peaksAndValleys(arr: [Int]) -> [Int] {
    var sorted = arr.sorted()
    var i = 1
    while i < sorted.count - 1 {
        let temp = sorted[i]
        sorted[i] = sorted[i+1]
        sorted[i+1] = temp
        i += 2
    }
    return sorted
}
