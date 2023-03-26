extension LocalizedString: Randomable {
  public static var random: LocalizedString { String.random.localized }
  public static var randomShort: LocalizedString { LoremIpsum.short.localized }
}
