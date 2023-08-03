import Combine

public extension Set where Element == AnyCancellable {
  /**
   Cancels all activities stored in this `Set`.
   */
  func cancelAll() {
    forEach { $0.cancel() }
  }
}
