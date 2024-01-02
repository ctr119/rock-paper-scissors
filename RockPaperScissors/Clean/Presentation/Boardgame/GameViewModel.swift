//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 29/12/23.
//

import SwiftUI

/// It will handle all related to the Game itself
/// - rounds
/// - who wins each round
/// - final winner

class GameViewModel: ObservableObject {
    static let maxRounds = 4
    
    @Published var playerScore = 0
    @Published var shouldClearPlayerButtons = false
    @Published var botScore = 0
    @Published var botMove: GameMove?
    @Published var isGameOver = false
    
    private(set) var roundsLeft: Int
    private(set) var roundsIndex = 1
    private(set) var gameOverMessage: String = ""
    
    init() {
        self.roundsLeft = Self.maxRounds
    }
    
    func player(move playerMove: GameMove) {
        defer {
            shouldClearPlayerButtons = true
            
            roundsLeft -= 1
            
            if roundsLeft > 0 {
                roundsIndex += 1
            } else {
                gameOverMessage = buildGameOverMessage()
                isGameOver = true
            }
        }
        
        let botMove = generateBotMove()
        self.botMove = botMove
        
        guard let playerWins = playerMove.wins(botMove) else {
            // TODO: Draw! Let's try to improve here
            return
        }
        
        if playerWins {
            playerScore += 1
        } else {
            botScore += 1
        }
    }
    
    // TODO: Think about turning this into an UseCase
    private func generateBotMove() -> GameMove {
        let upperBound = GameMove.allCases.count - 1
        let moveIndex = Int.random(in: 0...upperBound)
        let move = GameMove(rawValue: moveIndex)
        
        return move ?? .rock
    }
    
    private func buildGameOverMessage() -> String {
        // TODO: Add the draws
        
        if playerScore == botScore {
            return "Draw! 🫠\nBoth got \(playerScore) points"
        } else if playerScore > botScore {
            return "You won! 🥳\nPlayer: \(playerScore)\nOpponent: \(botScore)"
        } else {
            return "You lost! 😵\nPlayer: \(playerScore)\nOpponent: \(botScore)"
        }
    }
    
    func restart() {
        botMove = nil
        
        playerScore = 0
        botScore = 0
        
        roundsLeft = Self.maxRounds
        roundsIndex = 1
        
        gameOverMessage = ""
    }
}

extension GameViewModel {
    static var mock: GameViewModel {
        .init()
    }
}
