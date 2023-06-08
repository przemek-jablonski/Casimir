import Casimir
import SwiftUI
import XCTest

internal final class InvalidsTestCase: XCTestCase {
  func test_float_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertTrue(Float(1) is Invalid)
    XCTAssertNoThrow(Float.invalid)
  }

  func test_double_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertTrue(Double(1) is Invalid)
    XCTAssertNoThrow(Double.invalid)
  }

  func test_int_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertTrue(Int(1) is Invalid)
    XCTAssertNoThrow(Int.invalid)
  }

  func test_string_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertTrue(String() is Invalid)
    XCTAssertNoThrow(String.invalid)
  }

  func test_character_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertTrue(Character(unicodeScalarLiteral: " ") is Invalid)
    XCTAssertNoThrow(Character.invalid)
  }

  func test_date_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertTrue(Date() is Invalid)
    XCTAssertNoThrow(Date.invalid)
  }
}
