import SwiftUI

public extension Button {
    init(label: Label, action: @escaping () -> Void) {
        self.init(action: action, label: { label })
    }

    init(toggling: Binding<Bool>, label: () -> Label) {
        self.init(action: { toggling.wrappedValue.toggle() }, label: label)
    }
}
