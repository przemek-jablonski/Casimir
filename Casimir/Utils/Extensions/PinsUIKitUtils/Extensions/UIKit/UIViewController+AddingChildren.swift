import UIKit

extension UIViewController {
    /**
        Adds `viewController` (method argument) as a child to `self` (parent UIViewController),
        assigning viewController's `view` as a subview of `placeholder`.
     */
    @discardableResult func add<T: UIViewController>(child viewController: T, toPlaceholder placeholder: UIView) -> T {
        addChild(viewController)
        placeholder.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        return viewController
    }
}
