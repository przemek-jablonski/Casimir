import Casimir
import MapKit
import XCTest

internal final class MKCoordinateSpanMathTestCase: XCTestCase {
  internal func test_multiplyingSpanByPositiveDouble_resultsInBothSpanDeltasBeingMultipliedSeparately() {
    let originalSpanLatitudeDelta = 10.double
    let originalSpanLongitudeDelta = 10.double
    let originalSpan = MKCoordinateSpan(
      latitudeDelta: originalSpanLatitudeDelta,
      longitudeDelta: originalSpanLongitudeDelta
    )

    let modificationValue = 100.double
    let modifiedSpan = originalSpan * modificationValue

    XCTAssertEqual(modifiedSpan.longitudeDelta, originalSpan.longitudeDelta * modificationValue)
    XCTAssertEqual(modifiedSpan.latitudeDelta, originalSpan.latitudeDelta * modificationValue)
  }

  internal func test_multiplyingSpanByNegativeDouble_resultsInBothSpanDeltasBeingMultipliedSeparately() {
    let originalSpanLatitudeDelta = 10.double
    let originalSpanLongitudeDelta = 10.double
    let originalSpan = MKCoordinateSpan(
      latitudeDelta: originalSpanLatitudeDelta,
      longitudeDelta: originalSpanLongitudeDelta
    )

    let modificationValue = -1.double
    let modifiedSpan = originalSpan * modificationValue

    XCTAssertEqual(modifiedSpan.longitudeDelta, originalSpan.longitudeDelta * modificationValue)
    XCTAssertEqual(modifiedSpan.latitudeDelta, originalSpan.latitudeDelta * modificationValue)
  }

  internal func test_multiplyingSpanByZeroDouble_resultsInBothSpanDeltasBeingMultipliedSeparately() {
    let originalSpanLatitudeDelta = 10.double
    let originalSpanLongitudeDelta = 10.double
    let originalSpan = MKCoordinateSpan(
      latitudeDelta: originalSpanLatitudeDelta,
      longitudeDelta: originalSpanLongitudeDelta
    )

    let modificationValue = 0.double
    let modifiedSpan = originalSpan * modificationValue

    XCTAssertEqual(modifiedSpan.longitudeDelta, originalSpan.longitudeDelta * modificationValue)
    XCTAssertEqual(modifiedSpan.latitudeDelta, originalSpan.latitudeDelta * modificationValue)
  }

  internal func test_dividingSpanByPositiveDouble_resultsInBothSpanDeltasBeingDividedSeparately() {
    let originalSpanLatitudeDelta = 10.double
    let originalSpanLongitudeDelta = 10.double
    let originalSpan = MKCoordinateSpan(
      latitudeDelta: originalSpanLatitudeDelta,
      longitudeDelta: originalSpanLongitudeDelta
    )

    let modificationValue = 100.double
    let modifiedSpan = originalSpan / modificationValue

    XCTAssertEqual(modifiedSpan.longitudeDelta, originalSpan.longitudeDelta / modificationValue)
    XCTAssertEqual(modifiedSpan.latitudeDelta, originalSpan.latitudeDelta / modificationValue)
  }

  internal func test_dividingSpanByNegativeDouble_resultsInBothSpanDeltasBeingDividedSeparately() {
    let originalSpanLatitudeDelta = 10.double
    let originalSpanLongitudeDelta = 10.double
    let originalSpan = MKCoordinateSpan(
      latitudeDelta: originalSpanLatitudeDelta,
      longitudeDelta: originalSpanLongitudeDelta
    )

    let modificationValue = -1.double
    let modifiedSpan = originalSpan / modificationValue

    XCTAssertEqual(modifiedSpan.longitudeDelta, originalSpan.longitudeDelta / modificationValue)
    XCTAssertEqual(modifiedSpan.latitudeDelta, originalSpan.latitudeDelta / modificationValue)
  }

  internal func test_dividingSpanByZeroDouble_resultsInBothSpanDeltasBeingDividedSeparately() {
    let originalSpanLatitudeDelta = 10.double
    let originalSpanLongitudeDelta = 10.double
    let originalSpan = MKCoordinateSpan(
      latitudeDelta: originalSpanLatitudeDelta,
      longitudeDelta: originalSpanLongitudeDelta
    )

    let modificationValue = 0.double
    let modifiedSpan = originalSpan / modificationValue

    XCTAssertEqual(modifiedSpan.longitudeDelta, originalSpan.longitudeDelta / modificationValue)
    XCTAssertEqual(modifiedSpan.latitudeDelta, originalSpan.latitudeDelta / modificationValue)
  }

  func test_comparingTwoSpans_resultsInAverageDeltasBeingCompared() {
    let spanALatitudeDelta = 0.double
    let spanALongitudeDelta = 100.double
    let spanA = MKCoordinateSpan(
      latitudeDelta: spanALatitudeDelta,
      longitudeDelta: spanALongitudeDelta
    )

    let spanBLatitudeDelta = 100.double
    let spanBLongitudeDelta = 100.double
    let spanB = MKCoordinateSpan(
      latitudeDelta: spanBLatitudeDelta,
      longitudeDelta: spanBLongitudeDelta
    )

    XCTAssertEqual(
      spanA > spanB,
      (spanA.latitudeDelta + spanA.longitudeDelta) / 2 > (spanB.latitudeDelta + spanB.longitudeDelta) / 2
    )
  }
}
