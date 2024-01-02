//
//  PlayerBoardView.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 29/12/23.
//

import SwiftUI

struct PlayerBoardView: View {
    @ObservedObject var viewModel: GameViewModel
    
    @State private var buttonsState: [Bool] = [
        false, false, false
    ]
        
    var body: some View {
        VStack {
            VStack {
                Text("- Your points -")
                Text("\(viewModel.playerScore)")
                    .fontWeight(.bold)
            }
            .customHeadline()
            
            HStack {
                ForEach(GameMove.allCases, id: \.self) { move in
                    MoveButton(move: move, 
                               selected: $buttonsState[move.rawValue],
                               action: {
                        viewModel.player(move: move)
                    })
                }
            }
        }
        .onChange(of: viewModel.shouldClearPlayerButtons) { _ in
            resetButtonsState()
        }
    }
    
    private func resetButtonsState() {
        buttonsState = [false, false, false]
    }
}

#Preview {
    PlayerBoardView(viewModel: .mock)
}
