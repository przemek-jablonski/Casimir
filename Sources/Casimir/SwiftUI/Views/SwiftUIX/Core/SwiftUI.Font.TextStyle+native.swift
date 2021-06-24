//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

#if canImport(UIKit)
public extension SwiftUI.Font.TextStyle {
    var native: UIKit.UIFont.TextStyle {
        switch self {
        #if !os(tvOS)
        case .largeTitle:
            return .largeTitle
        #endif
        case .title:
            return .title1
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .callout:
            return .callout
        case .footnote:
            return .footnote
        case .caption:
            return .caption1
        default:
            return .body
        }
    }
}
#endif

#if os(macOS)
@available(macOS, introduced: 11.0, message: "return type (NSFont.TextStyle) is available on 11.0+")
public extension SwiftUI.Font.TextStyle {
    var native: AppKit.NSFont.TextStyle {
        switch self {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title1
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .callout:
            return .callout
        case .footnote:
            return .footnote
        case .caption:
            return .caption1
        default:
            return .body
        }
    }
}
#endif
