/**
 Signifies ability to quickly generate random/mock instances of given class for realtime mocking.
 */
public protocol Randomable {
  /**
   Generates single random instance of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self

  /**
   Generates single random instance of given type. Uses system's default `RandomNumberGenerator`to seed randomness.
   */
  static func random() -> Self

  /**
   Generates array of random instances of given type.

   - Parameter randomNumberGenerator: Object responsible for randomness seed.
   */
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self]

  /**
   Generates array of random instances of given type. Uses system's default `RandomNumberGenerator`to seed randomness.
   */
  static func randoms() -> [Self]
}

// Default implementations
public extension Randomable {
  // TODO: add StringGenerationSuggestion like random(.fileName), random(.user) or something
  static func random() -> Self {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.random(&randomNumberGenerator)
  }

  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    (0..<10).map { _ in
      Self.random(&randomNumberGenerator)
    }
  }

  static func randoms() -> [Self] {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    return Self.randoms(&randomNumberGenerator)
  }

  func random() -> Self { Self.random() }
}

public extension Randomable where Self: Identifiable & Hashable {
  static func randoms(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> [Self] {
    Array(
      Set(
        (10..<20).map { _ in
          Self.random()
        }
      )
    )
  }
}
