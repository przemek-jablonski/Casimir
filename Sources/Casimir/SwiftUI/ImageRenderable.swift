import SwiftUI

public enum ImageRenderable: Hashable {
    case file(FileNameNoExtension, Bundle? = nil)
    case asset(AssetNameNoExtension)
    case sfSymbol(String)
}
