import SwiftUI

struct MoveButton: View {
    let move: GameMove
    @Binding var selected: Bool
    @Binding var enabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(move.string) {
            withAnimation {
                selected.toggle()
            }
            action()
        }
        .gameStyle()
        .disabled(!enabled)
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
    @State static var selected = false
    @State static var enabled = true
    
    static var previews: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                MoveButton(move: .rock, selected: Self.$selected, enabled: self.$enabled, action: {})
                MoveButton(move: .paper, selected: Self.$selected, enabled: self.$enabled, action: {})
                MoveButton(move: .scissors, selected: Self.$selected, enabled: self.$enabled, action: {})
            }
            
            HStack(spacing: 20) {
                MoveButton(move: .scissors, selected: Self.$selected, enabled: self.$enabled, action: {})
                MoveButton(move: .scissors, selected: Self.$selected, enabled: .constant(false), action: {})
            }
        }
    }
}
