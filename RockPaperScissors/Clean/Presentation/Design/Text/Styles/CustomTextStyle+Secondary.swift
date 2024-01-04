//
//  CustomTextStyle+Secondary.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 4/1/24.
//

import Foundation

extension CustomText.Style.Secondary {
    static var regular: CustomText.Style {
        CustomText.Style {
            CustomText.Configuration(font: .subheadline,
                                     weight: .regular,
                                     isLowercasedSmallCaps: true,
                                     isMonospaced: true)
        }
    }
}
