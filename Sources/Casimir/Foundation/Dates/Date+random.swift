import Foundation

private let randomTimestamp = 1677970420.double
private let secondsInYear = (365 * 24 * 60 * 60).double

public extension Date {
  static var random: Date {
    Date(timeIntervalSince1970: randomTimestamp + (secondsInYear * Double.random(in: -1...1.1)))
  }
}
