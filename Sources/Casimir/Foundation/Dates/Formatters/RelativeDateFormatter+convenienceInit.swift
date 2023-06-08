import Foundation

public extension RelativeDateTimeFormatter {
  convenience init(dateTimeStyle: DateTimeStyle = .named,
                   unitsStyle: UnitsStyle = .abbreviated,
                   locale: Locale = .autoupdatingCurrent,
                   calendar: Calendar = .autoupdatingCurrent) {
    self.init()
    self.dateTimeStyle = dateTimeStyle
    self.unitsStyle = unitsStyle
    self.locale = locale
    self.calendar = calendar
  }
}
