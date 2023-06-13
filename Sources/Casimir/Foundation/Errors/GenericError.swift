/**
 Generic instance conforming to Swift's `Error` protocol.

 Can be used in places where usage of objects conforming to the `Error` protocol is required, but creating unique, dedicated error type is unecessary.
 */
public struct GenericError: Error, Randomable {
  public let description: String
  public var localizedDescription: String {
    description
  }

  /**
   Initializes the GenericError instance with dedicated `description` explaining what the error is caused by.
   */
  public init(description: String) {
    self.description = description
  }

  /**
   Initializes the GenericError as the "unimplemented" one. Common case when defining mocks for tests.
   */
  public init(unimplemented: Void = ()) {
    self.description = "unimplemented"
  }
}

public extension GenericError {
  static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    GenericError(description: .random(&randomNumberGenerator))
  }
}
