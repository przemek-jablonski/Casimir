import Foundation

public extension Date {
    func byAdding(_ component: Calendar.Component, _ value: Int, calendar: Calendar = .current) -> Date {
        calendar.date(byAdding: component, value: value, to: self) ?? Date()
    }
    
    func byAdding(days value: Int, using calendar: Calendar) -> Date {
        calendar.date(byAdding: .day, value: value, to: self)!
    }
}
