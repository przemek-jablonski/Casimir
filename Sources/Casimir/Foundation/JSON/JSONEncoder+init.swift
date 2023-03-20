import Foundation

public extension JSONEncoder {
  /**
   Initializes `JSONEncoder`, optionally applying additional settings fetched from `init` parameters.
   */
  convenience init(
    dateEncodingStrategy: JSONEncoder.DateEncodingStrategy? = nil,
    keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy? = nil,
    dataEncodingStrategy: JSONEncoder.DataEncodingStrategy? = nil,
    outputFormatting: JSONEncoder.OutputFormatting? = nil,
    nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy? = nil,
    userInfo: [CodingUserInfoKey: Any]? = nil
  ) {
    self.init()

    if let dateEncodingStrategy {
      self.dateEncodingStrategy = dateEncodingStrategy
    }

    if let keyEncodingStrategy {
      self.keyEncodingStrategy = keyEncodingStrategy
    }

    if let dataEncodingStrategy {
      self.dataEncodingStrategy = dataEncodingStrategy
    }

    if let outputFormatting {
      self.outputFormatting = outputFormatting
    }

    if let nonConformingFloatEncodingStrategy {
      self.nonConformingFloatEncodingStrategy = nonConformingFloatEncodingStrategy
    }

    if let userInfo {
      self.userInfo = userInfo
    }
  }
}
