//public extension Array where Element: Hashable {
//  /**
//   Removes duplicate items from the Array, preserving order of items.
//   */
//  func unique() -> Self {
//    Casimir.unique(source: self)
//  }
//}
//
///**
// Removes duplicate items from the Sequence, preserving order of items.
// */
//internal func unique<S: Sequence, T: Hashable>(
//  source: S,
//  comparison: (_ alreadyAdded: Set<T>, _ candidate: T) -> Bool = { alreadyAdded, candidate in
//    !alreadyAdded.contains(candidate)
//  }
//) -> [T] where S.Iterator.Element == T {
//  var buffer = [T]()
//  var added = Set<T>()
//  for elem in source {
//    if comparison(added, elem) {
//      buffer.append(elem)
//      added.insert(elem)
//    }
//  }
//  return buffer
//}
