import Foundation

public extension JSONEncoder {
  /**
   Attempts to encode given `value` into `Data` object. Returns `Result`.
   */
  func encode<Target: Encodable>(_ value: Target) -> Result<Data, Error> {
    Result { try self.encode(value) }
  }
}
