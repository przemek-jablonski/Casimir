import Foundation

public extension String {
    var url: URL? {
        URL(string: self)
    }
}
