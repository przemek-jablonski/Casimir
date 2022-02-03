import SwiftUI

#if canImport(UIKit)
public extension SwiftUI.Font {
    var height: CGFloat {
        self.native?.lineHeight ?? 0
    }
}
#endif

#if canImport(AppKit)
public extension SwiftUI.Font {
    var height: CGFloat {
        (self.native?.ascender ?? 0) + (self.native?.descender ?? 0)
    }
}
#endif
