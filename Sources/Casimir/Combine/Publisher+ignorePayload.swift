import Combine
import Foundation

public extension Publisher {
  /**
   Returns stream which has it's `Output` value erased (replaced with `Void`). `Output` event itself will still propagate downstream normally.
   */
  func ignorePayload() -> AnyPublisher<Void, Failure> {
    self.map({ _ in () }).erased()
  }
}
