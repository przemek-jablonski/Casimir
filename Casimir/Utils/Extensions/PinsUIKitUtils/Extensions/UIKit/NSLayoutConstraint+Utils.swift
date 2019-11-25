import UIKit

public extension NSLayoutConstraint {

    @discardableResult convenience init(
        item view1: UIView,
        attribute attr1: NSLayoutConstraint.Attribute,
        relatedBy relation: NSLayoutConstraint.Relation,
        toItem view2: UIView,
        attribute attr2: NSLayoutConstraint.Attribute,
        multiplier: CGFloat,
        constant: CGFloat,
        activate: Bool,
        andAddTo parentView: UIView?) {
        self.init(
            item: view1,
            attribute: attr1,
            relatedBy: relation,
            toItem: view2,
            attribute: attr2,
            multiplier: multiplier,
            constant: constant)
        self.isActive = activate
        parentView?.addConstraint(self)
    }

    var firstView: UIView? {
        return self.firstItem as? UIView
    }

    var secondView: UIView? {
        return self.secondItem as? UIView
    }

    var firstViewWithAttribute: (view: UIView, attribute: NSLayoutConstraint.Attribute)? {
        guard let view = firstView else { return nil }
        return (view, firstAttribute)
    }

    var secondViewWithAttribute: (view: UIView, attribute: NSLayoutConstraint.Attribute)? {
        guard let view = secondView else { return nil }
        return (view, secondAttribute)
    }

    class func fit(_ child: UIView, in parent: UIView) {
        equalConstraint(for: child, and: parent, with: .leading).isActive = true
        equalConstraint(for: child, and: parent, with: .trailing).isActive = true
        equalConstraint(for: child, and: parent, with: .top).isActive = true
        equalConstraint(for: child, and: parent, with: .bottom).isActive = true
    }

    class func equalConstraint(
        for item: UIView,
        and secondItem: UIView,
        with attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item,
            attribute: attribute,
            relatedBy: .equal,
            toItem: secondItem,
            attribute: attribute,
            multiplier: 1.0,
            constant: 0)
    }

    @discardableResult class func place(
        bottomOf view1: UIView,
        atTheTopOf view2: UIView,
        addingTo parentView: UIView? = nil) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: view1,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view2,
            attribute: .top,
            multiplier: 1.0,
            constant: 0.0,
            activate: true,
            andAddTo: parentView
        )
    }

}

public extension UIView {
    func fitIntoParent(child view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = self.frame
        NSLayoutConstraint.fit(view, in: self)
    }
}
