import Casimir
import XCTest

internal final class StringIsEmptyNoWhitespacesTestCase: XCTestCase {
  internal func test_isEmptyNoWhitespaces_forEmptyString_returnsTrue() {
    XCTAssertEqual("".isEmptyNoWhitespaces, true)
  }

  internal func test_isEmptyNoWhitespaces_forSpaceString_returnsTrue() {
    XCTAssertEqual(" ".isEmptyNoWhitespaces, true)
  }

  internal func test_isEmptyNoWhitespaces_forSpacesString_returnsTrue() {
    XCTAssertEqual("  ".isEmptyNoWhitespaces, true)
  }

  internal func test_isEmptyNoWhitespaces_forStringWithEscapedChar_returnsTrue() {
    XCTAssertEqual("\n".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\t".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\r".isEmptyNoWhitespaces, true)
  }

  internal func test_isEmptyNoWhitespaces_forStringWithEscapedChars_returnsTrue() {
    XCTAssertEqual("\n\n".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\t\t".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\r\r".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\r\t".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\t\r".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\n\r".isEmptyNoWhitespaces, true)
  }

  internal func test_isEmptyNoWhitespaces_forStringWithEscapedCharsAndSpaces_returnsTrue() {
    XCTAssertEqual(" \r\t ".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\t  \r".isEmptyNoWhitespaces, true)
    XCTAssertEqual("\n\r  ".isEmptyNoWhitespaces, true)
  }

  internal func test_isEmptyNoWhitespaces_forStringWithRegularChar_returnsFalse() {
    XCTAssertEqual("a".isEmptyNoWhitespaces, false)
    XCTAssertEqual("1".isEmptyNoWhitespaces, false)
    XCTAssertEqual("/".isEmptyNoWhitespaces, false)
  }

  internal func test_isEmptyNoWhitespaces_forStringWithRegularChars_returnsFalse() {
    XCTAssertEqual("aaa".isEmptyNoWhitespaces, false)
    XCTAssertEqual("1234".isEmptyNoWhitespaces, false)
    XCTAssertEqual("a2d2s".isEmptyNoWhitespaces, false)
  }

  internal func test_isEmptyNoWhitespaces_forStringWithSpacesAndRegularChars_returnsFalse() {
    XCTAssertEqual(" aaa".isEmptyNoWhitespaces, false)
    XCTAssertEqual("1  234 ".isEmptyNoWhitespaces, false)
    XCTAssertEqual("    a2d2s ".isEmptyNoWhitespaces, false)
  }
}
