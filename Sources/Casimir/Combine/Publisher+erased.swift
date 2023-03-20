import Combine

public extension Publisher {
  func erased() -> AnyPublisher<Output, Failure> {
    eraseToAnyPublisher()
  }
}
