//  
//  Eight Queens: Write an algorithm to print all ways of arranging eight queens on an 8x8 chess board so that none of them share the same row, column, or diagonal. In this case, "diagonal" means all diagonals, not just the two that bisect the board.
//  

public typealias Position = (row: Int, column: Int)

public func placeNQueens(n: Int) {
    var qPos = [Position]()
    placeQueen(row: 0, n: n, queenPositions: &qPos)
}
    
private func placeQueen(row: Int, n: Int, queenPositions: inout [Position]) {
        if row >= n {
            print(queenPositions)
            return 
        }
        for column in 0...n-1 {
            if checkValid(row: row, column: column, queenPositions: queenPositions) {
                queenPositions.append((row,column))
                placeQueen(row: row + 1, n: n, queenPositions: &queenPositions)
                queenPositions.removeLast()
            }
        }
    }
    
private func checkValid(row: Int, column: Int, queenPositions: [Position]) -> Bool {
        for position in queenPositions {
            if position.column == column { return false }
            let rDist = row - position.row
            let cDist = abs(column - position.column)
            if rDist == cDist { return false }
        }
        return true
}

