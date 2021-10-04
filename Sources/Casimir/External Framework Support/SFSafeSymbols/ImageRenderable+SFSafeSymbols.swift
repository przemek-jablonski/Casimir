#if canImport(SFSafeSymbols)
import Foundation
import SwiftUI
import SFSafeSymbols

internal extension ImageRenderable {
    init(image symbol: SFSymbol) {
        self = .sfSymbol(symbol.rawValue)
    }
}
#endif
