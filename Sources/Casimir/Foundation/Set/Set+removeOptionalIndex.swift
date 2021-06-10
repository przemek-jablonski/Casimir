public extension Set {
    mutating func remove(_ optionalIndex: Set<Element>.Index?) -> Element? {
        guard let index = optionalIndex else {
            return nil
        }
        return remove(at: index)
    }
}
