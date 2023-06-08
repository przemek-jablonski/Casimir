#if canImport(SFSafeSymbols)
import Foundation
import SFSafeSymbols
import SwiftUI

internal extension ImageRenderable {
  init(image symbol: SFSymbol) {
    self = .sfSymbol(symbol.rawValue)
  }
}
#endif
