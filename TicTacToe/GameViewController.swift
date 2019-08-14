//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, BoardViewControllerDelegate {
    
    // Enums
//    private enum GameState {
//        case active(GameBoard.Mark) // Active player
//        case cat
//        case won(GameBoard.Mark) // Winning player
//    }
    
    // Outlets
    @IBOutlet weak var statusLabel: UILabel!
    
    // Variables
    var game = Game(board: GameBoard(), activePlayer: .x, gameIsOver: false, winningPlayer: nil, gameState: .active(.x)) {
        didSet {
            boardViewController.board = game.board
            self.updateViews()
        }
    }
    
//    private var gameState = game.GameState.active(.x) {
//        didSet {
//            updateViews()
//        }
//    }
    
    private var board = GameBoard() {  // Struct 
        didSet {
            boardViewController.board = board
        }
    }
    
    private var boardViewController: BoardViewController! {
        willSet {
            boardViewController?.delegate = nil
        }
        didSet {
            boardViewController?.board = board
            boardViewController?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Player X Starts"
    }
    
    // Actions
    @IBAction func restartGame(_ sender: Any) {
        game.restart()
        updateViews()
        
//        board = GameBoard()
//        gameState = .active(.x)
    }
    
    // MARK: - BoardViewControllerDelegate
    
    func boardViewController(_ boardViewController: BoardViewController, markWasMadeAt coordinate: Coordinate) {
        do {
            try game.makeMark(at: coordinate)
        } catch {
            NSLog("Error making a mark in boardViewController.mark")
        }
        updateViews()
        
        
//        guard case let GameState.active(player) = gameState else {
//            NSLog("Game is over")
//            return
//        }
//
//        do {
//            try board.place(mark: player, on: coordinate)
//            if game(board: board, isWonBy: player) {
//                gameState = .won(player)
//            } else if board.isFull {
//                gameState = .cat
//            } else {
//                let newPlayer = player == .x ? GameBoard.Mark.o : GameBoard.Mark.x
//                gameState = .active(newPlayer)
//            }
//        } catch {
//            NSLog("Illegal move")
//        }
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        switch game.gameState {
        case let .active(player):
            statusLabel.text = "Player \(player.stringValue)'s turn"
        case .cat:
            statusLabel.text = "Cat's game!"
        case let .won(player):
            statusLabel.text = "Player \(player.stringValue) won!"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedBoard" {
            boardViewController = segue.destination as! BoardViewController
        }
    }
    
}
