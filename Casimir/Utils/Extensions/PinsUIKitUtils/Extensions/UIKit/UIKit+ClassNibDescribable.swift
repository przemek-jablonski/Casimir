import UIKit

public protocol ClassNibDescribable: UIResponder {
    var className: String { get }
    static var className: String { get }
    func nibName() -> String
    static func nibName() -> String
}

public extension ClassNibDescribable {
    var className: String {
        return String(describing: type(of: self))
    }

    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static func nibName() -> String {
        return self.className
    }

    func nibName() -> String {
        return className
    }
}

extension UIView: ClassNibDescribable {}

extension UIViewController: ClassNibDescribable {}

public extension UITableViewCell {
    public var cellReuseIdentifier: String {
        return nibName()
    }
    public static var cellReuseIdentifier: String {
        return nibName()
    }
}
