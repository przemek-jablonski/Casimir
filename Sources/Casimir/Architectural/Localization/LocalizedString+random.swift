extension LocalizedString: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> LocalizedString {
    String.random(&randomNumberGenerator).localized
  }

//  public static var random: LocalizedString { String.random.localized }
//  public static var randomShort: LocalizedString { LoremIpsum.short.localized }
}
