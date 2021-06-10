import SwiftUI

public extension View {
    func frame(_ font: Font?) -> some View {
        frame(font?.size)
    }
}

private extension Font {
    var size: CGSize? {
        guard let pointSize = toUIFont()?.pointSize else { return nil }
        return CGSize(width: pointSize, height: pointSize)
    }
}
