import SwiftUI

public extension GeometryProxy {
    var smallerDimension: CGFloat {
        min(size.width, size.height)
    }
    
    var isNotched: Bool {
        safeAreaInsets.bottom > 0
    }
    
    var isNotchless: Bool {
        !isNotched
    }
}
