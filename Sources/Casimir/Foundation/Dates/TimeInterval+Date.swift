import Foundation

public extension TimeInterval {
  var date: Date {
    Date(timeIntervalSince1970: self)
  }
}
