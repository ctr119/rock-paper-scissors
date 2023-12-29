//
//  PlayerBoardView.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 29/12/23.
//

import SwiftUI

struct PlayerBoardView: View {
    @ObservedObject var viewModel: GameViewModel
        
    var body: some View {
        VStack {
            Text("- Your points -")
            Text("\(viewModel.playerScore)")
                .fontWeight(.bold)
        }
        .customHeadline()
        
        HStack {
            ForEach(GameMove.allCases, id: \.self) { move in
                MoveButton(move: move, action: {
                    viewModel.player(move: move)
                })
            }
        }
    }
}

#Preview {
    PlayerBoardView(viewModel: .mock)
}
