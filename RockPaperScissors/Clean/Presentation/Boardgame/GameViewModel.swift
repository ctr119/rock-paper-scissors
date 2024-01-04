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
    @Published var roundWinner: String?
    @Published var isGameOver = false
    
    private(set) var roundsLeft: Int
    private(set) var roundsIndex = 1
    private(set) var gameOverMessage: String = ""
    
    private let getOpponentsMoveUseCase: GetOpponentsMoveUseCase
    
    init(getOpponentsMoveUseCase: GetOpponentsMoveUseCase = .init()) {
        self.roundsLeft = Self.maxRounds
        self.getOpponentsMoveUseCase = getOpponentsMoveUseCase
    }
    
    func player(move playerMove: GameMove) {
        defer {
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                self.finishRound()
            }
        }
        
        let botMove = getOpponentsMoveUseCase()
        self.botMove = botMove
        
        guard let playerWins = playerMove.wins(botMove) else {
            // TODO: Draw! Let's try to improve here
            roundWinner = "🔥 DRAW 🔥"
            return
        }
        
        if playerWins {
            playerScore += 1
        } else {
            botScore += 1
        }
        
        roundWinner = playerWins ? "💪🏻 Player wins!" : "Opponent wins 😭"
    }
    
    private func finishRound() {
        // Trigger the event for alawys clearing the player's buttons
        shouldClearPlayerButtons.toggle()
        
        roundWinner = nil
        roundsLeft -= 1
        
        if roundsLeft > 0 {
            botMove = nil
            roundsIndex += 1
        } else {
            gameOverMessage = buildGameOverMessage()
            isGameOver = true
        }
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
