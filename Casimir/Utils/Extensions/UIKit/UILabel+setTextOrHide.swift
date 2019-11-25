import UIKit

extension UILabel {
    func setTextOrHide(_ text: String?) {
        if let text = text, !text.isEmptyNoWhitespaces {
            self.text = text
            setHidden(false)
        } else {
            setHidden(true)
        }
    }
}
