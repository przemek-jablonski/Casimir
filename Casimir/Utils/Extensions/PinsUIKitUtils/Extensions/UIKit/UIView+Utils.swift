import UIKit

public extension UIView {

    func setHidden(_ hidden: Bool) {
        if isHidden != hidden { isHidden = hidden }
    }

    func setVisible(_ visible: Bool) {
        setHidden(!visible)
    }

    /**
        Unarchives and loads contents of user interfaces from .nib file, optionally
        specifying `Bundle` to load the data from.

        - Note: This is shorthand for `bundle.loadNibNamed(:owner:options:)`
        - Attention: Bundle argument is inferred by default as `Bundle.main`,
        unless specified explicitely.
        Nib name is inferred from `UIView.nibName()` extension.
     */
    func loadNib(using bundle: Bundle? = nil) {
        (bundle ?? Bundle(for: type(of: self))).loadNibNamed(nibName(), owner: self, options: nil)
    }

}
