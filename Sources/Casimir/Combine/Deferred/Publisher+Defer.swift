import Combine

public extension Publisher {
  func deferredErased() -> AnyPublisher<Output, Failure> {
    Deferred(createPublisher: { self }).eraseToAnyPublisher()
  }
}

public func deferred(_ operation: @escaping () -> Void) -> AnyPublisher<Void, Never> {
  Deferred {
    Future<Void, Never> { promise in
      operation()
      promise(.success(()))
    }
  }.eraseToAnyPublisher()
}
