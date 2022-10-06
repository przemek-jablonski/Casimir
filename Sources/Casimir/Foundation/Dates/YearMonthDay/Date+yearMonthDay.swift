import Foundation

public extension Date {
    init(calendar: Calendar, yearMonthDay: YearMonthDay, hourMinutes: HourMinutes? = nil) {
        guard let date = DateComponents(
            calendar: calendar,
            year: yearMonthDay.year,
            month: yearMonthDay.month,
            day: yearMonthDay.day,
            hour: hourMinutes?.hour ?? nil,
            minute: hourMinutes?.minutes ?? nil).date else {
                fatalError("Couldn't construct date object from given input " +
                    "(YYYY/MM/DD: \(yearMonthDay), HH:mm: \(String(describing: hourMinutes))")
        }
        self.init(timeIntervalSince1970: date.timeIntervalSince1970)
    }
}

public extension Calendar {
    func dateWith(yearMonthDay: YearMonthDay, hourMinutes: HourMinutes? = nil) -> Date {
        Date(calendar: self, yearMonthDay: yearMonthDay, hourMinutes: hourMinutes)
    }
}
