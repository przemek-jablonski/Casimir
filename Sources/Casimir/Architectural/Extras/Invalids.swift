import Foundation
import SwiftUI

public extension Float {
  static var invalid: Float {
    Float(Int.invalid)
  }
}

public extension Int {
  static var invalid: Int {
    Int.min + 1
  }
}

public extension String {
  static var invalid: String {
    ""
  }
}

public extension Date {
  static var invalid: Date {
    Calendar.current.date(byAdding: .day, value: 1, to: .distantPast) ?? .distantPast
  }
}

public extension Color {
  static var invalid: Color {
    Color(.invalid)
  }
}

#if canImport(UIKit) && !os(watchOS)
import UIKit
public extension UIColor {
  static var invalid: UIColor {
    .systemPink
  }
}
#endif
