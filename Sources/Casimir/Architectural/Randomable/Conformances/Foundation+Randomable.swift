import Foundation

// TODO: search for all "random" properties and get them together here

// MARK: - Foundation support
extension Int: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(
      in: Int.min...Int.max,
      using: &randomNumberGenerator
    )
  }
}

extension Float: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(
      in: Int.min.float...Int.max.float,
      using: &randomNumberGenerator
    )
  }
}

extension Double: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(
      in: Int.min.double...Int.max.double,
      using: &randomNumberGenerator
    )
  }
}

extension String: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    LoremIpsum.random
  }
}

extension Character: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    String.random(
      &randomNumberGenerator
    )
    .randomElement(using: &randomNumberGenerator) ?? "a"
  }
}

extension Date: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Double.random(
      in: Date().byAdding(.year, -10).timeIntervalSince1970..<Date().byAdding(.year, 1).timeIntervalSince1970,
      using: &randomNumberGenerator
    ).date
  }
}

extension UUID: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    UUID()
  }
}

extension Bool: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .random(using: &randomNumberGenerator)
  }
}

// MARK: - Additional types support
extension URL: Randomable {
  // swiftlint:disable force_unwrapping
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> URL {
    [
      "https://google.com",
      "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      "https://picsum.photos/id/870/200/300?grayscale&blur=2",
      "https://i.redd.it/vwlgciqshjp41.jpg",
      "https://en.wikipedia.org/wiki/Lorem_ipsum"
    ].random().url!
  }
  // swiftlint:enable force_unwrapping
}

extension Data: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Data {
    Data(
      repeating: Int.random(&randomNumberGenerator).uInt8,
      count: (0...10000).randomElement() ?? 0
    )
  }
}

// MARK: - Optionals support
extension Optional: Randomable where Wrapped: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    random(
      nilToValueRatio: 0.33,
      &randomNumberGenerator
    )
  }

  internal static func random(
    nilToValueRatio: Float,
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    if Float.random(
      in: 0...1,
      using: &randomNumberGenerator
    ) > nilToValueRatio {
      return Wrapped.random(&randomNumberGenerator)
    } else {
      return nil
    }
  }
}

// MARK: - Collections support
extension Array: Randomable where Element: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Element.randoms(&randomNumberGenerator)
  }
}

extension Set: Randomable where Element: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    Element.randoms(&randomNumberGenerator).set
  }
}

extension Dictionary: Randomable where Key: Randomable, Value: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {Dictionary(
    uniqueKeysWithValues: zip(
      Key.randoms(&randomNumberGenerator).set,
      Value.randoms(&randomNumberGenerator)
    )
  )
  }
}

extension Range: Randomable where Bound: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let boundA = Bound.random(&randomNumberGenerator)
    let boundB = Bound.random(&randomNumberGenerator)
    return Swift.min(boundA, boundB)..<Swift.max(boundA, boundB)
  }
}

extension ClosedRange: Randomable where Bound: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    let boundA = Bound.random(&randomNumberGenerator)
    let boundB = Bound.random(&randomNumberGenerator)
    return Swift.min(boundA, boundB)...Swift.max(boundA, boundB)
  }
}

extension Locale: Randomable {
  // swiftlint:disable force_unwrapping
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Locale {
    Locale(
      identifier:
        Locale.availableIdentifiers.randomElement(
          using: &randomNumberGenerator
        )!
    )
  }
  // swiftlint:enable force_unwrapping
}
