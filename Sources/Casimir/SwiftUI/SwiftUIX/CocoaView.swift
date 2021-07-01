//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI
//swiftlint:disable all
public protocol CocoaView: View {
    func isFirstResponder(_: Bool) -> Self
}
