extension LocalizedString: Randomable {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> LocalizedString {
    String.random(&randomNumberGenerator).localized
  }
}
