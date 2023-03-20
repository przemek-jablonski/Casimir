import SwiftUI

public extension View {
  func erased() -> AnyView {
    AnyView(self)
  }
}
