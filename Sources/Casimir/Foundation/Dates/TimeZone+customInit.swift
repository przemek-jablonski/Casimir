import Foundation

// swiftlint:disable force_unwrapping
public extension TimeZone {
  internal static var gmt0: TimeZone {
    TimeZone(secondsFromGMT: 0)!
  }
}
// swiftlint:enable force_unwrapping
