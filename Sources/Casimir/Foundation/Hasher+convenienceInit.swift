import Foundation

public extension Hasher {
  init<H>(_ values: H...) where H: Hashable {
    self.init()
    combine(values)
  }
}
