import SwiftUI

@available(iOS, introduced: 13.4, message: "restricted by internal onHover modifier OS availability")
@available(macOS, introduced: 10.15, message: "restricted by internal onHover modifier OS availability")
@available(macCatalyst, introduced: 13.4, message: "restricted by internal onHover modifier OS availability")
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public extension View {
    func onHover(toggling: Binding<Bool>) -> some View {
        onHover { toggling.wrappedValue = $0 }
    }
}
