
//  
//  Sparse Search: Given a sorted array of strings that is interspersed with empty strings, write a method to find the location of a given string.
//  EXAMPLE 
//  Input: ball,{"at", "", "", "ball", "", "", "car", "", "", "dad", ""}
//  


public func sparseSearch(arr: [String], value: String) -> Int? {
    var start = 0
    var end = arr.count - 1
    
    while start < end {
        var mid = (start + end)/2
        if arr[mid] == "" {
            var left = mid - 1
            var right = mid + 1
            while left >= 0 && right < arr.count && arr[left] == nil && arr[right] == nil {
                left = left - 1
                right = right + 1
            }
            mid = arr[left] != "" ? left : right
        }
        if arr[mid] == value {
            return mid
        } else if arr[mid] > value {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return nil
}
