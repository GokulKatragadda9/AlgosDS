//  
//  Paint Fill: Implement the "paint fill" function that one might see on many image editing programs. That is, given a screen (represented by a two-dimensional array of colors), a point, and a new color, fill in the surrounding area until the color changes from the original color.
//  

// 11 12 13
// 21 22 23
// 31 32 33

//TimeComp: SpaceCompl: O(k) - k is number of points with the original color
import SwiftUI

public class Screen {
    public var points = [[Color]]()
    
    public init(points: [[Color]]) {
        self.points = points
    }
    
    public func paint(row: Int, column: Int, newColor: Color) {
        guard row >= 0, column >= 0, row < points.count && column < points[row].count else { return }
        let oColor = points[row][column]
        if oColor == newColor { return }
        paint(row: row, column: column, oColor: oColor, nColor: newColor)
    }
    
    private func paint(row: Int, column: Int, oColor: Color, nColor: Color) {
        guard row >= 0, column >= 0, row < points.count, column < points[row].count, points[row][column] == oColor else { return }
        points[row][column] = nColor
        paint(row: row - 1, column: column, oColor: oColor, nColor: nColor)
        paint(row: row + 1, column: column, oColor: oColor, nColor: nColor)
        paint(row: row, column: column - 1, oColor: oColor, nColor: nColor)
        paint(row: row, column: column + 1, oColor: oColor, nColor: nColor)
        paint(row: row - 1, column: column - 1, oColor: oColor, nColor: nColor)
        paint(row: row + 1, column: column + 1, oColor: oColor, nColor: nColor)
        paint(row: row - 1, column: column + 1, oColor: oColor, nColor: nColor)
        paint(row: row + 1, column: column - 1, oColor: oColor, nColor: nColor)
    }
}




