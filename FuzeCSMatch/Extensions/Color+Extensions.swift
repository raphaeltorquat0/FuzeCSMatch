import Foundation
import SwiftUI

extension Color {
    static func fromHex(_ hexCode: String) -> Color {
        let scanner = Scanner(string: hexCode.replacingOccurrences(of: "#", with: ""))
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)

        let red = Double((color >> 16) & 0xFF) / 255.0
        let green = Double((color >> 8) & 0xFF) / 255.0
        let blue = Double(color & 0xFF) / 255.0

        return Color(.sRGB, red: red, green: green, blue: blue)
    }
}