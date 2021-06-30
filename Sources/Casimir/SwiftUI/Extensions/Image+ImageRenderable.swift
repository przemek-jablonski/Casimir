#if canImport(UIKit) && os(iOS)
// unavailability: macOS, tvOS, watchOS: needs testing on those platforms + init(uiImageNamed:...) overload for those OSs
import SwiftUI
public extension Image {
    init?(_ renderable: ImageRenderable?) {
        switch renderable {
        case .asset(let name):
            self.init(name)
        case .file(let name, let bundle):
            self.init(uiImageNamed: name, bundle: bundle) { }
        case .sfSymbol(let name):
            self.init(systemName: name)
        case .none:
            return nil
        }
    }
}
#endif
