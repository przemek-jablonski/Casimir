import Foundation

public extension Date {
    func byAdding(days value: Int, using calendar: Calendar) -> Date {
        calendar.date(byAdding: .day, value: value, to: self)!
    }
}
