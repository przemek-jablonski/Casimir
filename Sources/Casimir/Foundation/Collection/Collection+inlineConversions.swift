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
  /// Converts array to a dictionary, where the `id` of the `Element` becomes the `key` of the dictionary.
  ///
  /// - Note: if the array contains duplicated `id`s (given element `id` value is present more than once), then
  /// the last element bearing duplicated `id` will be present in dictionary, while any previous occurrences will be discarded.
  /// ```
  /// [
  ///  { id: 0, value: 0 },
  ///  { id: 1, value: 1 },
  ///  { id: 2, value: 2 },
  ///  { id: 2, value: 3 }, // another element with id of 2
  /// ]
  ///
  /// // converts to:
  ///
  /// [
  ///  0: 0,
  ///  1: 1,
  ///  2: 3
  /// ]
  /// ```
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
