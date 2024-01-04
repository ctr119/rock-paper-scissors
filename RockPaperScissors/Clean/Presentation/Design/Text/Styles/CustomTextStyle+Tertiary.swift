//
//  CustomTextStyle+Tertiary.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 4/1/24.
//

import SwiftUI

extension CustomText.Style.Tertiary {
    static var bold: CustomText.Style {
        CustomText.Style {
            CustomText.Configuration(font: .footnote,
                                     weight: .bold,
                                     isLowercasedSmallCaps: false,
                                     isMonospaced: true)
        }
    }
}
