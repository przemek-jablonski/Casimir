import Combine

extension Single {
    private func future(onSuccess: ((Content) -> ())? = nil,
                        onError: ((Error) -> ())? = nil) -> Future<Content, Error> {
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

    private func deferred(onSuccess: ((Content) -> ())? = nil,
                          onError: ((Error) -> ())? = nil) -> Deferred<Future<Content, Error>> {
        Deferred { self.future(onSuccess: onSuccess, onError: onError) }
    }

    public func publisher(onSuccess: ((Content) -> ())? = nil,
                          onError: ((Error) -> ())? = nil) -> AnyPublisher<Content, Error> {
        self.deferred(onSuccess: onSuccess, onError: onError).eraseToAnyPublisher()
    }
}
