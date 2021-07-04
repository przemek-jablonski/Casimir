import Foundation

public extension Sequence where Element == UnicodeScalar {
    var unicodeScalarView: String.UnicodeScalarView {
        String.UnicodeScalarView(self)
    }
}

public extension String.UnicodeScalarView {
    var string: String {
        String(self)
    }
}
