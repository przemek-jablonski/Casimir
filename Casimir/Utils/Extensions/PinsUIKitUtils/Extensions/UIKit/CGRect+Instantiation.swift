import Foundation
import CoreGraphics

//swiftlint:disable identifier_name
public extension CGRect {

    /**
     Convenience method for instantiating copy of given `CGRect`. All parameters are optional with default value,
     so changing single or multiple values is more idiomatic than with usual `copy(with:)`.

     - Returns: Modified `CGRect`.
     */
    func copyChanging(
        x: CGFloat? = nil,
        y: CGFloat? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil) -> CGRect {
        return CGRect(
            x: x ?? self.origin.x,
            y: y ?? self.origin.y,
            width: width ?? self.size.width,
            height: height ?? self.size.height)
    }

}
