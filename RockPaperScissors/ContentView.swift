import SwiftUI

struct ContentView: View {
    @State private var appsMove = Int.random(in: 0...2)
    
    private let playerButtonsSpacing: CGFloat = 20
    private let playerMoves: [GameMove] = [
        .rock, .paper, .scissors
    ]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    
                    Text("Opponent's points go here")
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    playerBoard(geometry)
                    
                    Spacer()
                    
                    Text("Move: 1 / 10")
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func playerBoard(_ screen: GeometryProxy) -> some View {
        Text("Your points go here")
        
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
    
    private func didTapOnMoveButton(_ gameMove: GameMove) {
        print("The player tapped: \(gameMove.string)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
