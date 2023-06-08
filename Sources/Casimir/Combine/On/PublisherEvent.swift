import Combine

public enum PublisherEvent<Output, Failure: Error>: CustomStringConvertible {
  case subscription
  case output(Output)
  case completion(Subscribers.Completion<Failure>)
  case cancel
  case request(Subscribers.Demand)

  public var description: String {
    switch self {
    case .subscription: return "subscription"
    case .output(let output): return "output(\(output))"
    case .completion(let completion): return "completion(\(completion))"
    case .cancel: return "cancel"
    case .request: return "request"
    }
  }
}

// extension PublisherEvent: Equatable {
//    public static func == (
//        lhs: PublisherEvent<Output, Failure>,
//        rhs: PublisherEvent<Output, Failure>
//    ) -> Bool {
//        switch (lhs, rhs) {
//        case (.subscribed, .subscribed): return true
//        case (.output, .output): return true
//        case (.completed, .completed): return true
//        case (.errored, .errored): return true
//        case (.cancelled, .cancelled): return true
//        default: return false
//        }
//    }
// }
