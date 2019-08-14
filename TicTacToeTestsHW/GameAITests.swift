//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Seschwan on 8/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    
    func testWinCheckingDiagonal1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonal2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    
}
