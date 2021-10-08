//  
//  Magic Index: A magic index in an array A[ 0••• n -1] is defined to be an index such that A[ i] = i. Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in array A.
//  FOLLOW UP
//  What if the values are not distinct?
//  We may recognize that this problem sounds a lot like the classic binary search problem. Leveraging the Pattern Matching approach for generating algorithms, how might we apply binary search here?
//  When we see that A[mid] < mid, we cannot conclude which side the magic index is on. It could be on the right side, as before. Or, it could be on the left side (as it, in fact, is).
//  Could it be anywhere on the left side? Not exactly. Since A[ 5] = 3, we know that A[4] couldn't be a magic index. A[4] would need to be 4 to be the magic index, but A[4] must be less than or equal to A[ 5].
//  In fact, when we see that A[ 5] = 3, we'll need to recursively search the right side as before. But, to search the left side, we can skip a bunch of elements and only recursively search elements A[0] through A[3]. A[3] is the first element that could be a magic index.


func magicIndex(array: [Int]) -> Int? {
    return findMagicIndex(array: array, start: 0, end: array.count - 1)
}

//Binary Search: Time: O(logn) space: recursion stack
func findMagicIndex(array: [Int], start: Int, end: Int) -> Int? {
    guard start < end else { return nil }
    
    let mid = (start + end)/2
    if array[mid] == mid {
        return mid
    } 
    
    //Search right
    let rightIndex = max(mid + 1, array[mid])
    if let index = findMagicIndex(array: array, start: rightIndex, end: end) {
        return index
    }
    
    //Search left
    let leftIndex = min(mid - 1, array[mid])
    if let index = findMagicIndex(array: array, start: start, end: leftIndex) {
        return index
    }
    return nil
}
