import SwiftUI

public extension View {
    func colorInvert(if condition: Bool) -> AnyView {
        if condition {
            return colorInvert().erased()
        }
        return erased()
    }
}
