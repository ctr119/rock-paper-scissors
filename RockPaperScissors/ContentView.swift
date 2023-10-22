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
                    Spacer()
                    
                    Text("Your points go here")
                    
                    Spacer()
                    
                    let buttonsWidth = (geometry.size.width - playerButtonsSpacing * 2.0) / CGFloat(playerMoves.count)
                    HStack(spacing: playerButtonsSpacing) {
                        ForEach(playerMoves, id: \.self) { move in
                            MoveButton(move: move, width: buttonsWidth, action: {})
                        }
                    }
                    
                    Spacer()
                    
                    Text("Move: 1 / 10")
                }
            }
        }
        .padding()
    }
    
    private func didTapOnMoveButton() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
