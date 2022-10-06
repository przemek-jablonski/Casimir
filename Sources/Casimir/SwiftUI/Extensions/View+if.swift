import SwiftUI

public extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return content(self).erased()
        } else {
            return self.erased()
        }
    }

    func `if`<Content: View>(_ content: ((Self) -> Content)?) -> some View {
        if let content = content {
            return content(self).erased()
        }
        return self.erased()
    }
}
