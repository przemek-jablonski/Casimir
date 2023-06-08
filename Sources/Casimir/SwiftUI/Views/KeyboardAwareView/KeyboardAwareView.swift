#if canImport(UIKit) && !os(tvOS) && !os(watchOS)
// unavailability: tvOS: keyboardHeight field of NotificationCenter is not available in this OS
// unavailability: watchOS: keyboardHeight field of NotificationCenter is not available in this OS
import SwiftUI
import UIKit

/*
 View which will add bottom padding to the `content` exactly the height of soft keyboard, if present.
 */
public struct KeyboardAwareView<Content: View>: View {
  @State private var keyboardHeight = CGFloat(0)
  var extraPadding: CGFloat = 0
  let content: () -> Content

  public var body: some View {
    content()
      .padding(.bottom, keyboardHeight + extraPadding)
      .onReceive(NotificationCenter.default.keyboardHeight) {
        self.keyboardHeight = $0
      }
      .animation(.easeOut(duration: 0.18))
  }
}
#endif
