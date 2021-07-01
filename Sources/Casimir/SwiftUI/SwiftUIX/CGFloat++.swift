//
//  Copyright (c) FamPay
//

import CoreGraphics

//swiftlint:disable all
public extension CGFloat {
    func pixelsToPoints() -> CGFloat {
        return self / Screen.main.scale
    }
    
    static func onePixelInPoints() -> CGFloat {
        return Self(1).pixelsToPoints()
    }
}
