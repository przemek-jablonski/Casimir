#if canImport(UIKit)
import SwiftUI
import UIKit

public extension Image {
    init?(uiImageNamed name: String, bundle: Bundle? = nil, failure: (() -> ())? = nil) {
        guard let image = UIImage(named: "\(name).png", in: bundle, with: nil) else {
            failure?()
            return nil
        }
        self.init(uiImage: image)
    }
}
#endif
