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
                    .customTextStyle(.Primary.thin)
                
                Text("\(viewModel.botScore)")
                    .customTextStyle(.Primary.regular)
            }
            
            VStack(spacing: 10) {
                Text("Chosen move")
                    .customTextStyle(.Tertiary.bold)
                
                Text(chosenMove)
                    .font(.largeTitle)
                    .padding()
                    .frame(minWidth: 70)
                    .background(.gray.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .rotation3DEffect(
                        .degrees(viewModel.botMove != nil ? 360 : 0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .scaleEffect(viewModel.botMove != nil ? 1.2 : 0.7)
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
