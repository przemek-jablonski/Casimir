import CoreGraphics
import Foundation

public extension CGRect {

    func asString(debug: Bool = false) -> String {
        if debug {
            return self.debugDescription
        } else {
            return NSCoder.string(for: self)
        }
    }

}
