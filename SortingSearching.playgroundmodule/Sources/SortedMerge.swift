//  
//  Sorted Merge: You are given two sorted arrays, A and B, where A has a large enough buffer at the end to hold B. Write a method to merge B into A in sorted order.
//  Hints:#332
//  
// Time: O(m+n) worst case, 

public func mergeArrays(_ arr1: inout [Int], _ arr2: [Int]) {
    //iterate through second array from last 
    //compare to first array last item
    //and append to first array last or swap
    
    var arr1LastIndex = arr1.count - 1 //2
    var arr2LastIndex = arr2.count - 1 //2
    
    appendZeros(n: arr2.count, &arr1) //
        // [8,12,8,12,13,15]
        // [6,7,13]
    var newArr1LastIndex = arr1.count - 1 //5
    
    while arr2LastIndex >= 0 {
        if arr1LastIndex >= 0 && arr2[arr2LastIndex] < arr1[arr1LastIndex] {
            // append arr2 elemnt to end of arr1
            arr1[newArr1LastIndex] = arr1[arr1LastIndex]
            arr1LastIndex -= 1
        } else {
            // swap arr1 element to end of arr1
            arr1[newArr1LastIndex] = arr2[arr2LastIndex]
            arr2LastIndex -= 1
        }
        newArr1LastIndex -= 1
    }
}

private func appendZeros(n: Int, _ arr: inout [Int]) {
    var count = n
    while count > 0 {
        arr.append(0)
        count -= 1
    }
}
