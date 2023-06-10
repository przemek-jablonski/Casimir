import Foundation

public protocol LocalizationErrorDelegate: AnyObject {
  func localizationError(raised error: Error)
}

public enum LocalizationError: Error {
  public static weak var delegate: LocalizationErrorDelegate?
  case pathForLocalizedStringsFileNotFound(for: String)
  case unableToRetrieveBundleForLocalizedStrings(for: String)
  case unableToFindLocalizedEntry(for: String)
  case unknownError(for: String)
}
