import UIKit

public typealias UITableViewRequirements = UITableViewDelegate & UITableViewDataSource

public extension UITableView {
    /**
        Shorthand for registering UINib-based cells in UITableView based on UITableViewCell subtype.

        - Note: Name of the nib and reuseIdentifier are assumed to be equivalent and fetched from
        .nibName() UITableViewCell class' extension.
     */
    @discardableResult
    func register<T: UITableViewCell>(nibFor cellType: T.Type) -> UITableView {
        register(
            UINib(nibName: cellType.nibName(), bundle: Bundle(for: cellType)),
            forCellReuseIdentifier: cellType.nibName()
        )
        return self
    }

    /**
       Shorthand for registering non-UINib-based cells (with layout created programatically) in UITableView
        based on UITableViewCell subtype.

       - Note: Reuse identifier will be assigned with value of `className`.
    */
    @discardableResult
    func register<T: UITableViewCell>(forClass type: T.Type) -> UITableView {
        register(type, forCellReuseIdentifier: type.cellReuseIdentifier)
        return self
    }

    /**
        Removes separators when UITableView is empty (that is, when UITableViewDataSource returns
        zero as an elements count).

     - Warning:
        Uses a widely known 'hack', where tableFooterView is set to a plain UIView instance.
        Thus, it will overload any assignment previously made to this property.
        Also, this trick will stop working if tableFooterView will get re-assigned in the future.
     */
    @discardableResult
    func removeSeparatorsWhenEmpty() -> UITableView {
        tableFooterView = UIView()
        return self
    }
}
