//import UIKit
//
//public protocol UIAlertControllerTextFieldInputChangedDelegate: class {
//    func inputChanged(for textField: UITextField)
//}
//
//public extension UIAlertController {
//
//    private weak var inputChangeCallback: UIAlertControllerTextFieldInputChangedDelegate?
//
//    func addTextField(withPlaceholder text: String, inputChangeCallback callback: UIAlertControllerTextFieldCallback? = nil) {
//        addTextField {
//            $0.placeholder = text
//            if let callback = callback {
//                self.inputChangeCallback = callback
//                $0.addTarget(self, action: #selector(self.inputChanged(in:)), for: .allEditingEvents)
//            }
//        }
//    }
//
//    @objc private func inputChanged(in textField: UITextField) {
//        inputChangeCallback?(textField.text)
//    }
//}
