import Foundation

public extension String {
  /**
   Returns the `LocalizedString`, treating the original String value as the localization key.
   This method always returns value - if given key couldn't be found, then returned `LocalizedString` contains requested key.
   The error is propagated through the `LocalizationError` API.
   */
  var localized: LocalizedString {
    var localizedString = NSLocalizedString(self, comment: "")
    var error: LocalizationError?

    if let localizationError = validateLocalized(string: localizedString, for: self) {
      if isRunningAsSwiftUIPreview() {
        localizedString = self
      } else {
        localizedString = "🈲[" + localizedString + "]🈲"
      }

      error = localizationError
      LocalizationError.delegate?.localizationError(raised: localizationError)
    }

    return LocalizedString(string: localizedString, error: error)
  }

  /**
   Returns the `LocalizedString`, treating the original String value as the localization key, with `formattingArguments` used to format the result.
   */
  func localized(
    _ formattingArguments: String...
  ) -> LocalizedString {
    localized(unsafelyFormattedWith: formattingArguments)
  }

  /**
   Returns the `LocalizedString`, treating the original String value as the localization key, with `formattingArguments` used to format the result.
   */
  func localized(
    unsafelyFormattedWith formattingArguments: [CVarArg]
  ) -> LocalizedString {
    let localizedString = self.localized
    return LocalizedString(
      string: String(format: localizedString.string, arguments: formattingArguments),
      error: localizedString.error
    )
  }

  private func validateLocalized(string localized: String, for key: String) -> LocalizationError? {
    guard localized.lowercased() != key.lowercased() else {

      //            // TODO: might want to add this actually, but right now it doesnt really work
      //            guard let path = Bundle.main.path(forResource: Locale.current.identifier, ofType: "lproj") else {
      //                return .pathForLocalizedStringsFileNotFound(for: self)
      //            }

      //            guard Bundle(path: path) != nil else {
      //                return .unableToRetrieveBundleForLocalizedStrings(for: self)
      //            }

      return .unableToFindLocalizedEntry(for: self)
      //            return .unknownError(for: self)
    }
    return nil
  }
}
