import SwiftUI

public extension SwiftUI.Font {
    var height: CGFloat {
        self.native?.lineHeight ?? 0
    }
}
