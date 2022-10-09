import Foundation

// Files
public typealias FileNameNoExtension = String
public typealias AssetNameNoExtension = String
public typealias ImagePath = String

// Dates
public typealias CurrentDate = Date
public typealias UnixTimestamp = TimeInterval
public typealias YearMonthDay = (year: Int, month: Int, day: Int)
public typealias HourMinutes = (hour: Int, minutes: Int)

// Selections
public typealias Enabled = Bool
public typealias Selected = Bool

// HTTP
public typealias HTTPAddress = String

public typealias Success = Bool
public typealias Failure = Bool

public typealias Action = () -> Void
public typealias Operation = () -> Void
