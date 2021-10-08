
//  Minesweeper: Design and implement a text-based Minesweeper game. Minesweeper is the classic single-player computer game where an NxN grid has B mines (or bombs) hidden across the grid. The remaining cells are either blank or have a number behind them. The numbers reflect the number of bombs in the surrounding eight cells. The user then uncovers a cell. If it is a bomb, the player loses. If it is a number, the number is exposed. If it is a blank cell, this cell and all adjacent blank cells (up to and including the surrounding numeric cells) are exposed. The player wins when all non-bomb cells are exposed. The player can also flag certain places as potential bombs. This doesn't affect game play, other than to block the user from accidentally clicking a cell that is thought to have a bomb. (Tip for the reader: if you're not familiar with this game, please play a few rounds online first.)

enum CellType: Equatable {
    case blank
    case numeric(value: Int)
    case bomb
}

class Cell {
    let type: CellType
    var flagged = false
    var isRevealed = false
    let row: Int
    let column: Int
    
    init(type: CellType, row: Int, column: Int) {
        self.type = type
        self.row = row 
        self.column = column
    }
    
    func toggleFlag() {
        flagged.toggle()
    }
    
    func reveal() {
        isRevealed = true
    }
}

class Board {
    var grid = [[Cell]]()
    
    init(grid: [[Cell]]) {
        self.grid = grid
    }
    
    func getCell(row: Int, column: Int) throws -> Cell {
        guard row < grid.count && column < grid[row].count else { throw GameError.outOfBoundsError }
        return grid[row][column]
    }
    
    func revealBoard() {
        for row in grid {
            for cell in row {
                cell.reveal()
            }
        }
    }
    
    func getAdjacetCells(row: Int, column: Int) -> [Cell] {
        return []
    }
}

enum GameError: Error {
    case outOfBoundsError
    case gameOver
}

class MinesweeperGame {
    let board: Board
    
    init() {
        self.board = Board(grid: [
//              [Cell(type: .blank), Cell(type: .bomb), Cell(type: .blank), Cell(type: .bomb)],
//              [Cell(type: .blank), Cell(type: .bomb), Cell(type: .blank), Cell(type: .bomb)],
//              [Cell(type: .blank), Cell(type: .bomb), Cell(type: .blank), Cell(type: .bomb)],
//              [Cell(type: .blank), Cell(type: .bomb), Cell(type: .numeric(value: 2)), Cell(type: .bomb)],
        ])
    }
    
    func toggleFlag(row: Int, column: Int) throws {
        let cell = try board.getCell(row: row, column: column)
        cell.toggleFlag()
    }
    
    func revealAll() {
        board.revealBoard()
    }
    
    func uncover(row: Int, column: Int) throws {
        let cell = try board.getCell(row: row, column: column)
        switch cell.type {
        case .bomb:
            cell.reveal()
            throw GameError.gameOver
        case .numeric(let value):
            cell.reveal()
        case .blank:
            unCoverBlankCell(cell: cell)
        } 
    }
    
    func unCoverBlankCell(cell: Cell) {
        let adjacentCells = board.getAdjacetCells(row: cell.row, column: cell.column)
        for cell in adjacentCells {
            switch cell.type {
            case .bomb:
                continue 
            case .numeric:
                cell.reveal()
            case .blank:
                if !cell.isRevealed {
                    unCoverBlankCell(cell: cell)
                }
            }
        }
    }
}
