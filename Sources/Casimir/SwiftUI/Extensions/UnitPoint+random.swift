import SwiftUI

public extension UnitPoint {
  static var randomCorner: UnitPoint {
    switch Int.random(in: 0..<3) {
    case 0: return .topLeading
    case 1: return .bottomLeading
    case 2: return .bottomTrailing
    default: return .topTrailing
    }
  }
}
