import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
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
