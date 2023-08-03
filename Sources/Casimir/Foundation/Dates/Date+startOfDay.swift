import Foundation

public extension Date {
  var startOfDay: Date {
    Calendar.current.startOfDay(for: self)
  }
}
