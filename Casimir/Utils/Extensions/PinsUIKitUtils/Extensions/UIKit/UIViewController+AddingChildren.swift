//
//  UIViewController+AddingChildren.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 21/05/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

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
