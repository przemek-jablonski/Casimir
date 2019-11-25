//
//  Notifications+KeyboardHandling.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 10/04/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

import UIKit
import CoreGraphics

extension NotificationCenter {

    func observeKeyboardWillShow(_ observer: Any, with selector: Selector) {
        self.addObserver(
            observer,
            selector: selector,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
    }

    func stopObservingKeyboardWillShow(_ observer: Any) {
        self.removeObserver(
            observer,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
    }

    func observeKeyboardWillHide(_ observer: Any, with selector: Selector) {
        self.addObserver(
            observer,
            selector: selector,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    func stopObservingKeyboardWillHide(_ observer: Any) {
        self.removeObserver(
            observer,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

}

extension Notification {

    func getKeyboardSize() -> CGRect? {
        return (self.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }

    func getKeyboardHeight() -> CGFloat? {
        return getKeyboardSize()?.height
    }

}
