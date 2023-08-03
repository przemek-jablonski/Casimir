import Foundation

public extension String {
  var markdown: AttributedString {
    get throws {
      return try AttributedString(
        markdown: self,
        options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
      )
    }
  }
}

public extension Optional where Wrapped == String {
  var markdown: AttributedString? {
    get throws {
      switch self {
        case .some(let string):
          return try AttributedString(markdown: string)
        case .none:
          return nil
      }
    }
  }
}
