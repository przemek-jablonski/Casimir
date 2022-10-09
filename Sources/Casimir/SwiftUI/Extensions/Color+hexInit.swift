import SwiftUI

public extension Color {
    init(hex: String) {
        let red, green, blue: Double

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    red = Double((hexNumber & 0xff000000) >> 24) / 255
                    green = Double((hexNumber & 0x00ff0000) >> 16) / 255
                    blue = Double((hexNumber & 0x0000ff00) >> 8) / 255
                    //                    alpha = Double(hexNumber & 0x000000ff) / 255

                    self.init(red: red, green: green, blue: blue)
                    return
                }
            }
        }
        //        log.error(self, Architecture.ApplicationError.unableToSynthesizeColorFromHex(hex))
        self.init(red: 1.0, green: 0.35, blue: 0.5)
    }
}
