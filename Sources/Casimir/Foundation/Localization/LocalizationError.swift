import Foundation

public protocol LocalizationErrorDelegate: class {
    func localizationError(raised error: Error)
}

//swiftlint:disable identifier_name
public enum LocalizationError: Error {

    public static weak var delegate: LocalizationErrorDelegate? = nil
    
    case pathForLocalizedStringsFileNotFound(for: String)
    case unableToRetrieveBundleForLocalizedStrings(for: String)
    case unableToFindLocalizedEntry(for: String)
    case unknownError(for: String)

}
