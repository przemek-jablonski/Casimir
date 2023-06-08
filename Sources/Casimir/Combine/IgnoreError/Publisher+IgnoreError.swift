import Combine

public extension Publisher {
  /**
   Ignores any errors emitted by the receiver. Replaces error instance with no-emission Publisher (`Empty`)
   */
  func ignoreError() -> some Publisher<Output, Never> {
    self.`catch` { _  in Empty() }
  }
}
