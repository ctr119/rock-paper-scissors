//
//  GetOpponentsMoveUseCase.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 4/1/24.
//

import Foundation

struct GetOpponentsMoveUseCase {
    func callAsFunction() -> GameMove {
        let upperBound = GameMove.allCases.count - 1
        let moveIndex = Int.random(in: 0...upperBound)
        let move = GameMove(rawValue: moveIndex)
        
        return move ?? .rock
    }
}
