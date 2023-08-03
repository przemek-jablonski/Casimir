import Foundation

public extension String {
  func ifEmpty(
    replaceWith replacement: String
  ) -> Self {
    self.isEmptyNoWhitespaces ? replacement : self
  }
}

public extension Optional where Wrapped == String {
  func ifEmpty(
    replaceWith replacement: String
  ) -> Wrapped {
    self?.ifEmpty(
      replaceWith: replacement
    ) ?? replacement
  }
}
