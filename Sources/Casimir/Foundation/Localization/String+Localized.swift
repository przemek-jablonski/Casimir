import Foundation

public extension String {
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
