import Foundation

extension Sequence {
  /**
   Sorts the sequence using the Element's `keyPath`
   */
  public func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
    return sorted { elementA, elementB in
      return elementA[keyPath: keyPath] < elementB[keyPath: keyPath]
    }
  }
}
