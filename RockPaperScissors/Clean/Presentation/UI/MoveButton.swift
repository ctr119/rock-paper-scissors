import SwiftUI

struct MoveButton: View {
    @State private var selected: Bool = false
    
    let move: GameMove
    let action: () -> Void
    
    var body: some View {
        Button(move.string) {
            withAnimation {
                selected.toggle()
            }
            action()
        }
        .gameStyle()
        .overlay {
            if selected {
                RoundedRectangle(cornerSize: .init(width: 10, height: 10))
                    .stroke(strokeGradient, lineWidth: 4)
                    .transition(.opacity)
            }
        }
    }
    
    private var strokeGradient: some ShapeStyle {
        let colors = [Color(#colorLiteral(red: 0.4156862745, green: 0.7098039216, blue: 0.9294117647, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3333333333, blue: 0.6117647059, alpha: 1))]
        return RadialGradient(colors: colors, center: .center, startRadius: 50, endRadius: 65)
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
