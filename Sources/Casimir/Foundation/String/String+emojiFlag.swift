public extension String {
  /**
   Generates emoji flag from the original string.

   https:en.wikipedia.org/wiki/Regional_indicator_symbol
   */
  var emojiFlag: String {
    let unicodeEmojiBase: UInt32 = 127397
    let regionalIndicatorsRange = UnicodeScalar("🇦").value...UnicodeScalar("🇿").value
    return prefix(2)
      .uppercased()
      .unicodeScalars
      .compactMap({ UnicodeScalar(unicodeEmojiBase + $0.value) })
      .filter({ regionalIndicatorsRange.contains($0.value) })
      .unicodeScalarView
      .string
  }
}
