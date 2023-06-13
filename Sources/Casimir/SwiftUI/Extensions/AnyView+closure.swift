import SwiftUI

public extension AnyView {
  /**
   Creates an instance that type-erases view.
   */
  init<WrappedView: View>(
    closure: () -> WrappedView
  ) {
    self.init(
      closure()
    )
  }
}
