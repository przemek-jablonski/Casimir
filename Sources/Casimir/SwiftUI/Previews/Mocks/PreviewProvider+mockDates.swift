import SwiftUI

public extension PreviewProvider {
    static func mockDates(using calendar: Calendar = .autoupdatingCurrent,
                          count: Int = 21,
                          granularity: Calendar.Component = .day) -> [Date] {
        ((0-count/2)..<(count)-count/2).map {
            calendar.date(byAdding: granularity, value: $0, to: Date()) ?? Date()
        }
    }

    static func mockDateUpperRange(using calendar: Calendar = .autoupdatingCurrent,
                                   advancingBy daysIntoFuture: Int = 30) -> Date {
        calendar.date(byAdding: .day, value: daysIntoFuture, to: Date()) ?? .distantFuture
    }

    static func mockDateLowerRange(using calendar: Calendar = .autoupdatingCurrent,
                                   goBackBy daysIntoPast: Int = 30) -> Date {
        calendar.date(byAdding: .day, value: -daysIntoPast, to: Date()) ?? .distantPast
    }
}
