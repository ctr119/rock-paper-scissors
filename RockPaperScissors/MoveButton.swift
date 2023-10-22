import SwiftUI

struct MoveButton: View {
    private let maxWidth: CGFloat = 100
    private let gradient: RadialGradient = .init(colors: [.white, .gray], center: .center, startRadius: 0, endRadius: 45)
    
    let move: GameMove
    let width: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button(move.string, action: action)
            .font(.largeTitle)
            .frame(width: dimensions.width, height: dimensions.height)
            .background(gradient)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
            .shadow(radius: 5)
    }
    
    private var dimensions: CGSize {
        let finalWidth = width <= maxWidth ? width : maxWidth
        
        return .init(width: finalWidth, height: finalWidth)
    }
}

struct MoveButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                MoveButton(move: .rock, width: 100, action: {})
                MoveButton(move: .paper, width: 100, action: {})
                MoveButton(move: .scissors, width: 100, action: {})
            }
            
            HStack {
                MoveButton(move: .scissors, width: 150, action: {})
                MoveButton(move: .scissors, width: 250, action: {})
            }
        }
    }
}
