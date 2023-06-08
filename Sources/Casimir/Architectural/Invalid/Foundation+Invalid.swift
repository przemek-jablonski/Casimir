import Foundation

extension Int: Invalid {
  public static var invalid: Self {
    Int.min + 1
  }
}

extension Float: Invalid {
  public static var invalid: Self {
    Float(Int.invalid)
  }
}

extension Double: Invalid {
  public static var invalid: Self {
    Double(Int.invalid)
  }
}

extension String: Invalid {
  public static var invalid: Self {
    ""
  }
}

extension Character: Invalid {
  public static var invalid: Self {
    " "
  }
}

extension Date: Invalid {
  public static var invalid: Self {
    Calendar.current.date(byAdding: .day, value: 1, to: .distantPast) ?? .distantPast
  }
}
