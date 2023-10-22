import SwiftUI

struct ContentView: View {
    private static let maxRounds = 4
    
    @State private var opponentMoveIndex = Int.random(in: 0...2)
    @State private var opponentMove: GameMove? = nil
    @State private var opponentScore = 0
    @State private var playerScore = 0
    @State private var roundsLeft = Self.maxRounds
    @State private var roundsIndex = 1
    
    @State private var isGameOver = false
    
    private let playerMoves: [GameMove] = [
        .rock, .paper, .scissors
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            opponentBoard
                .boardStyle()
            
            Spacer()
            Spacer()
            Spacer()
            
            playerBoard
                .boardStyle()
            
            Spacer()
            
            Text("Round: \(roundsIndex) of \(Self.maxRounds)")
        }
        .padding()
        .alert("Finish!", isPresented: $isGameOver) {
            Button("Start again", action: restart)
        } message: {
            Text(gameOverMessage)
        }
    }
    
    private func restart() {
        opponentMoveIndex = Int.random(in: 0...2)
        opponentMove = nil
        
        playerScore = 0
        opponentScore = 0
        
        roundsLeft = Self.maxRounds
        roundsIndex = 1
    }
    
    private var gameOverMessage: String {
        if playerScore == opponentScore {
            return "Draw! Both got \(playerScore) points"
        } else if playerScore > opponentScore {
            return "You win!\nPlayer: \(playerScore)\nOpponent: \(opponentScore)"
        } else {
            return "You lose!\nPlayer: \(playerScore)\nOpponent: \(opponentScore)"
        }
    }
    
    @ViewBuilder
    private var opponentBoard: some View {
        Text("Opponent's points \(opponentScore)")
        
        VStack(spacing: 10) {
            Text("Chosen move:")
            Text("\(chosenOpponentMove)")
                .font(.largeTitle)
        }
    }
    
    private var chosenOpponentMove: String {
        if let opponentMove {
            return opponentMove.string
        }
        return "?"
    }
    
    @ViewBuilder
    private var playerBoard: some View {
        Text("Your points \(playerScore)")
        
        HStack {
            ForEach(playerMoves, id: \.self) { move in
                MoveButton(move: move, action: {
                    didTapOnMoveButton(move)
                })
            }
        }
    }
    
    private func didTapOnMoveButton(_ playerMove: GameMove) {
        defer {
            roundsLeft -= 1
            
            if roundsLeft > 0 {
                opponentMoveIndex = Int.random(in: 0...2)
                roundsIndex += 1
            } else {
                isGameOver = true
            }
        }
        
        opponentMove = GameMove(rawValue: opponentMoveIndex)
        guard let opponentMove,
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
