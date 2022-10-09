import Combine

public extension Publisher {
    func on(event closure: @escaping (PublisherEvent<Output, Failure>) -> Void) -> Publishers.HandleEvents<Self> {
        handleEvents(
            receiveSubscription: { _ in closure(.subscription) },
            receiveOutput: { closure(.output($0)) },
            receiveCompletion: { closure(.completion($0)) },
            receiveCancel: { closure(.cancel) }
        )
    }

    func onSubscription(_ closure: @escaping (() -> Void)) -> Publishers.HandleEvents<Self> {
        on { event in
            if case PublisherEvent.subscription = event {
                closure()
            }
        }
    }

    func onOutput(_ closure: @escaping ((Output) -> Void)) -> Publishers.HandleEvents<Self> {
        on { event in
            if case let PublisherEvent.output(output) = event {
                closure(output)
            }
        }
    }

    func onError(_ closure: @escaping ((Failure) -> Void)) -> Publishers.HandleEvents<Self> {
        on { event in
            if case PublisherEvent.completion(let completion) = event,
               case let Subscribers.Completion.failure(error) = completion {
                closure(error)
            }
        }
    }

    func onCompletion(_ closure: @escaping (() -> Void)) -> Publishers.HandleEvents<Self> {
        on { event in
            if case PublisherEvent.completion(let completion) = event,
               case Subscribers.Completion.finished = completion {
                closure()
            }
        }
    }

    func onCancel(_ closure: @escaping (() -> Void)) -> Publishers.HandleEvents<Self> {
        on { event in
            if case PublisherEvent.cancel = event {
                closure()
            }
        }
    }
}
