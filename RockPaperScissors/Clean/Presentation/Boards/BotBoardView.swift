//
//  BotBoardView.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 29/12/23.
//

import SwiftUI

struct BotBoardView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            Text("- Opponent's points -")
            Text("\(viewModel.botScore)")
                .fontWeight(.bold)
        }
        .customHeadline()
        
        VStack(spacing: 10) {
            Text("Chosen move")
                .font(.footnote.monospaced())
            Text(chosenMove)
                .font(.largeTitle)
        }
    }
    
    private var chosenMove: String {
        viewModel.botMove?.string ?? "?"
    }
}

#Preview {
    BotBoardView(viewModel: .mock)
}
