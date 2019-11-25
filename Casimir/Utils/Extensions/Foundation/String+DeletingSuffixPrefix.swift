import Foundation

extension String {

    /**
     Returns a String which doesn't contain `prefix` parameter at the beginning.
     */
    func dropPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }

    /**
     Returns a String which doesn't contain `suffix` parameter at the end.
     */
    func dropSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}
