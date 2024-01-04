//
//  CustomText.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 4/1/24.
//

import SwiftUI

struct CustomText {
    struct Style {
        let config: () -> Configuration
        
        enum Primary {}
        enum Secondary {}
    }
    
    struct Configuration {
        let font: Font
        let weight: Font.Weight
        let isLowercasedSmallCaps: Bool
        let isMonospaced: Bool
    }
}
