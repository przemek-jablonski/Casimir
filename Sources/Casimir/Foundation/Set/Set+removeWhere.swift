import Foundation

public extension Set {
    mutating func removedFirst(where matches: (Element) -> Bool) -> Element? {
        guard let index = firstIndex(where: matches) else {
            return nil
        }
        return remove(at: index)
    }
    
    mutating func removeFirst(where matches: (Element) -> Bool) {
        _ = removedFirst(where: matches)
    }
}
