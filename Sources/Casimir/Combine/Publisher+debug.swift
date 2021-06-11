import Combine

public extension Publisher {
    func debug(_ receiveEvent: @escaping (SubscriptionEvent<Output, Failure>) -> ()) -> AnyPublisher<Output, Failure> {
        handleEvents(receiveSubscription: { _ in receiveEvent(.subscription) },
                     receiveOutput: { receiveEvent(.output($0)) },
                     receiveCompletion: { receiveEvent(.completion($0)) },
                     receiveCancel: { receiveEvent(.cancel) })
            .eraseToAnyPublisher()
    }
}

public enum SubscriptionEvent<Output, Failure: Error> {
    case subscription
    case output(Output)
    case completion(Subscribers.Completion<Failure>)
    case cancel
    case request(Subscribers.Demand)
}
