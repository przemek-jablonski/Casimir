import Foundation

public extension Calendar {
  init(identifier: Calendar.Identifier, timeZone: TimeZone) {
    self.init(identifier: identifier)
    self.timeZone = timeZone
  }
}
