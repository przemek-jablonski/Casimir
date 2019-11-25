import Foundation

public extension String {
    @discardableResult
    mutating func add(_ string: String?) -> String {
        if let string = string {
            append(string)
        }
        return self
    }
}
