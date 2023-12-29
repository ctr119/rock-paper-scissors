import SwiftUI

extension View {
    func boardStyle(spacing: CGFloat = 40) -> some View {
        self.modifier(BoardModifier(spacing: spacing))
    }
}

private struct BoardModifier: ViewModifier {
    let spacing: CGFloat
    
    func body(content: Content) -> some View {
        VStack(spacing: spacing) {
            content
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
