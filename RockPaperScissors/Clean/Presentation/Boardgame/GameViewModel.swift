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
    private static let maxRounds = 4
    
    @Published var playerScore = 0
    @Published var botScore = 0
    @Published var botMove: GameMove?
    
    private(set) var roundsLeft: Int
    private(set) var roundsIndex = 1
    private(set) var isGameOver = false
    
    init() {
        self.roundsLeft = Self.maxRounds
    }
    
    func player(move playerMove: GameMove) {
        defer {
            roundsLeft -= 1
            
            if roundsLeft > 0 {
                // This is where the bot were already choosing its next move
                // opponentMoveIndex = Int.random(in: 0...2)
                roundsIndex += 1
            } else {
                isGameOver = true
            }
        }
        
        let botMove = GameMove.paper // TODO: Ask the bot to choose
        let playerWins = playerMove.wins(botMove)
        
        if let playerWins, playerWins {
            playerScore += 1
        } else {
            botScore += 1
        }
    }
}

extension GameViewModel {
    static var mock: GameViewModel {
        .init()
    }
}
