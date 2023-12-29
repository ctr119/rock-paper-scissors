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
                roundsIndex += 1
            } else {
                isGameOver = true
            }
        }
        
        let botMove = generateBotMove()
        
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
    
    private func generateBotMove() -> GameMove {
        let upperBound = GameMove.allCases.count - 1
        let moveIndex = Int.random(in: 0...upperBound)
        let move = GameMove(rawValue: moveIndex)
        
        return move ?? .rock
    }
}

extension GameViewModel {
    static var mock: GameViewModel {
        .init()
    }
}
