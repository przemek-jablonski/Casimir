import Foundation
import CoreGraphics

//swiftlint:disable identifier_name
public extension CGRect {

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
