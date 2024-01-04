//
//  PlayerBoardView.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 29/12/23.
//

import SwiftUI

struct PlayerBoardView: View {
    @ObservedObject var viewModel: GameViewModel
    
    @State private var buttonsState: [Bool] = Array(repeating: false, count: 3)
    @State private var buttonsEnabled: [Bool] = Array(repeating: true, count: 3)
        
    var body: some View {
        VStack {
            VStack {
                Text("- Your points -")
                    .customTextStyle(.Primary.thin)
                
                Text("\(viewModel.playerScore)")
                    .customTextStyle(.Primary.regular)
            }
            
            HStack {
                ForEach(GameMove.allCases, id: \.self) { move in
                    MoveButton(move: move, 
                               selected: $buttonsState[move.rawValue], 
                               enabled: $buttonsEnabled[move.rawValue],
                               action: {
                        self.disableButtons()
                        
                        viewModel.player(move: move)
                    })
                }
            }
        }
        .onChange(of: viewModel.shouldClearPlayerButtons) { _ in
            resetButtonsState()
        }
    }
    
    private func disableButtons() {
        buttonsEnabled = Array(repeating: false, count: 3)
    }
    
    private func resetButtonsState() {
        buttonsState = Array(repeating: false, count: 3)
        buttonsEnabled = Array(repeating: true, count: 3)
    }
}

#Preview {
    PlayerBoardView(viewModel: .mock)
}
