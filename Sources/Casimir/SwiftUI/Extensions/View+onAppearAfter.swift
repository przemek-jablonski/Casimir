import SwiftUI

public extension View {
  func onAppear(
    after delay: DispatchTime,
    perform operations: @escaping () -> Void
  ) -> some View {
    onAppear(perform: {
      DispatchQueue.main.asyncAfter(deadline: delay, execute: operations)
    })
  }
}
