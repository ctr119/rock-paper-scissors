import SwiftUI

struct HeadlineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.smallCaps())
            .fontWeight(.thin)
    }
}

extension View {
    func customHeadline() -> some View {
        modifier(HeadlineModifier())
    }
}
