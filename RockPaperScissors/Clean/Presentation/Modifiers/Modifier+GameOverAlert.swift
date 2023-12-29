//
//  Modifier+GameOverAlert.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 29/12/23.
//

import SwiftUI

extension View {
    func gameOver(alert: GameOverAlert, when: Binding<Bool>, action: @escaping () -> Void) -> some View {
        modifier(GameOverAlertModifier(alertConfig: alert, 
                                       when: when,
                                       action: action))
    }
}

struct GameOverAlert {
    let title: String
    let message: String
}

private struct GameOverAlertModifier: ViewModifier {
    let alertConfig: GameOverAlert
    let when: Binding<Bool>
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .alert(alertConfig.title, isPresented: when) {
                Button("Ok") { action() }
            } message: {
                Text(alertConfig.message)
            }

    }
}
