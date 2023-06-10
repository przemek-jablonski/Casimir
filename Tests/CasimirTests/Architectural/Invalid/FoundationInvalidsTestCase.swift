import Casimir
import XCTest

internal final class InvalidsTestCase: XCTestCase {
  internal func test_float_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Float.invalid)
  }

  internal func test_double_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Double.invalid)
  }

  internal func test_int_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Int.invalid)
  }

  internal func test_string_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(String.invalid)
  }

  internal func test_character_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Character.invalid)
  }

  internal func test_date_conformsToInvalidProtocol_andSuccessfullyProducesInvalidValue() {
    XCTAssertNoThrow(Date.invalid)
  }
}
