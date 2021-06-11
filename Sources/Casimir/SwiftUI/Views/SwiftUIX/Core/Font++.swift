//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

public extension SwiftUI.Font {
    var textStyle: SwiftUI.Font.TextStyle {
        switch self {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .body:
            return .body
        case .callout:
            return .callout
        case .footnote:
            return .footnote
        case .caption:
            return .caption
        default:
            return .body
        }
    }
}

#if canImport(UIKit)
public extension SwiftUI.Font {
    var native: UIKit.UIFont? {
        .preferredFont(forTextStyle: textStyle.native)
    }
}
#endif


#if canImport(AppKit)
public extension SwiftUI.Font {
    var native: AppKit.NSFont? {
        .preferredFont(forTextStyle: textStyle.native, options: [:])
    }
}
#endif
