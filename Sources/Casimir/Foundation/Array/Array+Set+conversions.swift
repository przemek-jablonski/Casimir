import Foundation

public extension Array where Element: Hashable {
    var set: Set<Element> {
        Set(self)
    }
}

public extension Set where Element: Hashable {
    var array: [Element] {
        Array(self)
    }
}
