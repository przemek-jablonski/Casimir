import Combine

extension Single {
  private func future(
    onSuccess: ((Content) -> Void)? = nil,
    onError: ((Error) -> Void)? = nil
  ) -> Future<Content, Error> {
    Future { promise in
      switch self {
      case .success(let content):
        onSuccess?(content)
        promise(.success(content))
      case .error(let error):
        onError?(error)
        promise(.failure(error))
      }
    }
  }

  private func deferred(
    onSuccess: ((Content) -> Void)? = nil,
    onError: ((Error) -> Void)? = nil
  ) -> Deferred<Future<Content, Error>> {
    Deferred {
      self.future(
        onSuccess: onSuccess,
        onError: onError
      )
    }
  }

  public func publisher(
    onSuccess: ((Content) -> Void)? = nil,
    onError: ((Error) -> Void)? = nil
  ) -> AnyPublisher<Content, Error> {
    self.deferred(
      onSuccess: onSuccess,
      onError: onError
    )
    .eraseToAnyPublisher()
  }
}
