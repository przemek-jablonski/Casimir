import Foundation

// swiftlint:disable discouraged_optional_collection
public func + <Key: Hashable, Value>(
  lhs: [Key: Value]?,
  rhs: [Key: Value]?
) -> [Key: Value] {
  var updated = lhs ?? [:]
  rhs?.forEach { (key, value) in
    updated[key] = value
  }
  return updated
}
// swiftlint:enable discouraged_optional_collection
