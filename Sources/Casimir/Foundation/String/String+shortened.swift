import Foundation

public extension String {
    func shortened(upTo length: Int, trailing: String = "...") -> String {
        (self.count > length) ? self.prefix(length) + trailing : self
    }
}
