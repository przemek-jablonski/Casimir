@testable import Casimir
import XCTest

internal final class FoundationRandomableTestCase: XCTestCase {
  internal func test_int_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Int.random())
    XCTAssertNoThrow(Int.randoms())
  }

  internal func test_float_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Float.random())
    XCTAssertNoThrow(Float.randoms())
  }

  internal func test_double_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Double.random())
    XCTAssertNoThrow(Double.randoms())
  }

  internal func test_string_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(String.random())
    XCTAssertNoThrow(String.randoms())
  }

  internal func test_character_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Character.random())
    XCTAssertNoThrow(Character.randoms())
  }

  internal func test_date_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Date.random())
    XCTAssertNoThrow(Date.randoms())
  }

  internal func test_bool_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Bool.random())
    XCTAssertNoThrow(Bool.randoms())
  }

  internal func test_url_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(URL.random())
    XCTAssertNoThrow(URL.randoms())
  }

  internal func test_optional_int_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Int?.random())
    XCTAssertNoThrow(Int?.randoms())
  }

  internal func test_optional_float_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Float?.random())
    XCTAssertNoThrow(Float?.randoms())
  }

  internal func test_optional_double_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Double?.random())
    XCTAssertNoThrow(Double?.randoms())
  }

  internal func test_optional_string_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(String?.random())
    XCTAssertNoThrow(String?.randoms())
  }

  internal func test_optional_character_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Character?.random())
    XCTAssertNoThrow(Character?.randoms())
  }

  internal func test_optional_date_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertNoThrow(Date?.random())
    XCTAssertNoThrow(Date?.randoms())
  }

  internal func test_optional_bool_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    // swiftlint:disable discouraged_optional_boolean
    XCTAssertNoThrow(Bool?.random())
    XCTAssertNoThrow(Bool?.randoms())
    // swiftlint:enable discouraged_optional_boolean
  }

  internal func test_optional_int_withNilToValueRatioBeingMin_returnsValue() {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    XCTAssertNotNil(Int?.random(
      nilToValueRatio: 0.00,
      &randomNumberGenerator
    )
    )
  }

  internal func test_optional_int_withNilToValueRatioBeingMax_returnsNil() {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    XCTAssertNil(Int?.random(
      nilToValueRatio: 1.00,
      &randomNumberGenerator
    )
    )
  }
}
