import UIKit

public extension UIStackView {
    @discardableResult
    func removeAllArrangedSubviews() -> UIStackView {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
        return self
    }
}
