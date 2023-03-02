import Combine

public extension Publisher {
  /**
   Returns original `Publisher` where it's concrete error type is erased to Swift's basic`Swift.Error` type.
   */
  func eraseErrorType() -> some Publisher<Output, Error> {
    self.mapError { error in error as Error }
  }
}
