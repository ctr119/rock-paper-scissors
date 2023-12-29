import SwiftUI

struct MoveButton: View {
    private let gradient: RadialGradient = .init(colors: [.white, .gray], center: .center, startRadius: 0, endRadius: 45)
    
    let move: GameMove
    let action: () -> Void
    
    var body: some View {
        Button(move.string, action: action)
            .font(.largeTitle)
            .frame(minWidth: 100, minHeight: 100)
            .background(gradient)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
            .shadow(radius: 5)
    }
}

struct MoveButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                MoveButton(move: .rock, action: {})
                MoveButton(move: .paper, action: {})
                MoveButton(move: .scissors, action: {})
            }
            
            HStack(spacing: 20) {
                MoveButton(move: .scissors, action: {})
                MoveButton(move: .scissors, action: {})
            }
        }
    }
}
