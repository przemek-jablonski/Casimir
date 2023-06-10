import Foundation

/** Struct for storing and performing operations on Strings which are pulled from `Localizable.plist`-like files.

 `init` and stored objects are protected from direct access and instantiation.
 Use public extension to generate `LocalizedString` object, like so:

 `"string_key_from_localizable_plist".localized`

 */
public struct LocalizedString {
  internal let string: String
  internal let error: Error?

  /**
   Returns string with all uppercase characters replaced with lowercased ones.
   ```
   "a regular string".lowercased --> "a regular string"
   "A regular String".lowercased --> "a regular string"
   "A Regular String".lowercased --> "a regular string"
   "A REGULAR STRING".lowercased --> "a regular string"
   ```
   */
  public var lowercased: String {
    string.localizedLowercase
  }

  /**
   Returns string with all lowercase characters replaced with uppercased ones.
   ```
   "a regular string".lowercased --> "A REGULAR STRING"
   "A regular String".lowercased --> "A REGULAR STRING"
   "A Regular String".lowercased --> "A REGULAR STRING"
   "A REGULAR STRING".lowercased --> "A REGULAR STRING"
   ```
   */
  public var uppercased: String {
    string.localizedUppercase
  }

  /**
   Returns string with all words starting with uppercase letter.
   ```
   "a regular string".lowercased --> "A Regular String"
   "A regular String".lowercased --> "A Regular String"
   "A Regular String".lowercased --> "A Regular String"
   "A REGULAR STRING".lowercased --> "A Regular String"
   ```
   */
  public var capitalizedAllWords: String {
    string.localizedCapitalized.capitalized
  }

  /**
   Returns string with first character always uppercased.
   ```
   "a regular string".lowercased --> "A regular string"
   "A regular String".lowercased --> "A regular string"
   "A Regular String".lowercased --> "A regular string"
   "A REGULAR STRING".lowercased --> "A regular string"
   ```
   */
  public var capitalized: String {
    string.uppercasedFirst
  }

  /**
   Returns string with no modifications.
   ```
   "a regular string".lowercased --> "a regular string"
   "A regular String".lowercased --> "A regular String"
   "A Regular String".lowercased --> "A Regular String"
   "A REGULAR STRING".lowercased --> "A REGULAR STRING"
   ```
   */
  public var asIs: String {
    string
  }
}
