import SwiftUI

public extension Text {
  /**
   Centers the `Text` inside the parent View, instead of it being always leading-aligned.
   */
  func center() -> some View {
    frame(maxWidth: .infinity, alignment: .center)
  }
}
