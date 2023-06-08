@testable import Casimir
import XCTest

internal final class FoundationRandomableTestCase: XCTestCase {
  func test_int_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Int.self is Randomable.Type)
    XCTAssertNoThrow(Int.random())
    XCTAssertNoThrow(Int.randoms())
  }

  func test_float_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Float.self is Randomable.Type)
    XCTAssertNoThrow(Float.random())
    XCTAssertNoThrow(Float.randoms())
  }

  func test_double_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Double.self is Randomable.Type)
    XCTAssertNoThrow(Double.random())
    XCTAssertNoThrow(Double.randoms())
  }

  func test_string_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(String.self is Randomable.Type)
    XCTAssertNoThrow(String.random())
    XCTAssertNoThrow(String.randoms())
  }

  func test_character_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Character.self is Randomable.Type)
    XCTAssertNoThrow(Character.random())
    XCTAssertNoThrow(Character.randoms())
  }

  func test_date_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Date.self is Randomable.Type)
    XCTAssertNoThrow(Date.random())
    XCTAssertNoThrow(Date.randoms())
  }

  func test_bool_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Bool.self is Randomable.Type)
    XCTAssertNoThrow(Bool.random())
    XCTAssertNoThrow(Bool.randoms())
  }

  func test_url_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(URL.self is Randomable.Type)
    XCTAssertNoThrow(URL.random())
    XCTAssertNoThrow(URL.randoms())
  }

  func test_optional_int_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<Int>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<Int>.random())
    XCTAssertNoThrow(Optional<Int>.randoms())
  }

  func test_optional_float_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<Float>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<Float>.random())
    XCTAssertNoThrow(Optional<Float>.randoms())
  }

  func test_optional_double_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<Double>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<Double>.random())
    XCTAssertNoThrow(Optional<Double>.randoms())
  }

  func test_optional_string_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<String>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<String>.random())
    XCTAssertNoThrow(Optional<String>.randoms())
  }

  func test_optional_character_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<Character>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<Character>.random())
    XCTAssertNoThrow(Optional<Character>.randoms())
  }

  func test_optional_date_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<Date>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<Date>.random())
    XCTAssertNoThrow(Optional<Date>.randoms())
  }

  func test_optional_bool_conformsToRandomable_andSuccessfullyProducesRandomValue() {
    XCTAssertTrue(Optional<Bool>.self is Randomable.Type)
    XCTAssertNoThrow(Optional<Bool>.random())
    XCTAssertNoThrow(Optional<Bool>.randoms())
  }

  func test_optional_int_withNilToValueRatioBeingMin_returnsValue() {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    XCTAssertNotNil(
      Optional<Int>.random(
        nilToValueRatio: 0.00,
        &randomNumberGenerator
      )
    )
  }

  func test_optional_int_withNilToValueRatioBeingMax_returnsNil() {
    var randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator()
    XCTAssertNil(
      Optional<Int>.random(
        nilToValueRatio: 1.00,
        &randomNumberGenerator
      )
    )
  }
}
