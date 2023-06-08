import Casimir
import SwiftUI
import XCTest

internal final class InvalidsTestCase: XCTestCase {
  func test_float_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Float.invalid)
  }

  func test_double_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Double.invalid)
  }

  func test_int_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Int.invalid)
  }

  func test_string_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(String.invalid)
  }

  func test_character_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Character.invalid)
  }

  func test_date_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Date.invalid)
  }
}
