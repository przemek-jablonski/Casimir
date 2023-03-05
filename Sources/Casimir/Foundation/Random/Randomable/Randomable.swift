/**
 Signifies ability to quickly generate random/mock instances of given class for realtime mocking.
 */
public protocol Randomable {
  /**
   Generates single random instance of given type.
   */
  static var random: Self { get }
  
  /**
   Generates array of random instances of given type.
   */
  static var randoms: [Self] { get }
}

public extension Randomable {
  var random: Self { Self.random }
  static var randoms: [Self] { (0..<10).map { _ in .random } }
}

public extension Array where Element: Randomable {
  static var random: Self {
    (0..<10).map { _ in .random }
  }
}

public extension Optional where Wrapped: Randomable {
  static var random: Self {
    Bool.random() && Bool.random() ? nil : Wrapped.random
  }
}
