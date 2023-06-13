import SwiftUI

extension LocalizedString: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> LocalizedString {
    String.random(&randomNumberGenerator).localized
  }
}

extension Color: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Color {
    Color(
      red: .random(
        in: 0.0...1.0,
        using: &randomNumberGenerator
      ),
      green: .random(
        in: 0.0...1.0,
        using: &randomNumberGenerator
      ),
      blue: .random(
        in: 0.0...1.0,
        using: &randomNumberGenerator
      )
    )
  }
}
