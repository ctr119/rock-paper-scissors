//
//  Modifier+CustomTextStyle.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 4/1/24.
//

import SwiftUI

extension View {
    func customTextStyle(_ textStyle: CustomText.Style) -> some View {
        modifier(CustomTextStyleModifier(style: textStyle))
    }
}

private struct CustomTextStyleModifier: ViewModifier {
    let style: CustomText.Style
    
    func body(content: Content) -> some View {
        let configuration = style.config()
        let isLowercasedSmallCaps = configuration.isLowercasedSmallCaps
        
        return content
            .font(isLowercasedSmallCaps ? configuration.font.lowercaseSmallCaps() : configuration.font)
            .fontWeight(configuration.weight)
            .monospaced(configuration.isMonospaced)
    }
}
