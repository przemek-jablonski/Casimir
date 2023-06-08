import Foundation

public extension Hasher {
  @discardableResult
  mutating func combine<H>(_ value: H...) -> Hasher where H: Hashable {
    value.forEach { combine($0) }
    return self
  }
}
