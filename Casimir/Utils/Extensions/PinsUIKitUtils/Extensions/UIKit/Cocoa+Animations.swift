import UIKit

public extension UIView {
    func animate(
        fadeInWithDuration duration: TimeInterval,
        andDelay delay: TimeInterval? = nil,
        andPerformOnCompletion completion: ((Bool) -> Void)? = nil) {

        UIView.animate(
            withDuration: duration,
            delay: delay ?? 0,
            options: [],
            animations: { self.alpha = 1.0 },
            completion: completion)
    }

    func animate(
        fadeOutWithDuration duration: TimeInterval,
        andDelay delay: TimeInterval? = nil,
        andPerformOnCompletion completion: ((Bool) -> Void)? = nil) {
        setHidden(true)
        UIView.animate(
            withDuration: duration,
            delay: delay ?? 0,
            options: [],
            animations: { self.alpha = 0.0 },
            completion: completion)
    }
}

public extension NSLayoutConstraint {
    func animate(
        constantValueChangeTo valueChange: CGFloat,
        withConstraintedView view: UIView,
        andDuration duration: TimeInterval,
        andPerformOnCompletion completion: ((Bool) -> Void)? = nil) {
        self.constant = valueChange
        UIView.animate(withDuration: duration, animations: { view.layoutIfNeeded() }, completion: completion)
    }
}

public func animate(
    _ view: UIView,
    fadeInWithDuration duration: TimeInterval,
    andPerformOnCompletion completion: ((Bool) -> Void)? = nil) {
    view.animate(
        fadeInWithDuration: duration,
        andPerformOnCompletion: completion)
}

public func animate(
    _ view: UIView,
    fadeOutWithDuration duration: TimeInterval,
    andPerformOnCompletion completion: ((Bool) -> Void)? = nil) {
    view.animate(
        fadeOutWithDuration: duration,
        andPerformOnCompletion: completion)
}

public func animate(
    _ constraint: NSLayoutConstraint,
    constantValueChangeTo valueChange: CGFloat,
    withConstraintedView view: UIView,
    andDuration duration: TimeInterval,
    andPerformOnCompletion completion: ((Bool) -> Void)? = nil) {
    constraint.animate(
        constantValueChangeTo: valueChange,
        withConstraintedView: view,
        andDuration: duration,
        andPerformOnCompletion: completion)
}
