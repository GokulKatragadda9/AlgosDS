//  
//  Robot in a Grid: Imagine a robot sitting on the upper left corner of grid with r rows and c columns. The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.
//  


public struct Cell: Equatable, Hashable {
    let row: Int
    let column: Int
}

public struct Grid {
    let rows: Int
    let columns: Int
    
    func rightCell(for cell: Cell) -> Cell? {
        guard cell.column + 1 <= columns else { return nil }
        return Cell(row: cell.row, column: cell.column + 1)
    }
    
    func bottomCell(for cell: Cell) -> Cell? {
        guard cell.row + 1 <= rows else { return nil }
        return Cell(row: cell.row + 1, column: cell.column)
    }
    
    func isRightBottomCell(_ cell: Cell) -> Bool {
        return cell.row == rows && cell.column == columns
    }
}

//Bottom up approach
public func findPath(rowsCount: Int, columnsCount: Int, exculdedCells: [Cell]) -> [[Cell]] {
    let grid = Grid(rows: rowsCount, columns: columnsCount)
    let dict = findPathForAllCells(in: grid, exculdedCells: [])
    return dict[Cell(row: 1, column: 1)] ?? [[]]
}

//iterate through the cells and store the path for each in hashmap

typealias Path = [Cell]

func findPathForAllCells(in grid: Grid, exculdedCells: [Cell]) -> Dictionary<Cell, [Path]> {
    var dict = Dictionary<Cell, [Path]>()
    for row in (1...grid.rows).reversed() {
        for column in (1...grid.columns).reversed() {
            let cell = Cell(row: row, column: column)
            if exculdedCells.contains(cell) { continue }
            if grid.isRightBottomCell(cell) {
                dict[cell] = [[Cell(row: 3, column: 3)]]
                continue
            }
            var paths = [Path]()
            if let rightNeighbor = grid.rightCell(for: cell), let pathsFromRightNeighbor = dict[rightNeighbor] {
                for var path in pathsFromRightNeighbor {
                    path.insert(cell, at: 0)
                    paths.append(path)
                }
            }
            if let bottomNeighbor = grid.bottomCell(for: cell), let pathsFrombottomNeighbor = dict[bottomNeighbor] {
                for var path in pathsFrombottomNeighbor {
                    path.insert(cell, at: 0)
                    paths.append(path)
                }
            }
            dict[cell] = paths
        }
    }
    return dict
}

//top down approach
public func findPathTopDown(rowsCount: Int, columnsCount: Int, exculdedCells: [Cell]) -> [Cell] {
    let grid = Grid(rows: rowsCount, columns: columnsCount)
    var cache = Dictionary<Cell, Path>()
    return path(from: Cell(row: 1, column: 1), in: grid, cache: &cache, excludedCells: [Cell(row: 2, column: 3)]) ?? []
}


func path(from cell: Cell, in grid: Grid, cache: inout Dictionary<Cell, Path>, excludedCells: [Cell]) -> Path? {
    if grid.isRightBottomCell(cell) {
        return [Cell(row: grid.rows, column: grid.columns)]
    }
    
    if excludedCells.contains(cell) {
        return nil
    }
    
    if let cache = cache[cell] {
        return cache
    }
    
    if let rightCell = grid.rightCell(for: cell), var pathFromRightCell = path(from: rightCell, in: grid, cache: &cache, excludedCells: excludedCells) {
        pathFromRightCell.insert(cell, at: 0)
        return pathFromRightCell
    } else if let bottomCell = grid.bottomCell(for: cell), var pathFromBottomCell = path(from: bottomCell, in: grid, cache: &cache, excludedCells: excludedCells) {
        pathFromBottomCell.insert(cell, at: 0)
        return pathFromBottomCell
    } else {
        return nil
    }
}
