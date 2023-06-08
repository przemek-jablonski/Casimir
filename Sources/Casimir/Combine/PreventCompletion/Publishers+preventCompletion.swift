import Combine

public extension Publisher {
  /**
   Prevents the upstream from issuing `completed` event. `Error` and `Output` events are forwarded normally.
   */
  func preventCompletion() -> AnyPublisher<Output, Failure> {
    flatMap { output -> AnyPublisher<Output, Failure> in
      CurrentValueSubject(output).erased()
    }
    .erased()
  }
}
