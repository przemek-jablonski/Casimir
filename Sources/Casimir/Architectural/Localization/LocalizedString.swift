import Foundation

/** Struct for storing and performing operations on Strings which are pulled from `Localizable.plist`-like files.

 `init` and stored objects are protected from direct access and instantiation.
 Use public extension to generate `LocalizedString` object, like so:

 `"string_key_from_localizable_plist".localized`

 */
public struct LocalizedString {
  internal let string: String
  internal let error: Error?

  public var lowercased: String {
    string.localizedLowercase
  }

  // TODO: check usages of .localized.uppercased, because using this in my case is probably a mistake
  public var uppercased: String {
    string.localizedUppercase
  }

  public var capitalizedAllWords: String {
    string.localizedCapitalized.capitalized
  }

  public var capitalized: String {
    string.uppercasedFirst
  }

  public var asIs: String {
    string
  }
}

extension LocalizedString: Hashable {
  public static func == (lhs: LocalizedString, rhs: LocalizedString) -> Bool {
    lhs.string == rhs.string
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(string)
  }
}
