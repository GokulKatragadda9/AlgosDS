//BinarySearch
//Time: O(logn) space: recursive stack : O(logn)


//[5,8,12,14,25]

public func binarySearch(arr: [Int], value: Int) -> Int? {
    return binarySearch(arr: arr, start: 0, end: arr.count - 1, value: value)
}

private func binarySearch(arr: [Int], start: Int, end: Int, value: Int) -> Int? {
    if start > end {
        return nil
    }
    var mid: Int = (start + end)/2
    if arr[mid] == value {
        return mid
    } else if arr[mid] > value {
        return binarySearch(arr: arr, start: start, end: mid - 1, value: value)
    } else {
        return binarySearch(arr: arr, start: mid + 1, end: end, value: value)
    }
    return nil
}
