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
        VStack(spacing: 25) {
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
                    .padding()
                    .frame(minWidth: 70)
                    .background(.gray.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .rotation3DEffect(
                        viewModel.botMove != nil ? .degrees(360) : .degrees(0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .animation(.bouncy, value: viewModel.botMove)
            }
        }
    }
    
    private var chosenMove: String {
        viewModel.botMove?.string ?? "?"
    }
}

#Preview {
    BotBoardView(viewModel: .mock)
}
