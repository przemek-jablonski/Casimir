import Foundation

@available(iOS 15.0, *)
public extension JSONDecoder {
  /**
   Initializes `JSONDecoder`, optionally applying additional settings fetched from `init` parameters.
   */
  convenience init(
    dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = nil,
    keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil,
    dataDecodingStrategy: JSONDecoder.DataDecodingStrategy? = nil,
    allowsJSON5: Bool? = nil,
    assumesTopLevelDictionary: Bool? = nil,
    nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy? = nil
  ) {
    self.init(
      dateDecodingStrategy: dateDecodingStrategy,
      keyDecodingStrategy: keyDecodingStrategy,
      dataDecodingStrategy: dataDecodingStrategy,
      nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy
    )
    
    if let allowsJSON5 {
      self.allowsJSON5 = allowsJSON5
    }
    
    if let assumesTopLevelDictionary {
      self.assumesTopLevelDictionary = assumesTopLevelDictionary
    }
  }
}

public extension JSONDecoder {
  convenience init(
    dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = nil,
    keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil,
    dataDecodingStrategy: JSONDecoder.DataDecodingStrategy? = nil,
    nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy? = nil,
    userInfo: [CodingUserInfoKey: Any]? = nil
  ) {
    self.init()
    if let dateDecodingStrategy {
      self.dateDecodingStrategy = dateDecodingStrategy
    }
    
    if let keyDecodingStrategy {
      self.keyDecodingStrategy = keyDecodingStrategy
    }
    
    if let nonConformingFloatDecodingStrategy {
      self.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
    }
    
    if let userInfo {
      self.userInfo = userInfo
    }
  }
}
