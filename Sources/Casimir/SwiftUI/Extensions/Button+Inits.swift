import SwiftUI

extension Button {
    public init(label: Label, action: @escaping () -> Void) {
        self.init(action: action, label: { label })
    }

    public init(toggling: Binding<Bool>, label: () -> Label) {
        self.init(action: { toggling.wrappedValue.toggle() }, label: label)
    }
}
