//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

public extension Text {
    func kerning(_ kerning: CGFloat?) -> Text {
        kerning.map(self.kerning) ?? self
    }
}
