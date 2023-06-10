import Foundation

extension LocalizedString: Hashable {
  public static func == (lhs: LocalizedString, rhs: LocalizedString) -> Bool {
    lhs.string == rhs.string
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(string)
  }
}
