import Foundation

public extension String {
    var trimmingWhitespaces: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
