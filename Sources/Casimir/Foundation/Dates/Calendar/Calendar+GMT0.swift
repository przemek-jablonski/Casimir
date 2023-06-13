import Foundation

public extension Calendar {
  internal static var gmt0: Calendar {
    Calendar(identifier: .gregorian, timeZone: .gmt0)
  }
}
