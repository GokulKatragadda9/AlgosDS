
//QuickSort
//worst case - O(n^2) average case - O(nlogn) space: inplace sort


public func quickSort(_ arr: inout [Int]) {
    quickSortHelper(&arr, low: 0, high: arr.count - 1)
}

private func quickSortHelper(_ arr: inout [Int], low: Int, high: Int) {
    guard low < high else { return }
    let partitionIndex = partitionHelper(&arr, low: low, high: high)
    quickSortHelper(&arr, low: low, high: partitionIndex - 1)
    quickSortHelper(&arr, low: partitionIndex + 1, high: high)
}

private func partitionHelper(_ arr: inout [Int], low: Int, high: Int) -> Int {
    var pivot = arr[high]
    var i = low
    for j in low..<high {
        if arr[j] <= pivot {
            (arr[i], arr[j]) = (arr[j], arr[i])
            i += 1
        }
    }
    (arr[i], arr[high]) = (arr[high], arr[i])
    return i
}
