#if canImport(UIKit)
import UIKit

public extension UIColor {
  // swiftlint:disable identifier_name
  convenience init(hex: String) {
    var r, g, b, a: CGFloat
    r = 255 / 255
    g = 20 / 255.0
    b = 150 / 255.0
    a = 1

    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])

      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
        }
      }
    }

    self.init(red: r, green: g, blue: b, alpha: a)
  }
}
#endif
