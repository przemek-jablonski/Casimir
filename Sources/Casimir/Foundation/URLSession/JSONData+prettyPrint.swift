import Foundation

// based on: https://gist.github.com/cprovatas/5c9f51813bc784ef1d7fcbfb89de74fe
public extension Data {

  /// Returns the `Data`
  var prettyPrinted: NSString {
    guard let object = try? JSONSerialization.jsonObject(
      with: self,
      options: []
    ) else {
      return "prettyPrinted error: Data doesn't seem to be a JSON dictionary"
    }

    guard let data = try? JSONSerialization.data(
      withJSONObject: object,
      options: [
        .prettyPrinted,
        .sortedKeys,
        .withoutEscapingSlashes
      ]
    ) else {
      return "prettyPrinted error: Unable to serialise data from JSON dictionary"
    }

    guard let prettyPrintedString = NSString(
      data: data,
      encoding: String.Encoding.utf8.rawValue
    ) else {
      return "prettyPrinted error: Unable to print serialised JSON dictionary"
    }

    return prettyPrintedString
  }
}
