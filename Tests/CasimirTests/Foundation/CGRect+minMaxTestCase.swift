@testable import Casimir
import XCTest

internal final class CGRectMinMaxTestCase: XCTestCase {

  internal func test_rectWithNonZeroValues_shouldReturnProperMinPoint() {
    let rect = CGRect(x: 50, y: 75, width: 100, height: 150)
    XCTAssertEqual(CGPoint(x: 50, y: 75), rect.min)
  }

  internal func test_rectWithNonZeroValues_shouldReturnProperMaxPoint() {
    let rect = CGRect(x: 50, y: 75, width: 100, height: 150)
    XCTAssertEqual(CGPoint(x: 50 + 100, y: 75 + 150), rect.max)
  }

  internal func test_rectWithNonZeroValuesWithNegativeOrigin_shouldReturnProperMinPoint() {
    let rect = CGRect(x: -50, y: -75, width: 300, height: 300)
    XCTAssertEqual(CGPoint(x: -50, y: -75), rect.min)
  }

  internal func test_rectWithNonZeroValuesWithNegativeOrigin_shouldReturnProperMaxPoint() {
    let rect = CGRect(x: -200, y: -300, width: 100, height: 100)
    XCTAssertEqual(CGPoint(x: -200 + 100, y: -300 + 100), rect.max)
  }

  internal func test_rectWithNegativeDimensions_shouldReturnProperMinPoint() {
    let rect = CGRect(x: 100, y: 150, width: -300, height: -300)
    XCTAssertEqual(CGPoint(x: 100 - 300, y: 150 - 300), rect.min)
  }

  internal func test_rectWithNegativeDimensions_shouldReturnProperMaxPoint() {
    let rect = CGRect(x: 100, y: 150, width: -300, height: -300)
    XCTAssertEqual(CGPoint(x: 100, y: 150), rect.max)
  }

  internal func test_rectWith00Origin_shouldReturnProperMinPoint() {
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    XCTAssertEqual(CGPoint.zero, rect.min)
  }

  internal func test_rectWith00Origin_shouldReturnProperMaxPoint() {
    let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    XCTAssertEqual(CGPoint(x: 100, y: 100), rect.max)
  }

  internal func test_rectWithZeroedValues_shouldReturnProperMinPoint() {
    let rect = CGRect.zero
    XCTAssertEqual(CGPoint.zero, rect.min)
  }

  internal func test_rectWithZeroedValues_shouldReturnProperMaxPoint() {
    let rect = CGRect.zero
    XCTAssertEqual(CGPoint.zero, rect.max)
  }

  internal func test_rectWithZeroedValues_shouldReturnTheSameMinAndMaxPoints() {
    let rect = CGRect.zero
    XCTAssertEqual(rect.min, rect.max)
  }

  internal func test_initWithMinMaxValues_shouldCreateRectWithProperDimensions() {
    XCTAssertEqual(CGRect(x: 100, y: 100, width: 400, height: 600),
                   CGRect(min: CGPoint(x: 100, y: 100), max: CGPoint(x: 500, y: 700))
    )
  }

  internal func test_initWithInvertedMinMaxValues_shouldCreateRectWithProperDimensions() {
    XCTAssertEqual(CGRect(x: 100, y: 100, width: 400, height: 600),
                   CGRect(min: CGPoint(x: 500, y: 700), max: CGPoint(x: 100, y: 100))
    )
  }

  internal func test_initWith00Points_shouldCreateZeroRect() {
    XCTAssertEqual(CGRect.zero,
                   CGRect(min: CGPoint(x: 0, y: 0), max: CGPoint(x: 0, y: 0))
    )
  }
}
