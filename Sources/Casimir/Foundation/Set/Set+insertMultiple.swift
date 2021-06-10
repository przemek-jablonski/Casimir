import Foundation

public extension Set where Element: Hashable {
    @discardableResult
    mutating func insert(_ multiple: [Element]) -> [(Bool, Element)] {
        multiple.map({ element in self.insert(element) })
    }
}
