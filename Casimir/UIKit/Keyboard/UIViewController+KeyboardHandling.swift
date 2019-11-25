import UIKit

//TODO: this should be in PinsViewController directly or using some component or something
public extension UIViewController {

    func trackKeyboardForResizing(with notificationCenter: NotificationCenter = NotificationCenter.default) {
        configure(object: notificationCenter) {
            $0.observeKeyboardWillShow(self, with: #selector(keyboardWillShow))
            $0.observeKeyboardWillHide(self, with: #selector(keyboardWillHide))
        }
    }

    func stopTrackingKeyboardForResizing(with notificationCenter: NotificationCenter = NotificationCenter.default) {
        configure(object: notificationCenter) {
            $0.stopObservingKeyboardWillShow(self)
            $0.stopObservingKeyboardWillHide(self)
        }
    }

    @objc private func keyboardWillShow(notification: Notification) {
        if let height = notification.getKeyboardHeight() {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= height
            }
        }
    }

    @objc private func keyboardWillHide(notification: Notification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}
