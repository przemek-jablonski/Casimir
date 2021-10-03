import Foundation

// MARK: - Array
public extension Array {
    var collection: AnyCollection<Element> {
        AnyCollection(self)
    }
}

public extension Array where Element: Hashable {
    var set: Set<Element> {
        Set(self)
    }
}

// MARK: - Set
public extension Set {
    var array: [Element] {
        Array(self)
    }
    
    var collection: AnyCollection<Element> {
        AnyCollection(self)
    }
}

// MARK: - AnyCollection
public extension AnyCollection {
    var array: [Element] {
        Array(self)
    }
}

public extension AnyCollection where Element: Hashable {
    var set: Set<Element> {
        Set(self)
    }
}
