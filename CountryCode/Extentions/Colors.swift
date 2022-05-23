//
//  Colors.swift
//  CountryCode
//
//  Created by Zeref on 27/04/22.
//

import Foundation
import SwiftUI

// Hex -> Color
extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

extension Color{
    static var ModelIndicator = Color(hex: 0x9588A6)
    static var ModelBackground = Color(hex: 0xFFFAF7)
    static var ModelHeader = Color(hex: 0x3A314D)
    static var msColorNeutral50 = Color(hex: 0xC3B8D1)
    static var msColorNeutral80 = Color(hex: 0x766A85)
}
