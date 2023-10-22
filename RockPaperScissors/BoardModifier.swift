import SwiftUI

struct BoardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func boardStyle() -> some View {
        self.modifier(BoardModifier())
    }
}
