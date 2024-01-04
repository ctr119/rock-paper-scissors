//
//  CustomTextStyle+Primary.swift
//  RockPaperScissors
//
//  Created by Víctor Barrios Sánchez on 4/1/24.
//

import Foundation

extension CustomText.Style.Primary {
    static var thin: CustomText.Style {
        CustomText.Style {
            CustomText.Configuration(font: .title,
                                     weight: .thin,
                                     isLowercasedSmallCaps: true,
                                     isMonospaced: false)
        }
    }
    
    static var regular: CustomText.Style {
        CustomText.Style {
            CustomText.Configuration(font: .title,
                                     weight: .regular,
                                     isLowercasedSmallCaps: true,
                                     isMonospaced: false)
        }
    }
}
