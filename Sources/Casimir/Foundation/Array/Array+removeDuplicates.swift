public extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        Casimir.removeDuplicates(source: self)
    }
}

public func removeDuplicates<S: Sequence, T: Hashable>(source: S) -> [T] where S.Iterator.Element == T {
    var buffer = [T]()
    var added = Set<T>()
    for elem in source {
        if !added.contains(elem) {
            buffer.append(elem)
            added.insert(elem)
        }
    }
    return buffer
}
