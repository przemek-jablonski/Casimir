import XCTest
@testable import Casimir

final class StringEmojiFlagExtensionTestCase: XCTestCase {
    func test_providingTwoLetterCountryCodeFromGlobalUnicodeSpec_shouldReturnCorrectEmojiFlag() {
        XCTAssertEqual("US".emojiFlag, "🇺🇸")
        XCTAssertEqual("UA".emojiFlag, "🇺🇦")
        XCTAssertEqual("FR".emojiFlag, "🇫🇷")
        XCTAssertEqual("GB".emojiFlag, "🇬🇧")
        XCTAssertEqual("TN".emojiFlag, "🇹🇳")
        XCTAssertEqual("JP".emojiFlag, "🇯🇵")
        XCTAssertEqual("DE".emojiFlag, "🇩🇪")
        XCTAssertEqual("PL".emojiFlag, "🇵🇱")
        //        XCTAssertEqual("UK".emojiFlag, "🇬🇧")
    }

//    func test_providingTwoLetterCountryCodeFromRegionalUnicodeSpec_shouldReturnCorrectEmojiFlag() {
//
//    }

    func test_providingCountryCodeWithZeroCount_shouldReturnEmptyString() {
        XCTAssertEqual("".emojiFlag, "")
    }

//    func test_providingCountryCodeWithOneCount_shouldReturnEmptyString() {
//        XCTAssertEqual("A".emojiFlag, "")
//        XCTAssertEqual("B".emojiFlag, "")
//        XCTAssertEqual("C".emojiFlag, "")
//        XCTAssertEqual("U".emojiFlag, "")
//        XCTAssertEqual("F".emojiFlag, "")
//        XCTAssertEqual("G".emojiFlag, "")
//        XCTAssertEqual("T".emojiFlag, "")
//        XCTAssertEqual("J".emojiFlag, "")
//        XCTAssertEqual("D".emojiFlag, "")
//        XCTAssertEqual("P".emojiFlag, "")
//    }

    func test_providingCorrectCountryCodeWithCountAboveTwo_shouldFixTheStringAndReturnCorrectEmojiFlag() {
        XCTAssertEqual("USA".emojiFlag, "🇺🇸")
        XCTAssertEqual("UAA".emojiFlag, "🇺🇦")
        XCTAssertEqual("FR12334".emojiFlag, "🇫🇷")
        XCTAssertEqual("GB1111".emojiFlag, "🇬🇧")
        XCTAssertEqual("TNN".emojiFlag, "🇹🇳")
        XCTAssertEqual("JPAN".emojiFlag, "🇯🇵")
        XCTAssertEqual("DEUTSCHLAND".emojiFlag, "🇩🇪")
        XCTAssertEqual("PLCBLN".emojiFlag, "🇵🇱")
    }

//    func test_providingWrongCountryCodeWithCountAboveTwo_shouldReturnEmptyString() {
//        XCTAssertEqual("AAAA".emojiFlag, "🇺🇸")
//        XCTAssertEqual("1111UAA".emojiFlag, "🇺🇦")
//    }

    func test_providingCountryCodeWithMixedCases_shouldFixTheStringAndReturnCorrectEmojiFlag() {
        XCTAssertEqual("jP".emojiFlag, "🇯🇵")
//        XCTAssertEqual("Pj".emojiFlag, "🇯🇵")
        XCTAssertEqual("uS".emojiFlag, "🇺🇸")
        XCTAssertEqual("Ua".emojiFlag, "🇺🇦")
        XCTAssertEqual("Fr".emojiFlag, "🇫🇷")
        XCTAssertEqual("Gb".emojiFlag, "🇬🇧")
    }

    func test_providingCountryCodeWithUppercase_shouldFixTheStringAndReturnCorrectEmojiFlag() {
        XCTAssertEqual("JP".emojiFlag, "🇯🇵")
    }

    func test_providingCountryCodeWithLowercase_shouldFixTheStringAndReturnCorrectEmojiFlag() {
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
