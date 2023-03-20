@testable import Casimir
import XCTest

final class LerpTestCase: XCTestCase {
  // check types, CGFloat, Double, Float etc.
  func test_lerpingWithWeightingOf0_shouldReturnLowerBound() {
    let min = 10.0
    let max = 100.0
    let weighting = 0.0
    XCTAssertEqual(lerp(weighting, min: min, max: max), 10.0)
  }

  func test_lerpingWithWeightingOf1_shouldReturnUpperBound() {
    let min = 10.0
    let max = 100.0
    let weighting = 1.0
    XCTAssertEqual(lerp(weighting, min: min, max: max), 100.0)
  }

  func test_lerpingWithWeightingOf025And0To1Range_shouldReturnInterpolationOf033ofRange() {
    let min = 0.0
    let max = 100.0
    let weighting = 0.25
    XCTAssertEqual(lerp(weighting, min: min, max: max), 25)
  }

  func test_lerpingWithWeightingOf033_shouldReturnInterpolationOf033ofRange() {
    let min = 10.0.float
    let max = 100.0.float
    let weighting = 0.33.float
    XCTAssertEqual(lerp(weighting, min: min, max: max), 39.7)
  }

  func test_lerpingWithWeightingOf050_shouldReturnHalfOfRange() {
    let min = 10.0
    let max = 100.0
    let weighting = 0.50
    XCTAssertEqual(lerp(weighting, min: min, max: max), 55.0)
  }

  func test_lerpingWithWeightingOf075_shouldReturnInterpolationOf075ofRange() {
    let min = 10.0.cgFloat
    let max = 100.0.cgFloat
    let weighting = 0.75.cgFloat
    XCTAssertEqual(lerp(weighting, min: min, max: max), 77.5)
  }

  func test_lerpingWithWeightingBelow0_shouldInterpolateBelowLowerBoundAccordingly() {
    let min = 10.0
    let max = 100.0
    let weighting = -0.50
    XCTAssertEqual(lerp(weighting, min: min, max: max), -35)
  }

  func test_lerpingWithWeightingAbove1_shouldInterpolateAboveUpperBoundAccordingly() {
    let min = 10.0
    let max = 100.0
    let weighting = 1.33
    XCTAssertEqual(lerp(weighting, min: min, max: max), 129.7)
  }

  func test_lerpingWithInvertedRange_shouldPerformInverseInterpolation() {
    let min = 100.0
    let max = 10.0
    let weighting = 0.33
    XCTAssertEqual(lerp(weighting, min: min, max: max), 39.7)
  }

  func test_lerpingWithWeightingOf0AndInvertedRange_shouldBehaveNormallyAndReturnLowerBound() {
    let min = 100.0
    let max = 10.0
    let weighting = 0.0
    XCTAssertEqual(lerp(weighting, min: min, max: max), 10.0)
  }

  func test_lerpingWithWeightingOf1AndInvertedRange_shouldBehaveNormallyAndReturnUpperBound() {
    let min = 100.0
    let max = 10.0
    let weighting = 1.0
    XCTAssertEqual(lerp(weighting, min: min, max: max), 100.0)
  }

  func test_lerpingWithWeightingOf025And0To1RangeAndInvertedRange_shouldBehaveNormallyAndReturnInterpolationOf033ofRange() {
    let min = 100.0
    let max = 0.0
    let weighting = 0.25
    XCTAssertEqual(lerp(weighting, min: min, max: max), 25)
  }

  func test_lerpingWithWeightingOf033AndInvertedRange_shouldBehaveNormallyAndReturnInterpolationOf033ofRange() {
    let min = 100.0
    let max = 10.0
    let weighting = 0.33
    XCTAssertEqual(lerp(weighting, min: min, max: max), 39.7)
  }
}
