import Foundation

// swiftlint:disable force_unwrapping

public extension TimeZone {
  static var gmt0: TimeZone {
    TimeZone(secondsFromGMT: 0)!
  }
}
