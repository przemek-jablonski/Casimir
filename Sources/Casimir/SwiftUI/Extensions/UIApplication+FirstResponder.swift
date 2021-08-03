#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIApplication {
    func resignFirstResponder() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func becomeFirstResponder() {
        sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
