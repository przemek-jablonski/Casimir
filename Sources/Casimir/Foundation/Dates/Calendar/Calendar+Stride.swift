import Foundation

public extension Calendar {
  /**
   Generates collection of Dates between `startingDate` and `finishingDate` according to `granularity`.
   */
  func stride(
    from startingDate: Date,
    to finishingDate: Date,
    enumerating granularity: Calendar.Component,
    every enumerationValue: Int = 1
  ) -> [Date] {
    var dates = [Date]()

    var temporaryDate = startingDate
    while temporaryDate <= finishingDate {
      dates.append(temporaryDate)
      guard let date = date(byAdding: granularity, value: enumerationValue, to: temporaryDate) else {
        return []
      }
      temporaryDate = date
    }

    return dates
  }
}
