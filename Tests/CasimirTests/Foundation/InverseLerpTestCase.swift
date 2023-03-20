@testable import Casimir
import XCTest

// TODO: remove
final class InverseLerpTestCase: XCTestCase {
  func test_ilerpingMinimumValueInRange_shouldReturn000() {
    XCTAssertEqual(ilerp(50, min: 50, max: 100), 0.00)
  }

  func test_ilerpingSmallValueInRange_shouldReturn100() {
    XCTAssertEqual(ilerp(60.0.float, min: 50.0.float, max: 100.0.float), 0.20)
  }

  func test_ilerpingMiddleValueInRange_shouldReturn100() {
    XCTAssertEqual(ilerp(75.0, min: 50.0, max: 100.0), 0.50)
  }

  func test_ilerpingLargeValueInRange_shouldReturn100() {
    XCTAssertEqual(ilerp(99.cgFloat, min: 50.cgFloat, max: 100.cgFloat), 0.98)
  }

  func test_ilerpingMaximumValueInRange_shouldReturn100() {
    XCTAssertEqual(ilerp(100, min: 50, max: 100), 1.00)
  }

  func test_ilerpingValueAboveMaxInRange_shouldClampAndReturn100() {
    XCTAssertEqual(ilerp(123, min: 50, max: 100), 1.00)
  }

  func test_ilerpingValueBelowMinInRange_shouldClampAndReturn000() {
    XCTAssertEqual(ilerp(-15, min: 50, max: 100), 0.00)
  }

  func test_ilerpingMinimumValueInInvertedRange_shouldBehaveNormallyAndReturn000() {
    XCTAssertEqual(ilerp(50, min: 100, max: 50), 0.00)
  }

  func test_ilerpingSmallValueInInvertedRange_shouldBehaveNormallyAndReturn100() {
    XCTAssertEqual(ilerp(65, min: 100, max: 50), 0.30)
  }

  func test_ilerpingMiddleValueInInvertedRange_shouldBehaveNormallyAndReturn100() {
    XCTAssertEqual(ilerp(75, min: 100, max: 50), 0.50)
  }

  func test_ilerpingLargeValueInInvertedRange_shouldBehaveNormallyAndReturn100() {
    XCTAssertEqual(ilerp(85, min: 100, max: 50), 0.70)
  }

  func test_ilerpingMaximumValueInInvertedRange_shouldBehaveNormallyAndReturn100() {
    XCTAssertEqual(ilerp(100, min: 100, max: 50), 1.00)
  }
}
