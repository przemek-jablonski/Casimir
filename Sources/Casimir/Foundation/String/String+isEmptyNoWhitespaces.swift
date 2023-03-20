import Foundation

// swiftlint:disable force_unwrapping

public extension String {
  /**
   Returns `true` if string is empty or is constructed from whitespaces / newlines only.

   - Note: Will return `true` when the string is empty (`""`), and also returns `true` if string has only whitespaces (eg. `" "`, `"\n"`, `"\n "`).
   */
  var isEmptyNoWhitespaces: Bool {
    // TODO: test that
    filter({ !CharacterSet.whitespacesAndNewlines.contains($0.unicodeScalars.first!) }).isEmpty
  }
}
