//
//  Game.swift
//  TicTacToe
//
//  Created by Seschwan on 8/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    // Enums
    internal enum GameState {
        case active(GameBoard.Mark) // Active player
        case cat
        case won(GameBoard.Mark) // Winning player
    }
    
    
    private (set) var board = GameBoard()
    internal var activePlayer = GameBoard.Mark.x // ActivePlayer is .x
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    internal var gameState = GameState.active(.x)
    
    mutating internal func restart() {
        board = GameBoard()  // 1. Reset the game board.
        activePlayer = .x    // 2. Have ActivePlayer .X start the game.
        gameIsOver = false   // 3. gameIsOver should be "False"
        winningPlayer = nil  // 4. winningPlayer is nil
        gameState = .active(.x)
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard case let GameState.active(player) = gameState else {
            NSLog("Game is over!")
            return
        }
        
        do {
            try board.place(mark: player, on: coordinate)
            if game(board: board, isWonBy: player) {
                winningPlayer = player
                gameState = .won(player)
                gameIsOver = true
                activePlayer = .x
            } else if board.isFull {
                gameIsOver = true
                winningPlayer = nil
                gameState = .cat
                activePlayer = .x
            } else {
                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
            
        } catch {
            NSLog("Illegal Move!")
        }
    }
    
    
}
