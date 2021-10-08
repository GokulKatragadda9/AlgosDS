//  
//  Search in Rotated Array: Given a sorted array of n integers that has been rotated an unknown number of times, write code to find an element in the array. You may assume that the array was originally sorted in increasing order.
//  EXAMPLE
//  lnput:find5in{15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14} Output: 8 (the index of 5 in the array)
//  time: O(logn)

public func searchRotatedArray(_ arr: [Int], value: Int) -> Int? {
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        var mid = (start+end)/2
        if value == arr[mid] {
            return mid
        }
        if (value < arr[mid] && value >= arr[start]) || (value > arr[mid] && value > arr[end]){
            // there are higher elemnts in left half
            end = mid - 1
        } else if (value > arr[mid] && value <= arr[end]) || (value < arr[mid] && value < arr[start]){
            start = mid + 1
        }
    }
    return nil
}
