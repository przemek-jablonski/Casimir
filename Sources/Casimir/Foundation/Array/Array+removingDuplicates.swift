public extension Array where Element: Hashable {
  /**
   Removes duplicate items from the Array, preserving order of items.
   */
  func removingDuplicates() -> [Element] {
    Casimir.removingDuplicates(
      source: self
    )
  }
}

/**
 Removes duplicate items from the Sequence, preserving order of items.
 */
public func removingDuplicates<S: Sequence, T: Hashable>(
  source: S
) -> [T] where S.Iterator.Element == T {
  var buffer = [T]()
  var added = Set<T>()
  for elem in source where !added.contains(elem) {
    buffer.append(elem)
    added.insert(elem)
  }
  return buffer
}
