import SwiftUI

public extension Color {
  static var random: Color {
    Color(
      .displayP3,
      red: Double.random(in: 0.0...1.0),
      green: Double.random(in: 0.0...1.0),
      blue: Double.random(in: 0.0...1.0),
      opacity: 0.5
    )
  }
}
