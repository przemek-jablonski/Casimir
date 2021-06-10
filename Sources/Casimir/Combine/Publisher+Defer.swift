import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Publisher {
    func deferredErased() -> AnyPublisher<Output, Failure> {
        Deferred(createPublisher: { self }).eraseToAnyPublisher()
    }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public func deferred(_ operation: @escaping () -> Void) -> AnyPublisher<Void, Never> {
    Deferred {
        Future<Void, Never> { promise in
            operation()
            promise(.success(()))
        }
    }.eraseToAnyPublisher()
}
