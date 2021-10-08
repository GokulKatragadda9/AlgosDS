//  
//  Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
//  
//
//    1 2 3
//    4 5 6
//    7 8 9

//BigO: time: O(MN + Z(M+N)) space: O(Z)  Z - Number of zeros

public func zeroMatrix(matrix: [[Int]]) -> [[Int]] {
    var zeroMatrix = matrix
    var rows = [Int]()
    var columns = [Int]()
    
    //find the zeros in the matix
    for i in 0..<matrix.count {  //rows
        for j in 0..<matrix[0].count {   //columns
            if matrix[i][j] == 0 {
                rows.append(i)
                columns.append(j)
            }
        }
    }
    
    //nullify the rows
    for i in rows {
        for j in 0..<matrix[0].count {  
            zeroMatrix[i][j] = 0
        }
    }
    
    //nullify the columns
    for i in columns {
        for j in 0..<matrix.count {  
            zeroMatrix[j][i] = 0
        }
    }
    return zeroMatrix
}
