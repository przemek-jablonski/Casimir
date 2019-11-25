import Foundation

public extension Array where Element: Equatable {
    func distinct() -> [Element] {
        self.reduce(into: []) { uniqueElements, element in
            if !uniqueElements.contains(element) {
                uniqueElements.append(element)
            }
        }
    }

    func distinct(using comparer: (Element, Element) -> Bool) -> [Element] {
        reduce(into: [Element]()) { (uniqueElements, element) in
            if (!uniqueElements.contains { existingElement -> Bool in
                comparer(existingElement, element)
                }) {
                uniqueElements.append(element)
            }
        }
    }
}
