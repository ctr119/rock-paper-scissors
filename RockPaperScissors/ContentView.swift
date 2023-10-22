import SwiftUI

struct ContentView: View {
    @State private var opponentMoveIndex = Int.random(in: 0...2)
    @State private var opponentScore = 0
    @State private var playerScore = 0
    
    private let playerButtonsSpacing: CGFloat = 20
    private let playerMoves: [GameMove] = [
        .rock, .paper, .scissors
    ]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    Text("Opponent's points \(opponentScore)")
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    playerBoard(geometry)
                    
                    Spacer()
                    
                    Text("Move: 1 / 10")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func playerBoard(_ screen: GeometryProxy) -> some View {
        Text("Your points \(playerScore)")
        
        Spacer()
        
        let effectiveWidth = screen.size.width - playerButtonsSpacing * 2.0
        let buttonsWidth = effectiveWidth / CGFloat(playerMoves.count)
        HStack(spacing: playerButtonsSpacing) {
            ForEach(playerMoves, id: \.self) { move in
                MoveButton(move: move, width: buttonsWidth, action: {
                    didTapOnMoveButton(move)
                })
            }
        }
    }
    
    private func didTapOnMoveButton(_ playerMove: GameMove) {
        guard let opponentMove = GameMove(rawValue: opponentMoveIndex),
              let playerWins = playerMove.wins(opponentMove) else {
            return
        }
        
        if playerWins {
            playerScore += 1
        } else {
            opponentScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
