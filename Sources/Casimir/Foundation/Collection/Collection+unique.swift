import Foundation

public extension Sequence where Iterator.Element: Hashable & Identifiable {
  func unique() -> [Iterator.Element] {
    var seenIds: [Iterator.Element.ID: Bool] = [:]
    var seenElements: [Iterator.Element: Bool] = [:]
    return self.filter {
      seenIds.updateValue(true, forKey: $0.id) == nil && seenElements.updateValue(true, forKey: $0) == nil
    }
  }
}
