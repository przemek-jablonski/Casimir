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

public extension Array where Element: Identifiable {
    var dictionary: [Element.ID: Element] {
        reduce(into: .init()) { $0[$1.id] = $1 }
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

public extension Set where Element: Identifiable {
    var dictionary: [Element.ID: Element] {
        reduce(into: .init()) { $0[$1.id] = $1 }
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

public extension AnyCollection where Element: Identifiable {
    var dictionary: [Element.ID: Element] {
        reduce(into: .init()) { $0[$1.id] = $1 }
    }
}
