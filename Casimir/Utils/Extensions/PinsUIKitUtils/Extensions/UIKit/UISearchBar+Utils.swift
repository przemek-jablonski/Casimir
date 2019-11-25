import UIKit

extension UISearchBar {

    public func setShowsCancelButton(showsCancelButtonIfNotCancelled: Bool, animated: Bool) {
        if self.showsCancelButton != showsCancelButtonIfNotCancelled {
            self.setShowsCancelButton(showsCancelButtonIfNotCancelled, animated: animated)
        }
    }

    @discardableResult public func clearText() -> UISearchBar {
        self.text = emptyString
        return self
    }

    public func endEditing(withFirstResponderCheck check: Bool = false) {
        if check {
            if self.isFirstResponder { self.endEditing(true) }
        } else {
            self.endEditing(true)
        }
    }

}
