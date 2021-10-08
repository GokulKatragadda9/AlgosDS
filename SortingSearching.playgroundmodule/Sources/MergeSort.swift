
// Merge Sort
// time: O(nlogn) space: O(n)
public func mergeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    var mid = arr.count/2
    let arr1 = mergeSort(Array(arr[0..<mid]))
    let arr2 = mergeSort(Array(arr[mid..<arr.count]))
    return merge(arr1, arr2)
}

// Does O(n) work
func merge(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var newArr = [Int]()
    var index1 = 0
    var index2 = 0
    
    while(index1 < arr1.count && index2 < arr2.count) {
        if arr1[index1] >= arr2[index2] {
            newArr.append(arr2[index2])
            index2 += 1
        } else {
            newArr.append(arr1[index1])
            index1 += 1
        }
    }
    
    while index1 < arr1.count {
        newArr.append(arr1[index1])
        index1 += 1
    }
    
    while index2 < arr2.count {
        newArr.append(arr2[index2])
        index2 += 1
    }

    return newArr
}
