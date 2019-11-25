import UIKit

public extension UIControl {

    /**
        Shorthand for adding selector target for .touchUpInside event.
     */
    func addClickTarget(_ target: Any, action selector: Selector) {
        self.addTarget(target, action: selector, for: .touchUpInside)
    }

    /**
        Shorthand for removing all selector targets.
     */
    func removeAllClickTargets() {
        self.removeTarget(nil, action: nil, for: .allEvents)
    }
}

public extension UIViewController {
    func addClickTargets(to items: [UIControl: Selector]) {
        items.forEach { $0.addClickTarget(self, action: $1) }
    }

    func removeAllClickTargets(from items: [UIControl]) {
        items.forEach { $0.removeAllClickTargets() }
    }
}
