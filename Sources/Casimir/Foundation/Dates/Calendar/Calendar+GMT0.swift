import Foundation

public extension Calendar {
  static var gmt0: Calendar {
    Calendar(identifier: .gregorian, timeZone: .gmt0)
  }
}
