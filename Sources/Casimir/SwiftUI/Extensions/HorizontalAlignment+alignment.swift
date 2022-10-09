import SwiftUI

public extension HorizontalAlignment {
    var alignment: Alignment {
        switch self {
        case .leading: return .leading
        case .trailing: return .trailing
        default: return .center
        }
    }

    var invertedAlignment: Alignment {
        switch self {
        case .leading: return .trailing
        case .trailing: return .leading
        default: return .center
        }
    }

    var isCenter: Bool { self == .center }
    var isLeading: Bool { self == .leading }
    var isTrailing: Bool { self == .trailing }
}
