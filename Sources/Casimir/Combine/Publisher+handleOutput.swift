import Combine

public extension Publisher {
    func handleEvents(receiveOutput: @escaping ((Self.Output) -> Void)) -> Publishers.HandleEvents<Self> {
        handleEvents(receiveSubscription: nil,
                     receiveOutput: { receiveOutput($0) },
                     receiveCompletion: nil,
                     receiveCancel: nil,
                     receiveRequest: nil)
    }
    
    func handleEvents(_ closure: @escaping (PublisherEvent<Output, Failure>) -> ()) -> Publishers.HandleEvents<Self> {
        handleEvents(receiveSubscription: { _ in closure(.subscription) },
                     receiveOutput: { closure(.output($0)) },
                     receiveCompletion: { closure(.completion($0)) },
                     receiveCancel: { closure(.cancel) })
    }
}

public typealias PrintOutput = Bool
public enum PublisherEvent<Output, Failure: Error>: CustomStringConvertible {
    case subscription
    case output(Output)
    case completion(Subscribers.Completion<Failure>)
    case cancel
    
    @inline(__always)
    public func ifOutput(_ closure: (Output) -> (String)) -> String {
        if case let PublisherEvent.output(output) = self {
            return closure(output)
        }
        return String(describing: self)
    }
    
    @inline(__always)
    public func ifOutput(_ closure: (Output) -> ([String])) -> String {
        if case let PublisherEvent.output(output) = self {
            return closure(output).joined(separator: ", ")
        }
        return String(describing: self)
    }
    
    public var description: String {
        switch self {
        case .subscription:
            return "subscription"
        case .output:
            return "output"
        case .completion(let completion):
            return "completion(\(completion))"
        case .cancel:
            return "cancel"
        }
    }
}
