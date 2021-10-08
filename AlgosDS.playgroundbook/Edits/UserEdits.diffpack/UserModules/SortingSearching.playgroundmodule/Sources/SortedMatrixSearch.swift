
//  Sorted Matrix Search: Given an M x N matrix in which each row and each column is sorted in ascending order, write a method to find an element.
//  

//time: O(mlogn)
public func sortedMatrixSearchBinary(matrix: [[Int]], n: Int) -> (Int, Int)? {
    for (rowIndex, row) in matrix.enumerated() {
        if let columnIndex = binarySearch(arr: row, value: n) {
            return (rowIndex, columnIndex)
        }
    }
    return nil
}

//TIme: O(M+N)
public func sortedMatrixSearch(matrix: [[Int]], n: Int) -> (Int, Int)? {
    var row = 0
    var column = matrix[0].count - 1
    while row < matrix.count && column >= 0 {
        var currentElement = matrix[row][column]
        if currentElement == n {
            return (row, column)
        } else if currentElement > n {
            column -= 1
        } else {
            row += 1
        }
    }
    return nil
}
