import SwiftUI

public extension VerticalAlignment {
    var alignment: Alignment {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        default: return .center
        }
    }
    
    var isTop: Bool { self == .top }
    var isBottom: Bool { self == .bottom }
}
