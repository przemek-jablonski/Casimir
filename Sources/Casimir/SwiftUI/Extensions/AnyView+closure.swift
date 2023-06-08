import SwiftUI

public extension AnyView {
  init<WrappedView: View>(closure: () -> WrappedView) {
    self.init(closure())
  }
}
