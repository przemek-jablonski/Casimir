import Casimir
import XCTest

internal final class StringEmojiFlagExtensionTestCase: XCTestCase {
  internal func test_providingTwoLetterCountryCodeFromGlobalUnicodeSpec_shouldReturnCorrectEmojiFlag() {
    XCTAssertEqual("US".emojiFlag, "🇺🇸")
    XCTAssertEqual("UA".emojiFlag, "🇺🇦")
    XCTAssertEqual("FR".emojiFlag, "🇫🇷")
    XCTAssertEqual("GB".emojiFlag, "🇬🇧")
    XCTAssertEqual("TN".emojiFlag, "🇹🇳")
    XCTAssertEqual("JP".emojiFlag, "🇯🇵")
    XCTAssertEqual("DE".emojiFlag, "🇩🇪")
    XCTAssertEqual("PL".emojiFlag, "🇵🇱")
  }

  internal func test_providingCountryCodeWithZeroCount_shouldReturnEmptyString() {
    XCTAssertEqual("".emojiFlag, "")
  }

  internal func test_providingCorrectCountryCodeWithCountAboveTwo_shouldFixTheStringAndReturnCorrectEmojiFlag() {
    XCTAssertEqual("USA".emojiFlag, "🇺🇸")
    XCTAssertEqual("UAA".emojiFlag, "🇺🇦")
    XCTAssertEqual("FR12334".emojiFlag, "🇫🇷")
    XCTAssertEqual("GB1111".emojiFlag, "🇬🇧")
    XCTAssertEqual("TNN".emojiFlag, "🇹🇳")
    XCTAssertEqual("JPAN".emojiFlag, "🇯🇵")
    XCTAssertEqual("DEUTSCHLAND".emojiFlag, "🇩🇪")
    XCTAssertEqual("PLCBLN".emojiFlag, "🇵🇱")
  }

  internal func test_providingCountryCodeWithMixedCases_shouldFixTheStringAndReturnCorrectEmojiFlag() {
    XCTAssertEqual("jP".emojiFlag, "🇯🇵")
    XCTAssertEqual("uS".emojiFlag, "🇺🇸")
    XCTAssertEqual("Ua".emojiFlag, "🇺🇦")
    XCTAssertEqual("Fr".emojiFlag, "🇫🇷")
    XCTAssertEqual("Gb".emojiFlag, "🇬🇧")
  }

  internal func test_providingCountryCodeWithUppercase_shouldFixTheStringAndReturnCorrectEmojiFlag() {
    XCTAssertEqual("JP".emojiFlag, "🇯🇵")
  }

  internal func test_providingCountryCodeWithLowercase_shouldFixTheStringAndReturnCorrectEmojiFlag() {
    XCTAssertEqual("us".emojiFlag, "🇺🇸")
    XCTAssertEqual("ua".emojiFlag, "🇺🇦")
    XCTAssertEqual("fr".emojiFlag, "🇫🇷")
    XCTAssertEqual("gb".emojiFlag, "🇬🇧")
    XCTAssertEqual("tn".emojiFlag, "🇹🇳")
    XCTAssertEqual("jp".emojiFlag, "🇯🇵")
    XCTAssertEqual("de".emojiFlag, "🇩🇪")
    XCTAssertEqual("pl".emojiFlag, "🇵🇱")
  }

}
