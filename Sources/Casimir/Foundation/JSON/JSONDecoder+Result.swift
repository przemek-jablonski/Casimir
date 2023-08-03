import Foundation

public extension JSONDecoder {
  /**
   Attempts to decode given `data` into object of `Target` type. Returns `Result`.
   */
  func decode<Target: Decodable>(_ type: Target.Type, using data: Data) -> Result<Target, Error> {
    Result { try self.decode(type, from: data) }
  }
}
