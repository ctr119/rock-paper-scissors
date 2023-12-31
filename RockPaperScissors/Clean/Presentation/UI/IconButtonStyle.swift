//
//  IconButtonStyle.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 31/12/23.
//

import SwiftUI

extension Button {
    func gameStyle() -> some View {
        buttonStyle(IconButtonStyle())
    }
}

private struct IconButtonStyle: ButtonStyle {    
    func makeBody(configuration: Configuration) -> some View {
        let gradient: RadialGradient = .init(colors: [.white, .gray.opacity(highlighted(configuration))],
                                             center: .center,
                                             startRadius: 0,
                                             endRadius: 45)
        
        return configuration.label
            .font(.largeTitle)
            .frame(minWidth: 100, minHeight: 100)
            .background(gradient)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
            .shadow(radius: 5)
    }
    
    private func highlighted(_ configuration: Configuration) -> CGFloat {
        configuration.isPressed ? 0.3 : 1
    }
}
