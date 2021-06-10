import Foundation

public extension Calendar {
    var today: Date {
        startOfDay(for: Date())
    }

    var yearPast: Date? {
        date(byAdding: .year, value: -1, to: today)
    }

    var yearFuture: Date? {
        date(byAdding: .year, value: 1, to: today)
    }
}
