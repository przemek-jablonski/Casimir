//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift
//swiftlint:disable all
extension NSObjectProtocol {
    func then(_ body: (Self) -> Void) -> Self {
        body(self)
        
        return self
    }
}
